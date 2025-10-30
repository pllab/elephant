import subprocess
from argparse import ArgumentParser


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
    if input_file[-5:] == ".blif":
        script = f"read_blif {input_file}\n"
    else: 
        script = f"read_verilog -sv {input_file}\n"
    script += f"synth -noabc -flatten -top {top}\n"
    for cmd in cmds:
        script += cmd + "\n"
    script += "proc\n"
    script += f"write_json {output_file}"
    run_ys(script)


if __name__ == "__main__":
    parser = ArgumentParser("Synthesize Verilog, output to JSON.")
    parser.add_argument(
        "--input", type=str, dest="input_file", help="name of input verilog file"
    )
    parser.add_argument(
        "--top", type=str, dest="top", help="name of top module"
    )
    parser.add_argument(
        "--output", type=str, dest="output_file", help="name of output json file"
    )
    parser.add_argument("--nodfflegalize", default=False, action="store_true")
    args = parser.parse_args()

    if args.nodfflegalize:
        cmds = [ONLY_AND_OR_MUX]
    else:
        cmds = [ONLY_DFFE_NP, ONLY_AND_OR_MUX]
    
    input_file = args.input_file
    top = args.top
    output_file = args.output_file
    synth_verilog(input_file, output_file, cmds=cmds, top=top)
