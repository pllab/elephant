# Artifact for _Fungible Memories for Automated Technology Mapping and Re-targeting_

The artifact is split between the fungible memory compiler and decompiler.

* Directory `compiler/` has the fungible memory compiler with automated mapper.
* Directory `decompiler/` has the memory decompiler with two implementations,
  the theoretically complete baseline, and the less complete but faster
  decompiler which incorporates some heuristics.
* Directory `decompiler/eval` contains all netlist benchmarks as JSON files
  along with the original Verilog source code they were synthesized from.

## Getting Started Guide

This repo contains a `Dockerfile` to set up the full environment to run and
evaluate the artifact. The dependencies are few and can be understood by
reading the `Dockerfile`. The `Dockerfile` is compatible with both Docker and
Podman.

### Step 1: Set Up Docker Environment

#### Step 1a

Run the `docker-build.sh` script to build the Docker image. (Depending if you
are using Docker or Podman, you may need to run the script with `sudo`/`doas`.)

```shell
$ ./docker-build.sh
```

#### Step 1b

After successfully building the Docker image, run `docker-run.sh` to launch the
Docker image, landing you at a bash shell prompt.

```shell
$ ./docker-run.sh
```


### Step 2: Run a Fungible Memory Compiler Test

At the bash prompt inside the Docker image, execute the following script in the root of the repo:

```shell
$ ./test-compiler.sh
```

This script runs the fungible memory compiler with 5 configurations (1r1w, 1rw, 2r1w, 4r1w, 4r2w) and 2 technologies (Xilinx BRAM, PyRTL MemBlock).
The fungible memory compiler will find satisfying mappings for all configurations except the 4r2w (which is expected).

Success looks like this:

```
---- test_2r1w ----
tech available: ['xilinx_bram_2rw', 'xilinx_bram_1rw']
test_2r1w@xilinx_bram_2rw
test_2r1w@xilinx_bram_2rw
===================
```

Here, the fungible memory compiler mapped a 2r1w fungible memory onto two 2rw Xilinx BRAMs.

Failure looks like this:

```
---- test_4r2w ----
tech available: ['pyrtl_memblock_2r1w']
No valid memory found
===================
```

### Step 3: Run a Fungible Memory Decompiler Test

At the bash prompt inside the Docker image, execute the following script in the root of the repo:

```shell
$ ./test-decompiler.sh
```

This script runs the memory decompiler over 4 gate-level netlists, each containing a memory block.

The output for a single test looks as follows:

```
-------------------------------------------------------------
Expected:       width=32, height=32, #read-ports=2, #write-ports=1
-------------------------------------------------------------
Testing design `test/simple_mems/mem_w32h32_2r1w.json` with top module `top`...
Database built in 0.00 seconds.
Rewrite 0 ANDNOTs
Netlist saturated in 0.00 seconds.
Found 1024 muxes with DFFs as inputs.
960 muxtree(s) reduced in 0.01 seconds.
Decoders reduced in 0.00 seconds.
1 memory extracted in 0.00 seconds.
        Memory 0: width=32, height=32, #read-ports=2, #write-ports=1
Total time: 0.02 seconds.
```

The first line details the expected memory block to be found in the netlist.
The extracted memories are listed at the end.

