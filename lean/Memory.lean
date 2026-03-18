import Mathlib

/-!
# Fungible Memory: Basic Definitions

We model a synchronous memory with `k`-bit addresses and `w`-bit data words,
giving `2^k` rows. The height is never stored directly — it is always `2^k`.

Parallel composition (`⊕`) combines two independent memories, each retaining
its own state. Writes to one submemory's ports do not affect the other's state.
-/

/-- A memory state maps each `k`-bit address to a `w`-bit data word. -/
def MemoryState (w k : Nat) : Type :=
  BitVec k → BitVec w

/-- A read port: an address to read and the resulting data word. -/
structure ReadPort (k w : Nat) where
  addr : BitVec k
  data : BitVec w

/-- A write port: a write-enable signal, an address, and a data word to write. -/
structure WritePort (k w : Nat) where
  en   : BitVec 1
  addr : BitVec k
  data : BitVec w

/-- A memory: either a base memory with its own state and ports, or a parallel
    composition of two independent memories each with their own state. -/
inductive Memory (w k : Nat) where
  | leaf (state      : MemoryState w k)
         (readPorts  : List (ReadPort  k w))
         (writePorts : List (WritePort k w)) : Memory w k
  | par  (m1 m2 : Memory w k) : Memory w k

/-- Parallel composition: two independent memories running side by side. -/
infixl:65 " ⊕ " => Memory.par

/-- Apply one write port to a memory state.
    The write takes effect only when `en` is high. -/
def applyWrite (s : MemoryState w k) (wp : WritePort k w) : MemoryState w k :=
  fun addr => if wp.en == 1#1 && addr == wp.addr then wp.data else s addr

/-- Apply a list of write ports left-to-right.
    On address conflicts, the last write wins. -/
def applyWrites (s : MemoryState w k) (wps : List (WritePort k w)) : MemoryState w k :=
  wps.foldl applyWrite s

/-- Advance a memory by one step: each leaf applies its write ports to its own
    state; parallel submemories step independently. -/
def Memory.step : Memory w k → Memory w k
  | .leaf s rps wps => .leaf (applyWrites s wps) rps wps
  | .par m1 m2      => m1.step ⊕ m2.step

/-- Flatten a memory tree into its constituent leaves (state + write ports).
    Read ports are discarded — equivalence is purely about write behavior. -/
def Memory.leaves : Memory w k → List (MemoryState w k × List (WritePort k w))
  | .leaf s _ wps => [(s, wps)]
  | .par m1 m2    => m1.leaves ++ m2.leaves

/-- Equivalence of a single leaf: same initial state implies same post-write contents. -/
def LeafEquiv (l1 l2 : MemoryState w k × List (WritePort k w)) : Prop :=
  l1.1 = l2.1 →
  ∀ addr : BitVec k, applyWrites l1.1 l1.2 addr = applyWrites l2.1 l2.2 addr

/-- Semantic behavioral equivalence: flatten both memory trees and compare leaves
    pointwise. This admits associativity of `⊕` since `Memory.leaves` maps `par`
    to `++`, and associativity of `++` is `List.append_assoc`. -/
def BehaviorallyEquivalent (m1 m2 : Memory w k) : Prop :=
  List.Forall₂ LeafEquiv m1.leaves m2.leaves

theorem par_assoc (m1 m2 m3 : Memory w k) :
    BehaviorallyEquivalent ((m1 ⊕ m2) ⊕ m3) (m1 ⊕ (m2 ⊕ m3)) := by
  simp [BehaviorallyEquivalent, Memory.leaves, List.append_assoc,
        List.forall₂_same, fun l => show LeafEquiv l l from fun _ _ => rfl]

/-- Splitting read ports across two parallel leaves (sharing the same state and write
    ports) does not affect write behavior: for any address, the post-write state of
    every leaf in the full memory equals that of every leaf in the split memory.
    Note: `BehaviorallyEquivalent` cannot express this directly because the two sides
    have different numbers of leaves (1 vs 2); this statement is the appropriate
    substitute. -/
