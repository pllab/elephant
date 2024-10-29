import csv
import matplotlib.pyplot as plt
import numpy as np

def read_csv_to_2d_array(filename):
    with open(filename, "r") as csvfile:
        csvreader = csv.reader(csvfile, delimiter=',')
        data = [row for row in csvreader]
    return data

def plot_side_by_side(data_dict1, data_dict2, file_name, title1='', title2='', big_title='', figsize=(12, 6), y_ticks=None):
    plt.rcParams.update({'font.size': 18})
    keys1 = list(data_dict1.keys())
    values1 = list(data_dict1.values())
    keys2 = list(data_dict2.keys())
    values2 = list(data_dict2.values())
    
    all_keys = set(keys1) | set(keys2)
    values1 = [data_dict1.get(k, 0) for k in all_keys]
    values2 = [data_dict2.get(k, 0) for k in all_keys]
    
    bar_width = 0.4
    x = np.arange(len(all_keys))
    
    fig, ax = plt.subplots(figsize=figsize, dpi=200)
    
    ax.bar(x - bar_width / 2, values1, bar_width, color=(54/255, 183/255, 195/255), edgecolor='black', label=title1)
    ax.bar(x + bar_width / 2, values2, bar_width, color=(54/255, 64/255, 140/255), edgecolor='black', label=title2)
    
    ax.set_xticks(x)
    ax.set_xticklabels(all_keys)
    
    if y_ticks:
        ax.set_yticks(y_ticks)
    
    plt.rcParams.update({'font.size': 20})
    ax.set_title(big_title)
    n = 18
    plt.rcParams.update({'font.size': n})
    ax.set_xlabel('Register Size', fontsize=n)
    ax.set_ylabel('Quantity', fontsize=n)
    ax.legend()
    
    plt.savefig(file_name)
    plt.close()

PV = "pyrtl"
NAME = "fifo"

data = read_csv_to_2d_array("eval/"+ PV + "/" + NAME + ".csv")
ffs = {}
for row in data:
    if row[0] == "$dffe" or row[0] == "$sdffce" or row[0] == "$sdffe":
        if int(row[1]) not in ffs:
            ffs[int(row[1])] = int(row[2])
        else:
            ffs[int(row[1])] += int(row[2])
ffs = dict(sorted(ffs.items()))

data = read_csv_to_2d_array("eval/"+ PV + "/" + NAME + "_prediction.csv")
ffs_p = {}
for row in data:
    if row[0] == "$dffe":
        if int(row[1]) not in ffs_p:
            ffs_p[int(row[1])] = int(row[2])
        else:
            ffs_p[int(row[1])] += int(row[2])
ffs_p = dict(sorted(ffs_p.items()))

# ffs["8x8"] = 1
# ffs_p["8x8"] = 1

plot_side_by_side(ffs, ffs_p, "eval/"+ PV + "/" + NAME + ".png", "Source", "Predictions", "Register Aggregation: " + NAME + "\n", (6, 7), [0, 1, 2, 3, 4])