# Artifact for _Fungible Memories for Automated Technology Mapping and Re-targeting_

The artifact is split between the fungible memory compiler and decompiler.

* Directory `compiler/` has the fungible memory compiler with automated mapper.
* Directory `decompiler/` has the memory decompiler with two implementations,
  the theoretically complete baseline, and the less complete but faster
  decompiler which incorporates some heuristics.

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


### Step 3: Run a Fungible Memory Decompiler Test


## Step-by-Step Instructions

These instructions will explain how to fully evaluate the artifact and support
the claims in the paper.

