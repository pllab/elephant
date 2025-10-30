#include "find_write_ports_by_dffes.h"
#include <pybind11/pybind11.h>


PYBIND11_MODULE(emapcc, mod) {
    mod.def("find_write_ports_by_dffes", &emapcc::find_write_ports_by_dffes, "A C++ implementation of find_write_ports_by_dffes()");
}