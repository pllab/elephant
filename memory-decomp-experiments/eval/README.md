# Evaluation prep scripts

* `export_to_blif.sh`
 Takes as argument a `.v` file root and a toplevel
    - For example, run: `./export_to_blif.sh microbenchmarks/nerv.v nerv`
* `export_to_map.sh`
 Takes as argument a `.v` file root and a toplevel
    - For example, run: `./export_to_map.sh microbenchmarks/nerv.v nerv`
* `collect_stats.sh`
    - Takes as argument one or more `.v` files.
    - For example, run: `./collect_stats.sh microbenchmarks/*.v`
* `stats_to_csv.sh`
    - Takes as argument one or more `.dat` files produced from `collect_stats.sh`.
    - For example, run: `./stats_to_csv.sh microbenchmarks/*.dat

Pack results with:
        gzip microbenchmarks/*.elabed.v
        gzip microbenchmarks/*.blif
        gzip microbenchmarks/*.dat
        gzip microbenchmarks/*.util

Unpack results with:
        gunzip microbenchmarks/*.elabed.v
        gunzip microbenchmarks/*.blif
        gunzip microbenchmarks/*.dat
        gunzip microbenchmarks/*.util


