import subprocess


ONLY_AND_OR_MUX = "abc -g AND,OR,MUX"

ONLY_DFFE_NP = "dfflegalize -cell $_DFFE_PP_ 01"    # $_DFFE_PP_ and $_DFFE_PN_


def run_ys(script: str):
    res = subprocess.run(
        ["yosys"],
        text=True,
        input=script,
        capture_output=True
    )

    print(res.stdout)
    if res.returncode != 0:
        print("Yosys failed: " + res.stderr)


def synth_verilog(input_file: str, output_file: str, cmds: list[str], top: str = "toplevel"):
    script = f"read_verilog {input_file}\n"
    script += f"synth -noabc -top {top}\n"
    for cmd in cmds:
        script += cmd + "\n"
    script += "proc\n"
    script += f"write_json {output_file}"
    run_ys(script)


if __name__ == "__main__":
    input_file = "elephant/tests/verilog/nerv.v"
    output_file = "elephant/tests/json/nerv.json"
    synth_verilog(input_file, output_file, cmds=[ONLY_DFFE_NP, ONLY_AND_OR_MUX], top="nerv")