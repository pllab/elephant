# Ben D's PyRTL RV

This is a PyRTL repo that implements the RV32I base integer instruction set for RISC-V.
It comes in 4 flavors: single cycle, 2-stage pipeline, 3-stage pipeline, and 5-stage pipeline.

The PyRTL code here has been used in benchmarks for our control logic synthesis work;
it is also useful as an educational reference for implementing a minimal RISC-V design in PyRTL.
Credit goes to Ben Darnell for developing and testing the designs.

Contents:

* `src/`: The PyRTL source code.
* `test/`: Tests in RISC-V assembly.

## Testing

To run the test suite:

```shell
$ python3 test_cpu.py -s N
```

where `N` is the number of pipeline stages
(valid values are 1, 2, 3, and 5).
