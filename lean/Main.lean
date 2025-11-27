import Funmem
import Std.Tactic.BVDecide

theorem ReadPortSplitEq (k p w h : Nat)
  (h_nz : h ≠ 0)
  (p_nz : p ≠ 0)
  (w_nz : w ≠ 0)
  (h_log2 : h = 2^p)
  (k_geq2 : k ≥ 2)
  (M : Memory w h)
  (M1 : Memory w h)
  (M2 : Memory w h)
  (M_rps : M.read_ports.length = k)
  (M1_rps : M.read_ports.length = 1)
  (M2_rps : M.read_ports.length = k - 1)
  (split_read : M.read_ports = M1.read_ports ++ M2.read_ports)
  (same_write : M.write_ports = M1.write_ports ∧ M.write_ports = M2.write_ports)
  (same_state : M.state = M1.state ∧ M.state = M2.state)
  : ∀ (rp : ReadPort w h),
    let M' := stepWrite w h M
    let M1' := stepWrite w h M1
    let M2' := stepWrite w h M2
    read w h M' rp.addr = read w h M1' rp.addr ∧
    read w h M' rp.addr = read w h M2' rp.addr := by
----------------------------------------------------
    intro rp
    simp
    bv_normalize
    bv_omega

-- theorem WidthSplitEq (k l p w w' h : Nat)
--   (k_nz : k ≠ 0)
--   (l_nz : l ≠ 0)
--   (p_nz : p ≠ 0)
--   (w_nz : w ≠ 0)
--   (wp_nz_lt_w : w' ≠ 0 ∧ w' < w)
--   (h_nz : h ≠ 0)
--   (h_log2 : h = 2^p)
--   (M : Memory w h)
--   (M1 : Memory w' h)
--   (M2 : Memory (w - w') h)
--   (M_rps : M.read_ports.length = k)
--   (M1_rps : M.read_ports.length = k)
--   (M2_rps : M.read_ports.length = k)
--   : ∀ (rp : ReadPort w h),
--     let M' := stepWrite w h M
--     let M1' := stepWrite w' h M1
--     let M2' := stepWrite (w-w') h M2
--     read w h M' rp.addr = (read w' h M1' rp.addr) ++ (read (w-w') h M2' rp.addr) := by

theorem WidthSplitEqBase
  (n m n' k p : Nat)
  (n_nz : n > 1)
  (n'_nz : n' > 0)
  (n'_le_n : n' ≤ n)
  (p_nz : p > 1)
  (m_log2 : m = 2^p)
  (m_ge_1 : m > 1)
  (M : MemoryBase n m)
  (M1 : MemoryBase n' m)
  (M2 : MemoryBase (n-n') m)
  (M1_raddr : M1.read_port.addr = M.read_port.addr)
  (M2_raddr : M2.read_port.addr = M.read_port.addr)
  (M1_waddr : M1.write_port.addr = M.write_port.addr)
  (M2_waddr : M2.write_port.addr = M.write_port.addr)
  (M1_wdata : M1.write_port.data = (BitVec.extractLsb' 0 n' M.write_port.data))
  (M2_wdata : M2.write_port.data = (BitVec.extractLsb' n' (n-n') M.write_port.data))
  (M1_wenable : M1.write_port.enable = M.write_port.enable)
  (M2_wenable : M2.write_port.enable = M.write_port.enable)
  (same_state : ∀ (addr : BitVec m),
    M.state addr = cast (by rw [Nat.sub_add_cancel n'_le_n]) ((M2.state addr) ++ (M1.state addr)))
  : ∀ (addr : BitVec m),
    let M' := stepWriteBase n m M
    let M1' := stepWriteBase n' m M1
    let M2' := stepWriteBase (n-n') m M2
    M'.state addr = cast (by rw [Nat.sub_add_cancel n'_le_n])  ((M2'.state addr) ++ (M1'.state addr)) := by
  -- intro addr
  sorry


theorem HeightSplitEqBase
  (n m : Nat)
  (n_nz : n ≠ 0)
  (m_ge_2 : m ≥ 2)
  (M : MemoryBase n (2^m))
  (M1 : MemoryBase n (2^(m-1)))
  (M2 : MemoryBase n (2^(m-1)))
  (M1_raddr : M1.read_port.addr = (BitVec.extractLsb' 0 ((2^(m-1)).log2) (M.read_port.addr)))
  (M2_raddr : M2.read_port.addr = (BitVec.extractLsb' 0 ((2^(m-1)).log2) (M.read_port.addr)))
  (M1_waddr : M1.write_port.addr = (BitVec.extractLsb' 0 ((2^(m-1)).log2) (M.write_port.addr)))
  (M2_waddr : M2.write_port.addr = (BitVec.extractLsb' 0 ((2^(m-1)).log2) (M.write_port.addr)))
  (M1_wdata : M1.write_port.data = M.write_port.data)
  (M2_wdata : M2.write_port.data = M.write_port.data)
  (M1_wenable : M1.write_port.enable = (M.write_port.enable) ∧ ¬(BitVec.msb M.write_port.addr))
  (M2_wenable : M2.write_port.enable = (M.write_port.enable) ∧ BitVec.msb M.write_port.addr)
  (same_state : ∀ (addr : BitVec (2^m).log2),
    let msb := BitVec.msb addr;
    let rest := BitVec.extractLsb' 0 (2^(m-1)).log2 addr;
    if msb then
      M.state addr = M2.state rest
    else
      M.state addr = M1.state rest)
  : ∀ (addr : BitVec (2^m).log2),
    let M' := stepWriteBase n (2^m) M
    let M1' := stepWriteBase n (2^(m-1)) M1
    let M2' := stepWriteBase n (2^(m-1)) M2
    let msb := BitVec.msb addr;
    let rest := BitVec.extractLsb' 0 (2^(m-1)).log2 addr;
    if msb then
      M'.state addr = M2'.state rest
    else
      M'.state addr = M1'.state rest := by
  intro addr
  sorry



def splitWritePorts (n m : Nat) (M : Memory n (2^m)) [Decidable (m ≥ 1)] : (List (WritePort n (2^(m-1))) × List (WritePort n (2^(m-1)))) :=
  let wps := M.write_ports
  let wps1 := wps.filter (fun wp => ¬ BitVec.msb wp.addr)
  let wps2 := wps.filter (fun wp => BitVec.msb wp.addr)
  (
    wps1.map (fun wp => { wp with addr := BitVec.extractLsb' 0 ((2^(m-1)).log2) wp.addr }),
    wps2.map (fun wp => { wp with addr := BitVec.extractLsb' 0 ((2^(m-1)).log2) wp.addr })
  )


theorem HeightSplitEq (n m k l : Nat)
  (m_ge_1 : m ≥ 1)
  (n_nz : n ≠ 0)
  (m_nz : m ≠ 0)
  (k_nz : k ≠ 0)
  (l_nz : l ≠ 0)
  (M : Memory n (2^m))
  (M1 : Memory n (2^(m-1)))
  (M2 : Memory n (2^(m-1)))
  (k_rps : M.read_ports.length = k ∧ M1.read_ports.length = k ∧ M2.read_ports.length = k)
  (l_rps : M.write_ports.length = l ∧ M1.write_ports.length = l ∧ M2.write_ports.length = l)
  (k_M : k = M.read_ports.length)
  (k_M1 : k = M1.read_ports.length)
  (k_M2 : k = M2.read_ports.length)
  (l_M : l = M.write_ports.length)
  (l_M1 : l = M1.write_ports.length)
  (l_M2 : l = M2.write_ports.length)
  (hyp_rps : ∀ (i : Fin k),
             (M1.read_ports.get (Fin.cast k_M1 i)).addr = (BitVec.extractLsb' 0 ((2^(m-1)).log2) (M.read_ports.get (Fin.cast k_M i)).addr) ∧
             (M2.read_ports.get (Fin.cast k_M2 i)).addr = (BitVec.extractLsb' 0 ((2^(m-1)).log2) (M.read_ports.get (Fin.cast k_M i)).addr))
  (split_wps : (M1.write_ports, M2.write_ports) = splitWritePorts n m M)
  -- (hyp_wps : ∀ (i : Fin l),
  --            (M1.write_ports.get (Fin.cast l_M1 i)).data =  (M.write_ports.get (Fin.cast l_M i)).data ∧
  --            (M2.write_ports.get (Fin.cast l_M2 i)).data =  (M.write_ports.get (Fin.cast l_M i)).data ∧
  --            (M1.write_ports.get (Fin.cast l_M1 i)).addr = (BitVec.extractLsb' 0 ((2^(m-1)).log2) (M.write_ports.get (Fin.cast l_M i)).addr) ∧
  --            (M2.write_ports.get (Fin.cast l_M2 i)).addr = (BitVec.extractLsb' 0 ((2^(m-1)).log2) (M.write_ports.get (Fin.cast l_M i)).addr) ∧
  --            (M1.write_ports.get (Fin.cast l_M1 i)).enable = ¬(BitVec.msb (M.write_ports.get (Fin.cast l_M i)).addr) ∧
  --            (M2.write_ports.get (Fin.cast l_M2 i)).enable = (BitVec.msb (M.write_ports.get (Fin.cast l_M i)).addr))
  (same_state : ∀ (addr : BitVec (2^m).log2),
    let msb := BitVec.msb addr;
    let rest := BitVec.extractLsb' 0 (2^(m-1)).log2 addr;
    if msb then
      M.state addr = M2.state rest
    else
      M.state addr = M1.state rest)
  -- : ∀ (i : Fin M.read_ports.length),
  : ∀ (i : Fin k),
    let M' := stepWrite n (2^m) M
    let M1' := stepWrite n (2^(m-1)) M1
    let M2' := stepWrite n (2^(m-1)) M2
    -- let Maddr  :=  (M.read_ports.get i).addr
    let Maddr  :=  (M.read_ports.get (Fin.cast k_M  i)).addr
    -- let M1addr := BitVec.extractLsb ((2^(m-1)).log2) 0 Maddr
    -- let M2addr := BitVec.extractLsb ((2^(m-1)).log2) 0 Maddr
    let M1addr := (M1.read_ports.get (Fin.cast k_M1 i)).addr
    let M2addr := (M2.read_ports.get (Fin.cast k_M2 i)).addr
    read n (2^m) M' Maddr = if (BitVec.msb Maddr = true)
                                then (read n (2^(m-1)) M2' M2addr)
                                else (read n (2^(m-1)) M1' M1addr) := by
                                -- then (read n (2^(m-1)) M2' (BitVec.extractLsb' 0 ((2^(m-1)).log2) Maddr))
                                -- else (read n (2^(m-1)) M1' (BitVec.extractLsb' 0 ((2^(m-1)).log2) Maddr)) := by
  sorry
