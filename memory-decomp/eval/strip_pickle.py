
import re
import sys

def repl(match):
    definition = match.group(0)
    module = match.group(1)

    print(f"MATCH FOUND: {module}")

    return module

def process_file(subdesign, input_file, output_file):
    with open(input_file, "r") as f:
        contents = f.read()
        pattern = r"({subdesign})_\d+".format(subdesign=subdesign)

        contents = re.sub(pattern, repl, contents, flags=re.MULTILINE)

    with open(output_file, "w") as f:
        f.write(contents)


if __name__ == "__main__":
    if len(sys.argv) < 3:
        print(f"Usage: python strip.py subdesign input.pickle.sv output.stripped.sv")
    else:
        subdesign = sys.argv[1]
        input_file = sys.argv[2]
        output_file = sys.argv[3]
        process_file(subdesign, input_file, output_file)

