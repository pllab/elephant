from argparse import ArgumentParser
from lxml import etree
from math import ceil, log2

from AbstractMem import AbstractMem


# Implementation of clog2 from Verilog
def clog2(x):
    return ceil(log2(x))


# Function to print the structure of the XCI file
def print_structure(element, indent=0):
    print("  " * indent + element.tag)
    for child in element:
        print_structure(child, indent + 1)


# Function to get the root of the XCI file
def get_root(file):
    tree = etree.parse(file)
    # Useful for debugging
    # print_structure(tree.getroot())

    return tree.getroot()


def get_namespaces(root):
    return root.nsmap


# Function to get all the components in the XCI file
def get_components(root, namespaces):
    return root.findall(".//spirit:componentInstance", namespaces=namespaces)


# Function to parse a single component in the XCI file
def extract_mem(component, namespaces):
    # Arbitrary name
    name = component.find(
        './/spirit:configurableElementValue[@spirit:referenceId="PARAM_VALUE.Component_Name"]',
        namespaces=namespaces,
    ).text
    # Assume A width == B width
    width = component.find(
        './/spirit:configurableElementValue[@spirit:referenceId="MODELPARAM_VALUE.C_READ_WIDTH_A"]',
        namespaces=namespaces,
    ).text
    # Assume A height == B height
    height = component.find(
        './/spirit:configurableElementValue[@spirit:referenceId="MODELPARAM_VALUE.C_READ_DEPTH_A"]',
        namespaces=namespaces,
    ).text
    # no mask or byte mask
    byte_en = component.find(
        './/spirit:configurableElementValue[@spirit:referenceId="PARAM_VALUE.Use_Byte_Write_Enable"]',
        namespaces=namespaces,
    ).text
    # Simple_Dual_Port_RAM == 1r1w
    # True_Dual_Port_RAM == 2r2w
    typ = component.find(
        './/spirit:configurableElementValue[@spirit:referenceId="PARAM_VALUE.Memory_Type"]',
        namespaces=namespaces,
    ).text
    # WRITE_FIRST -> rw_fwd
    b_mode = component.find(
        './/spirit:configurableElementValue[@spirit:referenceId="PARAM_VALUE.Operating_Mode_B"]',
        namespaces=namespaces,
    ).text
    # BRAM always have latch_last_read, I believe
    llr = "true"
    # Synch or Asynch
    synchronous = component.find(
        './/spirit:configurableElementValue[@spirit:referenceId="PARAM_VALUE.Assume_Synchronous_Clk"]',
        namespaces=namespaces,
    ).text
    # latch_last_read=True, asynchronous=False

    # Polish arguments
    p_width = int(width)
    p_height_log2 = clog2(int(height))
    p_name = name
    p_config = "1r1w" if typ == "Simple_Dual_Port_RAM" else "2r2w"
    p_rw_fwd = b_mode == "WRITE_FIRST"
    p_latch_last_read = llr == "true"
    p_asynchronous = synchronous == "false"

    return AbstractMem.create_mem(
        p_width,
        p_height_log2,
        p_name,
        p_config,
        rw_fwd=p_rw_fwd,
        latch_last_read=p_latch_last_read,
        asynchronous=p_asynchronous,
    )


def extract_all_memories(xci_file):
    root = get_root(xci_file)
    namespaces = get_namespaces(root)

    memories = []
    for mem in get_components(root, namespaces=namespaces):
        memories.append(extract_mem(mem, namespaces=namespaces))

    return memories


if __name__ == "__main__":
    parser = ArgumentParser(
        description="Parse an XCI file and extract component information."
    )
    parser.add_argument("xci_file", type=str, help="Path to the XCI file to be parsed")
    args = parser.parse_args()

    xci_file = args.xci_file

    memories = extract_all_memories(xci_file)
    for mem in memories:
        print(mem.name)
        print(mem.width)
        print(mem.height)
