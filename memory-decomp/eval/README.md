# Evaluation prep scripts

* `export_to_blif.sh`
    - Takes as argument one or more `.v` files.
    - For example, run: `./export_to_blif.sh verilog/*.v`
* `collect_stats.sh`
    - Takes as argument one or more `.v` files.
    - For example, run: `./collect_stats.sh verilog/*.v`
* `stats_to_csv.sh`
    - Takes as argument one or more `.dat` files produced from `collect_stats.sh`.
    - For example, run: `./stats_to_csv.sh verilog/*.dat`
