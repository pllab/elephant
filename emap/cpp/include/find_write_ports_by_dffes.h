#ifndef FIND_WRITE_PORTS_BY_DFFES_H
#define FIND_WRITE_PORTS_BY_DFFES_H

#include <cstddef>
#include <pybind11/stl.h>
#include <unordered_map>

namespace emapcc {

// std::size_t LOG2(std::size_t n);

std::vector<int> find_orandtree_by_y(
    const std::unordered_map<int, std::pair<int, int>>& ors_cache,
    const std::unordered_map<int, std::pair<int, int>>& ands_cache,
    int y
);

std::vector<std::tuple<int, std::vector<int>, std::vector<int>>> find_write_ports_helper(
    const std::unordered_map<int, std::pair<int, int>>& ors_cache,
    const std::unordered_map<int, std::pair<int, int>>& ands_cache,
    const std::unordered_map<int, std::pair<int, int>>& dffes_cache,
    const std::vector<int>& raw_dffe_group
);

std::vector<std::vector<std::tuple<int, std::vector<int>, std::vector<int>>>> find_write_ports_by_dffes(
    const std::unordered_map<int, std::pair<int, int>>& ors_cache,
    const std::unordered_map<int, std::pair<int, int>>& ands_cache,
    const std::unordered_map<int, std::pair<int, int>>& dffes_cache,
    const std::vector<std::vector<int>>& raw_dffe_groups
);

}

#endif