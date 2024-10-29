import csv
import matplotlib.pyplot as plt
import numpy as np

def read_csv_to_2d_array(filename):
    with open(filename, "r") as csvfile:
        csvreader = csv.reader(csvfile, delimiter=',')
        data = [row for row in csvreader]
    return data

def get_dicts(pv, name):
    data = read_csv_to_2d_array("eval/"+ pv + "/" + name + ".csv")
    ffs = {}
    for row in data:
        if row[0] == "$dffe" or row[0] == "$sdffce" or row[0] == "$sdffe":
            if int(row[1]) not in ffs:
                ffs[int(row[1])] = int(row[2])
            else:
                ffs[int(row[1])] += int(row[2])
    
    # badkeys = []
    # for key in ffs:
    #     if ffs[key] > 15:
    #         print(name,end=" -- ")
    #         print(key,end=": ")
    #         print(ffs[key])
    #         badkeys.append(key)
    
    # for key in badkeys:
    #     del ffs[key]
    
    ffs = dict(sorted(ffs.items()))

    data = read_csv_to_2d_array("eval/"+ pv + "/" + name + "_prediction.csv")
    ffs_p = {}
    for row in data:
        if row[0] == "$dffe":
            if int(row[1]) not in ffs_p:
                ffs_p[int(row[1])] = int(row[2])
            else:
                ffs_p[int(row[1])] += int(row[2])
    ffs_p = dict(sorted(ffs_p.items()))

    # badkeys = []
    # for key in ffs_p:
    #     if ffs_p[key] > 15:
    #         print(name,end=" -- ")
    #         print(key,end=": ")
    #         print(ffs_p[key])
    #         badkeys.append(key)
    
    # for key in badkeys:
    #     del ffs_p[key]

    return ffs, ffs_p


def plot_side_by_side_scatter(data_list1, data_list2, file_name, y_ticks, title1, title2, big_title, figsize, colors):
    # Collect all unique keys from both datasets
    all_keys = set()
    for _, data_dict in data_list1 + data_list2:
        all_keys.update(data_dict.keys())
    all_keys = sorted(all_keys)  # Sort keys for consistent x-axis
    key_to_index = {key: idx for idx, key in enumerate(all_keys)}  # Map keys to their indices

    fig, (ax1, ax2) = plt.subplots(1, 2, figsize=figsize, sharey=True, dpi=70)

    def plot_data(ax, data_list, color_list, include_legend=False):
        for (name, data_dict), color in zip(data_list, color_list):
            indices = [key_to_index.get(k, -1) for k in data_dict.keys()]
            values = [data_dict.get(k, 0) for k in all_keys]
            
            # Filter out indices that are not valid
            filtered_indices = [i for i in indices if 0 <= i < len(values)]
            filtered_values = [values[i] for i in filtered_indices]
            
            # Plot data
            ax.scatter(filtered_indices, filtered_values, color=color, edgecolor='black', label=name)
        
        if include_legend:
            # Add legend only for the first subplot
            return ax.get_legend_handles_labels()

    # Determine the number of datasets
    num_datasets1 = len(data_list1)
    num_datasets2 = len(data_list2)

    # Ensure the color list is long enough
    if len(colors) < max(num_datasets1, num_datasets2):
        raise ValueError("Not enough colors provided. Please provide at least as many colors as datasets.")
    
    # Use the same colors for corresponding datasets
    color_list1 = colors[:num_datasets1]
    color_list2 = colors[:num_datasets2]  # Use the same slice of colors for data_list2

    # Plot the data on both axes
    legend_handles_labels = plot_data(ax1, data_list1, color_list1, include_legend=True)
    ax1.set_xticks(range(len(all_keys)))
    ax1.set_xticklabels(all_keys)
    ax1.set_yticks(y_ticks)
    ax1.set_title(title1)
    ax1.set_xlabel('Register Size')
    ax1.set_ylabel('Quantity')

    plot_data(ax2, data_list2, color_list2)
    ax2.set_xticks(range(len(all_keys)))
    ax2.set_xticklabels(all_keys)
    ax2.set_yticks(y_ticks)
    ax2.set_title(title2)
    ax2.set_xlabel('Register Size')

    # Center title with respect to the plots
    fig.suptitle(big_title, y=1.02)  # Adjust y to move the title up or down

    # Adjust layout to remove whitespace between plots and legend
    fig.subplots_adjust(left=0.07, right=0.85, wspace=0.01)  # Adjust margins and spacing
    
    # Create a single legend outside the plots
    if legend_handles_labels:
        handles, labels = legend_handles_labels
        fig.legend(handles, labels, loc='center left', bbox_to_anchor=(0.87, 0.5))

    plt.savefig(file_name, bbox_inches='tight')  # Save with tight bounding box to reduce whitespace
    plt.close()

pv_names = [
    ["pyrtl", "fifo"],
    ["pyrtl", "piso"],
    ["verilog", "bsg_assembler"],
    #["verilog", "bsg_cache"],
    ["verilog", "bsg_fifo"],
    ["verilog", "bsg_idiv"],
    ["verilog", "bsg_lfsr"],
    ["verilog", "bsg_multiply_array_pipelined"],
    ["verilog", "bsg_multiply_pipelined"],
    ["verilog", "bsg_strobe"],
    ["verilog", "nerv"],
    ["verilog", "opdb_pico"]
]

benchmarks = []
predictions = []

for x in pv_names:
    a, b = get_dicts(x[0], x[1])
    if x[1] == "bsg_multiply_array_pipelined":
        benchmarks.append(("bsg_multiply_array", a))
        predictions.append(("bsg_multiply_array", b))
    elif x[1] == "bsg_multiply_pipelined":
        benchmarks.append(("bsg_multiply", a))
        predictions.append(("bsg_multiply", b))
    else:
        benchmarks.append((x[1], a))
        predictions.append((x[1], b))

colors = [
    (1, 0, 0),          # Red
    (0, 1, 0),          # Green
    (0.6*1.1, 0.3*1.1, 0.1*1.1),    # Brown
    #(0, 1, 1),          # Cyan
    (1, 0, 1),          # Magenta
    (1, 1, 0),          # Yellow
    (1, 0.647, 0),      # Orange
    (0.5, 0, 0.5),      # Purple
    (0.9, 0.9, 0.9),        # white
    (1, 0.75, 0.8),     # Pink
    (0, 0, 1),          # Blue
    (0.3, 0.3, 0.3), # black
]

plot_side_by_side_scatter(benchmarks, predictions, "eval/overview_p1.png", [0, 2, 4, 6, 8, 10, 12, 14], "Benchmark", "Predictions", "Register Aggregation", (30, 10), colors)
