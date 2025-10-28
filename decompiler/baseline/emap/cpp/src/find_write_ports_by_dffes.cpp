#include "find_write_ports_by_dffes.h"

#include <future>


namespace emapcc {

// std::size_t LOG2(std::size_t n) {
//     std::size_t log = 0;
//     while (n >>= 1) {
//         ++log;
//     }
//     return log;
// }

std::vector<int> find_orandtree_by_y(
    const std::unordered_map<int, std::pair<int, int>>& ors_cache,
    const std::unordered_map<int, std::pair<int, int>>& ands_cache,
    int y
) {
    auto or_itr = ors_cache.find(y);
    if (or_itr == ors_cache.end()) {    // no OR gate found for this y
        // try to find AND gate
        auto and_itr = ands_cache.find(y);
        if (and_itr == ands_cache.end()) {  // no AND gate found for this y
            return {};  // this is not a valid OR/AND tree
        }
        auto [a, b] = and_itr->second;
        return {a, b};  // return the AND gate inputs
    }
    // OR gate found
    // recursively find the inputs of the OR gate
    auto [a, b] = or_itr->second;
    auto left_tree = find_orandtree_by_y(ors_cache, ands_cache, a);
    if (left_tree.empty()) {
        return {};  // no valid OR/AND tree found
    }
    auto right_tree = find_orandtree_by_y(ors_cache, ands_cache, b);
    if (right_tree.empty()) {
        return {};  // no valid OR/AND tree found
    }
    // combine the left and right trees
    left_tree.insert(left_tree.end(), right_tree.begin(), right_tree.end());
    return left_tree;
}

std::vector<std::tuple<int, std::vector<int>, std::vector<int>>> find_write_ports_helper(
    const std::unordered_map<int, std::pair<int, int>>& ors_cache,
    const std::unordered_map<int, std::pair<int, int>>& ands_cache,
    const std::unordered_map<int, std::pair<int, int>>& dffes_cache,
    const std::vector<int>& raw_dffe_group
) {
    std::set<int> write_enable_candidates;
    std::vector<std::tuple<int, std::vector<int>, std::vector<int>>> write_ports;
    for (const auto& dffe_q : raw_dffe_group) {
        auto dffe_it = dffes_cache.find(dffe_q);
        if (dffe_it == dffes_cache.end()) {
            return {};  // no dffe found for this q
        }
        const auto& [_, e] = dffe_it->second;   // we don't use dffe.d here
        auto orandtree = find_orandtree_by_y(ors_cache, ands_cache, e);
        if (orandtree.empty()) {
            return {};  // no valid OR/AND tree found for this e
        }
        if (write_enable_candidates.empty()) {
            write_enable_candidates.insert(orandtree.begin(), orandtree.end());
        }
        else {
            // intersect with existing candidates
            std::set<int> new_candidates;
            for (const auto& candidate : orandtree) {
                if (write_enable_candidates.find(candidate) != write_enable_candidates.end()) {
                    new_candidates.insert(candidate);
                }
            }
            write_enable_candidates = std::move(new_candidates);
        }
    }
#ifdef DEBUG
#include <iostream>
    std::cout << "Write enable candidates for group: ";
    for (const auto& we : write_enable_candidates) {
        std::cout << we << " ";
    }
    std::cout << std::endl;
#endif
    std::vector<std::tuple<int, std::vector<int>, std::vector<int>>> write_ports_for_group;
    for (const auto& we : write_enable_candidates) {
        write_ports_for_group.emplace_back(
            we,  // write enable
            std::vector<int>(),  // write address, to be filled later
            std::vector<int>()   // write data, to be filled later
        );
    }
    return write_ports_for_group;
}

std::vector<std::vector<std::tuple<int, std::vector<int>, std::vector<int>>>> find_write_ports_by_dffes(
    const std::unordered_map<int, std::pair<int, int>>& ors_cache,
    const std::unordered_map<int, std::pair<int, int>>& ands_cache,
    const std::unordered_map<int, std::pair<int, int>>& dffes_cache,
    const std::vector<std::vector<int>>& raw_dffe_groups
) {
    // returns (write enable, write address, write data) for each dffe group

    std::vector<std::future<std::vector<std::tuple<int, std::vector<int>, std::vector<int>>>>> futures;
    for (std::size_t i = 0; i < raw_dffe_groups.size(); ++i) {
        // multithreading
        futures.emplace_back(std::async(std::launch::async, find_write_ports_helper, std::cref(ors_cache), std::cref(ands_cache), std::cref(dffes_cache), std::cref(raw_dffe_groups[i])));
    }
    std::vector<std::vector<std::tuple<int, std::vector<int>, std::vector<int>>>> write_ports;
    for (auto& future : futures) {
        auto result = future.get();
        write_ports.push_back(std::move(result));
    }
    return write_ports;
}

}