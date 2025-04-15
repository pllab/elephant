# Elephant implementation in Egglog

## Tests

`tests/` contains tests for every functionality. The script `./rull_all_tests` runs all tests in that folder and generates the graphs as png files. `./rull_all_tests-no-images` does what the name says and `./svg_conversion.sh <png | jpg>` deletes all svg files in the tests folder and generates png or jpg (depending on what was specified) in the `output-egraphs/` directory. 

## Rulesets

(saturate typing) (saturate writeport) (saturate writeaddress) (saturate decomp))
There are the following rulesets so far:

- typing
- readport
- readaddress
- writeport
- writeaddress
- writemask
- decomp
  
All rules can be applied with:

```sh
(run-schedule (saturate typing) (saturate readport) (saturate readaddress) (saturate typing) (saturate writeport) (saturate writeaddress) (saturate writemask) (saturate decomp))
```

---
