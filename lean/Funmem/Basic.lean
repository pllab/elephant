-- A memory state is a function from addresses to data values (both modeled as bitvectors).
-- Because the height of the memory is a power of two, the address bitwidth is `log2 height`.
def MemoryState (width : Nat) (height : Nat) : Type :=
  BitVec height → BitVec width
  -- BitVec (Nat.log2 height) → BitVec width

-- A ReadPort has an address; its data is derived from the state.
structure ReadPort (width height : Nat) where
  addr : BitVec height
  -- addr : BitVec (Nat.log2 height)
  deriving Repr

-- A WritePort has enable, address, and data.
structure WritePort (width height : Nat) where
  enable : Bool
  -- addr : BitVec (Nat.log2 height)
  addr : BitVec height
  data : BitVec width
  deriving Repr

-- A Memory has width, height, read ports, write port, and a state.
structure Memory (w h : Nat) where
  width : Nat
  height : Nat
  read_ports : List (ReadPort w h)
  write_ports : List (WritePort w h)
  state : MemoryState w h
  -- deriving Repr

structure MemoryBase (w h : Nat) where
  width : Nat
  height : Nat
  read_port : ReadPort w h
  write_port : WritePort w h
  state : MemoryState w h

def stepWriteBase (w h : Nat) (mem : MemoryBase w h) : MemoryBase w h :=
  let wp := mem.write_port
  if wp.enable then
    { mem with
      state := fun a => if a = wp.addr then wp.data else mem.state a }
  else
    mem

-- Read a bitvector from a memory at a given address.
def read (w h : Nat) (mem : Memory w h) (addr : BitVec h) : BitVec w :=
-- def read (w h : Nat) (mem : Memory w h) (addr : BitVec (Nat.log2 h)) : BitVec w :=
  mem.state addr

-- Write to a memory: update the state at a given address.
-- def write (w h : Nat) (mem : Memory w h) (addr : BitVec (Nat.log2 h)) (data : BitVec w) : Memory w h :=
def write (w h : Nat) (mem : Memory w h) (addr : BitVec h) (data : BitVec w) : Memory w h :=
  { mem with
    state := fun a => if a = addr then data else mem.state a }

-- Evaluate one "step", applying at most one write per write port.
def stepWrite (w h : Nat) (mem : Memory w h) : Memory w h :=
  let mem' := mem
  let ports := mem.write_ports
  ports.foldl (fun m wp => if wp.enable then write w h m wp.addr wp.data else m) mem'
