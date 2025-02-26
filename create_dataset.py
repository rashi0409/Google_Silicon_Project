import os
import re
import pandas as pd

# Extract features from Behavioral RTL Code
def extract_rtl_features(verilog_file):
    features = {
        "Num_AND": 0, "Num_OR": 0, "Num_XOR": 0, "Num_NAND": 0,
        "Num_NOR": 0, "Num_XNOR": 0, "Num_INV": 0, "Num_FlipFlops": 0, 
        "Num_Inputs": 0, "Num_Outputs": 0, "Num_Assigns": 0, "Num_Always_Blocks": 0
    }

    if not os.path.exists(verilog_file):
        print(f"Error: RTL file '{verilog_file}' not found!")
        return features

    with open(verilog_file, 'r') as file:
        code = file.read()

    # Count logical operations in expressions (Behavioral)
    features["Num_AND"] = len(re.findall(r"\b&\b", code)) + len(re.findall(r"\b&&\b", code))
    features["Num_OR"] = len(re.findall(r"\b\|\b", code)) + len(re.findall(r"\b\|\|\b", code))
    features["Num_XOR"] = len(re.findall(r"\^", code))
    features["Num_NAND"] = len(re.findall(r"\bnand\b", code, re.IGNORECASE))
    features["Num_NOR"] = len(re.findall(r"\bnor\b", code, re.IGNORECASE))
    features["Num_XNOR"] = len(re.findall(r"\bxnor\b", code, re.IGNORECASE))
    features["Num_INV"] = len(re.findall(r"~", code))

    # Structural Features
    features["Num_FlipFlops"] = len(re.findall(r"always\s*@\s*\(posedge", code, re.IGNORECASE))  # Count FFs
    features["Num_Assigns"] = len(re.findall(r"assign\s+", code))  # Count assignments
    features["Num_Always_Blocks"] = len(re.findall(r"always\s*@", code))  # Count always blocks
    
    # Count inputs and outputs
    features["Num_Inputs"] = len(re.findall(r"\binput\b", code, re.IGNORECASE))
    features["Num_Outputs"] = len(re.findall(r"\boutput\b", code, re.IGNORECASE))

    return features

# Function to create dataset
def create_dataset(rtl_files, depths, output_csv="dataset1.csv"):
    dataset = []
    for rtl, depth in zip(rtl_files, depths):
        rtl_features = extract_rtl_features(rtl)
        rtl_features["Combinational_Depth"] = depth  # Add ground truth
        dataset.append(rtl_features)

    df = pd.DataFrame(dataset)
    df.to_csv(output_csv, index=False)
    print(f"Dataset saved as {output_csv}")

# Example Usage
rtl_files = [
    "verilog_files/module_or.v",
    "verilog_files/module_full_adder.v",
    "verilog_files/module_logic_developed.v",
    "verilog_files/module_half_subtractor.v",
    "verilog_files/module_not_chain.v",
     "verilog_files/module_2flipflop.v",
    "verilog_files/module_and_nand_chain.v",
    "verilog_files/module_and.v",
    "verilog_files/module_basic_gates.v",
    "verilog_files/module_comparator.v",
     "verilog_files/module_designblockv2.v",
    "verilog_files/module_designgatesv3.v",
    "verilog_files/module_designv3.v",
    "verilog_files/module_dff.v",
    "verilog_files/module_tflipflop.v"
]
depths = [3, 2, 7,1,10,3,4,3,1,5,3,3,3,0,2]  # Known depths for training

create_dataset(rtl_files, depths)