theorem readPort_split
    (s : MemoryState w k)
    (rs : List (ReadPort k w))
    (r : ReadPort k w)
    (ws : List (WritePort k w)) :
    ∀ (addr : BitVec k)
      (l1 l2 : MemoryState w k × List (WritePort k w)),
      l1 ∈ (Memory.leaf s (rs ++ [r]) ws).leaves →
      l2 ∈ ((Memory.leaf s rs ws) ⊕ (Memory.leaf s [r] ws)).leaves →
      applyWrites l1.1 l1.2 addr = applyWrites l2.1 l2.2 addr := by
  simp [Memory.leaves]

lemma applyWrite_extractLsb'
    (start len : Nat)
    (s : MemoryState w k)
    (wp : WritePort k w)
    (a : BitVec k) :
    (applyWrite s wp a).extractLsb' start len =
      applyWrite (fun b => (s b).extractLsb' start len)
                 { en := wp.en, addr := wp.addr, data := wp.data.extractLsb' start len }
                 a := by
  simp only [applyWrite]
  split_ifs <;> rfl

lemma applyWrites_extractLsb'
    (start len : Nat)
    (s : MemoryState w k)
    (wps : List (WritePort k w))
    (a : BitVec k) :
    (applyWrites s wps a).extractLsb' start len =
      applyWrites (fun b => (s b).extractLsb' start len)
                  (wps.map fun p => { en := p.en, addr := p.addr, data := p.data.extractLsb' start len })
                  a := by
  induction wps generalizing s with
  | nil => simp [applyWrites]
  | cons wp wps ih =>
    simp only [applyWrites, List.foldl, List.map]
    have key : (fun b => (applyWrite s wp b).extractLsb' start len) =
               applyWrite (fun b => (s b).extractLsb' start len)
                          { en := wp.en, addr := wp.addr, data := wp.data.extractLsb' start len } :=
      funext (applyWrite_extractLsb' start len s wp)
    rw [← key]
    exact ih _

/-- Splitting a memory by data width: applying writes to the full-width state gives the
    same result as applying width-split write ports to the split states and recombining.
    Concretely, bits [0, w') come from the low-half memory and bits [w', w) from the
    high-half memory.
    Note: the two halves have different data widths (w' and w - w'), so they cannot be
    expressed as `Memory.par` (which requires equal widths); this theorem is therefore
    stated directly in terms of `applyWrites` on `MemoryState`. -/
theorem width_split
    {w' : Nat} (hw : w' ≤ w)
    (s  : MemoryState w k)
    (ws : List (WritePort k w)) :
    let lo_st : MemoryState w' k :=
      fun a => (s a).extractLsb' 0 w'
    let hi_st : MemoryState (w - w') k :=
      fun a => (s a).extractLsb' w' (w - w')
    let ws_lo : List (WritePort k w') :=
      ws.map fun p => { en := p.en, addr := p.addr, data := p.data.extractLsb' 0 w' }
    let ws_hi : List (WritePort k (w - w')) :=
      ws.map fun p => { en := p.en, addr := p.addr, data := p.data.extractLsb' w' (w - w') }
    ∀ a : BitVec k,
      (applyWrites hi_st ws_hi a).append (applyWrites lo_st ws_lo a) =
        BitVec.cast (Nat.sub_add_cancel hw).symm (applyWrites s ws a) := by
  -- Introduce all four `let` bindings by name, then the ∀ variable
  intro lo_st hi_st ws_lo ws_hi a
  -- `simp` can't pattern-match through the opaque local let-names, so we use
  -- `exact` (which does use definitional equality) to state each half explicitly.
  have hhi : applyWrites hi_st ws_hi a = (applyWrites s ws a).extractLsb' w' (w - w') :=
    (applyWrites_extractLsb' w' (w - w') s ws a).symm
  have hlo : applyWrites lo_st ws_lo a = (applyWrites s ws a).extractLsb' 0 w' :=
    (applyWrites_extractLsb' 0 w' s ws a).symm
  rw [hhi, hlo]
  -- Instantiate extractLsb'_append_extractLsb' at the cast of our result,
  -- then use extractLsb'_cast to strip the cast from both extractLsb' calls.
  have h := @BitVec.extractLsb'_append_extractLsb' (w - w') w'
              (BitVec.cast (Nat.sub_add_cancel hw).symm (applyWrites s ws a))
  simp only [BitVec.extractLsb'_cast] at h
  exact h

-- Five private helpers for `applyWrite_msb_split`

/-- Any k-bit address equals cast(msb_bit ++ lower_bits), using
    `BitVec.extractLsb'_append_extractLsb'` applied to a cast. -/
private lemma addr_recon {k : Nat} (hk : 1 ≤ k) (addr : BitVec k) :
    addr = BitVec.cast (Nat.add_sub_cancel' hk)
            (addr.extractLsb' (k - 1) 1 ++ addr.extractLsb' 0 (k - 1)) := by
  have h : 1 + (k - 1) = k := Nat.add_sub_cancel' hk
  have key := @BitVec.extractLsb'_append_extractLsb' 1 (k - 1) (BitVec.cast h.symm addr)
  simp only [BitVec.extractLsb'_cast] at key
  conv_lhs =>
    rw [show addr = BitVec.cast (by omega : 1 + (k - 1) = k) (BitVec.cast h.symm addr) from by simp]
  rw [← key]

/-- When `addr.msb = true`, the top 1-bit slice of `addr` is `1#1`. -/
private lemma msb_true_bit {k : Nat} (addr : BitVec k) (h : addr.msb = true) :
    addr.extractLsb' (k - 1) 1 = 1#1 := by
  simp [BitVec.msb, BitVec.getMsbD] at h
  apply BitVec.eq_of_getLsbD_eq; intro i hi
  simp only [BitVec.getLsbD_extractLsb', BitVec.getLsbD_ofNat, Nat.lt_one_iff] at *
  subst hi; simp [h]

/-- When `addr.msb = false`, the top 1-bit slice of `addr` is `0#1`. -/
private lemma msb_false_bit {k : Nat} (hk : 1 ≤ k) (addr : BitVec k) (h : addr.msb = false) :
    addr.extractLsb' (k - 1) 1 = 0#1 := by
  apply BitVec.eq_of_getLsbD_eq; intro i hi
  simp only [BitVec.getLsbD_extractLsb', BitVec.getLsbD_ofNat, Nat.lt_one_iff] at *
  subst hi; simp
  simp [BitVec.msb, BitVec.getMsbD] at h
  exact Bool.eq_true_imp_eq_false.mp fun a => h hk

/-- Two k-bit addresses with the same msb-slice are equal iff their lower slices agree. -/
private lemma addr_eq_iff_lower {k : Nat} (hk : 1 ≤ k) (a b : BitVec k)
    (hmsb : a.extractLsb' (k - 1) 1 = b.extractLsb' (k - 1) 1) :
    a = b ↔ a.extractLsb' 0 (k - 1) = b.extractLsb' 0 (k - 1) := by
  constructor
  · intro h; rw [h]
  · intro h; rw [addr_recon hk a, addr_recon hk b, hmsb, h]

/-- Core case of `applyWrite_msb_split` when `addr.msb = true`. -/
private lemma applyWrite_msb_split_hi {w k : Nat} (hk : 1 ≤ k)
    (s : BitVec k → BitVec w) (wp_en : BitVec 1) (wp_addr : BitVec k) (wp_data : BitVec w)
    (addr : BitVec k) (haddr : addr.msb = true) :
    (if wp_en = 1#1 ∧ addr = wp_addr then wp_data else s addr) =
    (if (if wp_addr.msb = true then wp_en else 0#1) = 1#1 ∧
          addr.extractLsb' 0 (k - 1) = wp_addr.extractLsb' 0 (k - 1)
     then wp_data
     else s (BitVec.cast (Nat.add_sub_cancel' hk) (1#1 ++ addr.extractLsb' 0 (k - 1)))) := by
  have h_addr : addr = BitVec.cast (Nat.add_sub_cancel' hk) (1#1 ++ addr.extractLsb' 0 (k - 1)) :=
    by conv_lhs => rw [addr_recon hk addr, msb_true_bit addr haddr]
  -- `Bool.eq_false_or_eq_true b : b = true ∨ b = false` (true-first ordering)
  rcases Bool.eq_false_or_eq_true wp_addr.msb with hwp | hwp
  · -- wp_addr.msb = true: same MSB → conditions equivalent, else-branches equal
    simp only [hwp, ite_true]
    apply if_congr
    · rw [propext (and_congr_right' (addr_eq_iff_lower hk addr wp_addr
          (by rw [msb_true_bit addr haddr, msb_true_bit wp_addr hwp])))]
    · rfl
    · rw [← h_addr]
  · -- wp_addr.msb = false: MSB mismatch → both conditions are False
    have h_ne : addr ≠ wp_addr := by
      intro heq; rw [heq] at haddr; exact absurd (haddr.symm.trans hwp) (by decide)
    simp only [hwp, h_ne, and_false, ite_false]
    rw [if_neg (by simp)]
    exact congr_arg s h_addr

/-- Core case of `applyWrite_msb_split` when `addr.msb = false`. -/
private lemma applyWrite_msb_split_lo {w k : Nat} (hk : 1 ≤ k)
    (s : BitVec k → BitVec w) (wp_en : BitVec 1) (wp_addr : BitVec k) (wp_data : BitVec w)
    (addr : BitVec k) (haddr : addr.msb = false) :
    (if wp_en = 1#1 ∧ addr = wp_addr then wp_data else s addr) =
    (if (if wp_addr.msb = true then 0#1 else wp_en) = 1#1 ∧
          addr.extractLsb' 0 (k - 1) = wp_addr.extractLsb' 0 (k - 1)
     then wp_data
     else s (BitVec.cast (Nat.add_sub_cancel' hk) (0#1 ++ addr.extractLsb' 0 (k - 1)))) := by
  have h_addr : addr = BitVec.cast (Nat.add_sub_cancel' hk) (0#1 ++ addr.extractLsb' 0 (k - 1)) :=
    by conv_lhs => rw [addr_recon hk addr, msb_false_bit hk addr haddr]
  rcases Bool.eq_false_or_eq_true wp_addr.msb with hwp | hwp
  · -- wp_addr.msb = true: MSB mismatch → both conditions are False
    have h_ne : addr ≠ wp_addr := by
      intro heq; rw [heq] at haddr; exact absurd (hwp.symm.trans haddr) (by decide)
    simp only [hwp, h_ne, and_false, ite_true, ite_false]
    rw [if_neg (by simp)]
    exact congr_arg s h_addr
  · -- wp_addr.msb = false: same MSB → conditions equivalent, else-branches equal
    simp only [hwp, Bool.false_eq_true, ite_false]
    apply if_congr
    · rw [propext (and_congr_right' (addr_eq_iff_lower hk addr wp_addr
          (by rw [msb_false_bit hk addr haddr, msb_false_bit hk wp_addr hwp])))]
    · rfl
    · rw [← h_addr]

lemma applyWrite_msb_split
    {k : Nat} (hk : 1 ≤ k)
    (s  : MemoryState w k)
    (wp : WritePort k w)
    (addr : BitVec k) :
    applyWrite s wp addr =
      if addr.msb
      then applyWrite (fun a => s (BitVec.cast (Nat.add_sub_cancel' hk) (1#1 ++ a)))
                      { en   := if wp.addr.msb then wp.en else 0#1
                        addr := wp.addr.extractLsb' 0 (k - 1)
                        data := wp.data }
                      (addr.extractLsb' 0 (k - 1))
      else applyWrite (fun a => s (BitVec.cast (Nat.add_sub_cancel' hk) (0#1 ++ a)))
                      { en   := if wp.addr.msb then 0#1 else wp.en
                        addr := wp.addr.extractLsb' 0 (k - 1)
                        data := wp.data }
                      (addr.extractLsb' 0 (k - 1)) := by
  simp only [applyWrite]
  rcases Bool.eq_false_or_eq_true addr.msb with hlo | hhi
  · simp [hlo]
    exact applyWrite_msb_split_hi hk s wp.en wp.addr wp.data addr hlo
  · simp [hhi]
    exact applyWrite_msb_split_lo hk s wp.en wp.addr wp.data addr hhi


lemma applyWrites_msb_split
    {k : Nat} (hk : 1 ≤ k)
    (s  : MemoryState w k)
    (wps : List (WritePort k w))
    (addr : BitVec k) :
    applyWrites s wps addr =
      if addr.msb
      then applyWrites (fun a => s (BitVec.cast (Nat.add_sub_cancel' hk) (1#1 ++ a)))
                       (wps.map fun p => { en   := if p.addr.msb then p.en else 0#1
                                           addr := p.addr.extractLsb' 0 (k - 1)
                                           data := p.data })
                       (addr.extractLsb' 0 (k - 1))
      else applyWrites (fun a => s (BitVec.cast (Nat.add_sub_cancel' hk) (0#1 ++ a)))
                       (wps.map fun p => { en   := if p.addr.msb then 0#1 else p.en
                                           addr := p.addr.extractLsb' 0 (k - 1)
                                           data := p.data })
                       (addr.extractLsb' 0 (k - 1)) := by
  induction wps generalizing s with
  | nil =>
    -- applyWrites s [] addr = s addr, and s addr = s(cast(b++lower)) by addr_recon
    simp only [applyWrites, List.foldl, List.map]
    rcases Bool.eq_false_or_eq_true addr.msb with h | h
    · simp only [h, ite_true]
      exact congr_arg s (by conv_lhs => rw [addr_recon hk addr, msb_true_bit addr h])
    · simp only [h, Bool.false_eq_true, ite_false]
      exact congr_arg s (by conv_lhs => rw [addr_recon hk addr, msb_false_bit hk addr h])
  | cons wp wps ih =>
    simp only [applyWrites, List.foldl, List.map]
    -- Use the IH with initial state = applyWrite s wp
    have step := ih (applyWrite s wp)
    simp only [applyWrites] at step
    rw [step]
    rcases Bool.eq_false_or_eq_true addr.msb with h | h
    · simp only [h, ite_true]
      have key : (fun a => applyWrite s wp (BitVec.cast (Nat.add_sub_cancel' hk) (1#1 ++ a))) =
                 applyWrite (fun a => s (BitVec.cast (Nat.add_sub_cancel' hk) (1#1 ++ a)))
                            { en   := if wp.addr.msb then wp.en else 0#1
                              addr := wp.addr.extractLsb' 0 (k - 1)
                              data := wp.data } :=
        funext fun a => by
          have hmsb : (BitVec.cast (Nat.add_sub_cancel' hk) (1#1 ++ a)).msb = true :=
            by simp [BitVec.msb_cast, BitVec.msb_append]
          have hlsb : (BitVec.cast (Nat.add_sub_cancel' hk) (1#1 ++ a)).extractLsb' 0 (k - 1) = a :=
            by simp [BitVec.extractLsb'_cast, BitVec.extractLsb'_append_eq_right]
          rw [applyWrite_msb_split hk s wp _, if_pos hmsb, hlsb]
      rw [key]
    · simp only [h, Bool.false_eq_true, ite_false]
      have key : (fun a => applyWrite s wp (BitVec.cast (Nat.add_sub_cancel' hk) (0#1 ++ a))) =
                 applyWrite (fun a => s (BitVec.cast (Nat.add_sub_cancel' hk) (0#1 ++ a)))
                            { en   := if wp.addr.msb then 0#1 else wp.en
                              addr := wp.addr.extractLsb' 0 (k - 1)
                              data := wp.data } :=
        funext fun a => by
          have hmsb : (BitVec.cast (Nat.add_sub_cancel' hk) (0#1 ++ a)).msb = false :=
            by simp [BitVec.msb_cast, BitVec.msb_append]
          have hlsb : (BitVec.cast (Nat.add_sub_cancel' hk) (0#1 ++ a)).extractLsb' 0 (k - 1) = a :=
            by simp [BitVec.extractLsb'_cast, BitVec.extractLsb'_append_eq_right]
          rw [applyWrite_msb_split hk s wp _, if_neg (by simp [hmsb]), hlsb]
      rw [key]

/-- Splitting a memory by height: a memory with `k`-bit addresses splits into two
    memories with `(k-1)`-bit addresses.  The MSB of each address selects the half
    (0 → low, 1 → high); the remaining `k-1` bits are the sub-address within that half.

    Write routing: each write port's enable is gated by the address MSB so that it
    only fires in the correct half.

    Read multiplexing: reading address `addr` from the full memory equals reading
    `addr.extractLsb' 0 (k-1)` from whichever half is selected by `addr.msb`.

    Note: unlike `width_split`, both halves have the same type `Memory w (k-1)`, so
    `Memory.par` is type-correct here; but the routing logic lives at the `applyWrites`
    level regardless. -/
theorem height_split
    {k : Nat} (hk : 1 ≤ k)
    (s  : MemoryState w k)
    (ws : List (WritePort k w)) :
    let s_lo : MemoryState w (k - 1) :=
      fun a => s (BitVec.cast (Nat.add_sub_cancel' hk) (0#1 ++ a))
    let s_hi : MemoryState w (k - 1) :=
      fun a => s (BitVec.cast (Nat.add_sub_cancel' hk) (1#1 ++ a))
    let ws_lo : List (WritePort (k - 1) w) :=
      ws.map fun p => { en   := if p.addr.msb then 0#1 else p.en
                        addr := p.addr.extractLsb' 0 (k - 1)
                        data := p.data }
    let ws_hi : List (WritePort (k - 1) w) :=
      ws.map fun p => { en   := if p.addr.msb then p.en else 0#1
                        addr := p.addr.extractLsb' 0 (k - 1)
                        data := p.data }
    ∀ addr : BitVec k,
      applyWrites s ws addr =
        if addr.msb
        then applyWrites s_hi ws_hi (addr.extractLsb' 0 (k - 1))
        else applyWrites s_lo ws_lo (addr.extractLsb' 0 (k - 1)) := by
  intro s_lo s_hi ws_lo ws_hi addr
  exact applyWrites_msb_split hk s ws addr

-- ============================================================================
-- Write port splitting
-- ============================================================================

/-- Applying writes from a concatenated list equals applying the first batch
    then the second.  Follows directly from `List.foldl_append`. -/
lemma applyWrites_append
    (s : MemoryState w k)
    (ws1 ws2 : List (WritePort k w)) :
    applyWrites s (ws1 ++ ws2) = applyWrites (applyWrites s ws1) ws2 := by
  simp [applyWrites, List.foldl_append]

/-- If no write in the list fires at address `a`, the state at `a` is unchanged. -/
lemma applyWrites_inactive
    (s : MemoryState w k)
    (wps : List (WritePort k w))
    (a : BitVec k)
    (h : ∀ wp ∈ wps, (wp.en == 1#1 && a == wp.addr) = false) :
    applyWrites s wps a = s a := by
  induction wps generalizing s with
  | nil => simp [applyWrites]
  | cons wp wps ih =>
    show applyWrites (applyWrite s wp) wps a = s a
    rw [ih (applyWrite s wp) (fun wp' hmem => h wp' (List.mem_cons_of_mem _ hmem))]
    simp [applyWrite, h wp (List.mem_cons_self ..)]

/-- The result of `applyWrites` at address `a` depends only on `s a`, not on
    `s b` for any other address `b`.  Each `applyWrite` either overwrites the
    value at `a` (independent of `s`) or passes through `s a`. -/
lemma applyWrites_depends_only_on_addr
    (s1 s2 : MemoryState w k)
    (wps : List (WritePort k w))
    (a : BitVec k)
    (h : s1 a = s2 a) :
    applyWrites s1 wps a = applyWrites s2 wps a := by
  induction wps generalizing s1 s2 with
  | nil => simp [applyWrites, h]
  | cons wp wps ih =>
    show applyWrites (applyWrite s1 wp) wps a = applyWrites (applyWrite s2 wp) wps a
    apply ih
    simp only [applyWrite]; split_ifs <;> [rfl; exact h]

/-- When some write fires at address `a`, the result is independent of the
    initial state.  The fired write overwrites `s a`, so different starting
    states produce the same result. -/
lemma applyWrites_active_indep
    (s1 s2 : MemoryState w k)
    (wps : List (WritePort k w))
    (a : BitVec k)
    (h : ∃ wp ∈ wps, (wp.en == 1#1 && a == wp.addr) = true) :
    applyWrites s1 wps a = applyWrites s2 wps a := by
  induction wps generalizing s1 s2 with
  | nil => rcases h with ⟨_, hmem, _⟩; simp at hmem
  | cons wp wps ih =>
    show applyWrites (applyWrite s1 wp) wps a = applyWrites (applyWrite s2 wp) wps a
    rcases h with ⟨wp', hmem, hfire⟩
    rw [List.mem_cons] at hmem
    rcases hmem with rfl | hmem
    · exact applyWrites_depends_only_on_addr _ _ _ _ (by simp [applyWrite, hfire])
    · exact ih (applyWrite s1 wp) (applyWrite s2 wp) ⟨wp', hmem, hfire⟩

/-- General write port split: when a write-port list is partitioned as
    `ws_a ++ ws_b`, the result at address `a` comes from whichever half
    contains the last writer.

    • If some write in `ws_b` fires at `a`, the result equals `applyWrites s ws_b a`
      (by `applyWrites_active_indep`, the `ws_a` prefix doesn't matter).
    • If no write in `ws_b` fires at `a`, the result equals `applyWrites s ws_a a`
      (by `applyWrites_inactive`, `ws_b` passes through unchanged).

    This is the algebraic core of write-port splitting with full forwarding:
    each copy of the memory applies all writes (its own + forwarded), so both
    copies always have state `applyWrites s (ws_a ++ ws_b)`.  The condition
    `∃ wp ∈ ws_b, …` is the multiplexer that selects which copy to read from. -/
theorem writePort_split_general
    (s : MemoryState w k)
    (ws_a ws_b : List (WritePort k w))
    (a : BitVec k) :
    applyWrites s (ws_a ++ ws_b) a =
      if ∃ wp ∈ ws_b, (wp.en == 1#1 && a == wp.addr) = true
      then applyWrites s ws_b a
      else applyWrites s ws_a a := by
  rw [show applyWrites s (ws_a ++ ws_b) a =
        applyWrites (applyWrites s ws_a) ws_b a from by rw [applyWrites_append]]
  split
  · case isTrue h =>
    exact (applyWrites_active_indep _ _ _ _ h).symm
  · case isFalse h =>
    push_neg at h
    have h' : ∀ wp ∈ ws_b, (wp.en == 1#1 && a == wp.addr) = false :=
      fun wp hmem => Bool.eq_false_iff.mpr (h wp hmem)
    exact applyWrites_inactive _ _ _ h'

/-- Write port split (2 ports): a memory with write ports `[w1, w2]` behaves
    as two single-write-port copies with a read multiplexer.  If `w2` fired
    at address `a`, read from the `w2` copy; otherwise read from the `w1` copy.

    With full forwarding both copies apply all writes, so their states stay in
    sync: `applyWrites s [w1, w2]`.  The multiplexer condition
    `w2.en == 1#1 && a == w2.addr` is the bypass/forwarding logic that detects
    when `w2` has the freshest value at `a`. -/
theorem writePort_split
    (s : MemoryState w k)
    (w1 w2 : WritePort k w)
    (a : BitVec k) :
    applyWrites s [w1, w2] a =
      if w2.en == 1#1 && a == w2.addr
      then applyWrites s [w2] a
      else applyWrites s [w1] a := by
  simp only [applyWrites, List.foldl, applyWrite]
  split_ifs <;> rfl
