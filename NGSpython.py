import re
from collections import Counter
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from scipy.stats import shapiro, gaussian_kde

# ========================
# FILTROWANIE SEKWENCJI PO SPECYFICZNYCH FRAGMENTACH SEKWENCJI ABY USUNĄC NIESPECYFICZNE ODCZYTY
# ========================
LEFT_D11 = "CCACCGCCCACCCACC"
RIGHT_D11 = "CTCTGGGCCCCCTCCT"
LEFT_K0 = LEFT_D11
RIGHT_K0 = RIGHT_D11

def filter_seq(input_file, output_file, LEFT, RIGHT):
    pattern = re.compile(f"{LEFT}(.*?){RIGHT}")
    counts = Counter()
    with open(input_file) as f:
        for line in f:
            seq = line.strip()
            m = pattern.search(seq)
            if m:
                repeat = m.group(1)
                counts[repeat] += 1
    with open(output_file, "w") as out:
        for seq, count in counts.items():
            out.write(f"{seq}\t{count}\n")

filter_seq("D11.seq", "D11_filtered_CAG_counts.txt", LEFT_D11, RIGHT_D11)
filter_seq("K0.seq", "K0_filtered_CAG_counts.txt", LEFT_K0, RIGHT_K0)
print("Filtering finished for both samples.")

# ========================
# PODSUMOWANIE CAG (strict)
# ========================
LEFT_STRICT = "CACATCACCAT"
RIGHT_STRICT = "CATCACGGAAA"
MAX_CAG = 35

def max_CAG_run(seq):
    """Znajdź najdłuższy nieprzerwany ciąg 'CAG' w sekwencji"""
    runs = re.findall(r'(?:CAG)+', seq)
    if not runs:
        return 0
    longest = max(len(r)//3 for r in runs)
    return min(longest, MAX_CAG)

def process_file(input_file, output_file):
    counts = Counter()
    pattern = re.compile(f"{LEFT_STRICT}(.+?){RIGHT_STRICT}")
    with open(input_file) as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            parts = line.split()
            seq = parts[0]
            read_count = int(parts[1]) if len(parts) > 1 else 1
            match = pattern.search(seq)
            if match:
                inner_seq = match.group(1)
                cag_len = max_CAG_run(inner_seq)
                counts[cag_len] += read_count
    with open(output_file, "w") as out:
        out.write("CAG_length\tRead_count\n")
        for length in sorted(counts):
            out.write(f"{length}\t{counts[length]}\n")
    print(f"Finished {input_file}. Results saved to {output_file}")

process_file("D11_filtered_CAG_counts.txt", "D11_CAG_counts_summary_strict.txt")
process_file("K0_filtered_CAG_counts.txt", "K0_CAG_counts_summary_strict.txt")

# ========================
# WŁĄCZENIE DANYCH DO PANDAS
# ========================
df_d11 = pd.read_csv("D11_CAG_counts_summary_strict.txt", sep="\t")
df_k0 = pd.read_csv("K0_CAG_counts_summary_strict.txt", sep="\t")

# Obliczenie procentowego udziału
df_d11['Percent'] = df_d11['Read_count'] / df_d11['Read_count'].sum() * 100
df_k0['Percent'] = df_k0['Read_count'] / df_k0['Read_count'].sum() * 100

# ========================
# WYKRES NAKŁADANIA CAG
# ========================
all_lengths = sorted(set(df_d11['CAG_length']).union(df_k0['CAG_length']))
d11_dict = dict(zip(df_d11['CAG_length'], df_d11['Percent']))
k0_dict = dict(zip(df_k0['CAG_length'], df_k0['Percent']))
d11_percent = [d11_dict.get(l, 0) for l in all_lengths]
k0_percent = [k0_dict.get(l, 0) for l in all_lengths]

plt.figure(figsize=(12,6))
width = 0.4
plt.bar([x - width/2 for x in all_lengths], d11_percent, width=width, label='D11', color='skyblue')
plt.bar([x + width/2 for x in all_lengths], k0_percent, width=width, label='K0', color='salmon')
plt.xlabel("Długość CAG")
plt.ylabel("Procentowy udział [%]")
plt.title("Porównanie długości powtórzeń CAG w D11 i K0 (nakładanie)")
plt.xticks(all_lengths)
plt.legend()
plt.grid(axis='y', linestyle='--', alpha=0.7)
plt.tight_layout()
plt.savefig("NGS_data_analysis/CAG_distribution.png", dpi=300)
plt.show()

# ========================
# STATYSTYKA PODSTAWOWA
# ========================
def calculate_stats(file):
    df = pd.read_csv(file, sep="\t")
    expanded = np.repeat(df['CAG_length'], df['Read_count'])
    mean = np.mean(expanded)
    median = np.median(expanded)
    std = np.std(expanded)
    return mean, median, std, expanded

d11_mean, d11_median, d11_std, d11_exp = calculate_stats("D11_CAG_counts_summary_strict.txt")
k0_mean, k0_median, k0_std, k0_exp = calculate_stats("K0_CAG_counts_summary_strict.txt")

print("=== Basic statistics ===")
print("D11:")
print(f"Mean: {d11_mean:.2f}, Median: {d11_median:.2f}, Std: {d11_std:.2f}")
print("K0:")
print(f"Mean: {k0_mean:.2f}, Median: {k0_median:.2f}, Std: {k0_std:.2f}")

# ========================
# PROCENT CZYSTE / MUTACJE
# ========================
def calculate_percentages(summary_file, filtered_file):
    df = pd.read_csv(summary_file, sep="\t")
    clean_reads = df['Read_count'].sum()
    total_reads = 0
    with open(filtered_file) as f:
        for line in f:
            parts = line.strip().split()
            if len(parts) > 1:
                total_reads += int(parts[1])
    percent_clean = clean_reads / total_reads * 100
    percent_mut = 100 - percent_clean
    return percent_clean, percent_mut

d11_clean, d11_mut = calculate_percentages("D11_CAG_counts_summary_strict.txt","D11_filtered_CAG_counts.txt")
k0_clean, k0_mut = calculate_percentages("K0_CAG_counts_summary_strict.txt","K0_filtered_CAG_counts.txt")
print(f"D11 -> Clean: {d11_clean:.2f}%, Mutations: {d11_mut:.2f}%")
print(f"K0  -> Clean: {k0_clean:.2f}%, Mutations: {k0_mut:.2f}%")

plt.figure(figsize=(8,6))
labels = ["D11", "K0"]
clean_values = [d11_clean, k0_clean]
mut_values = [d11_mut, k0_mut]
x = range(len(labels))
plt.bar(x, clean_values, label="Czyste CAG")
plt.bar(x, mut_values, bottom=clean_values, label="Mutacje (nieczyste)")
plt.xticks(x, labels)
plt.ylabel("Procent [%]")
plt.title("Czyste powtórzenia CAG vs mutacje")
plt.legend()
plt.tight_layout()
plt.savefig("NGS_data_analysis/CAG_clean_vs_mutations.png", dpi=300)
plt.show()

# ========================
# CDF PLOT
# ========================
d11_sorted = np.sort(d11_exp)
k0_sorted = np.sort(k0_exp)
d11_cdf = np.arange(1, len(d11_sorted)+1) / len(d11_sorted)
k0_cdf = np.arange(1, len(k0_sorted)+1) / len(k0_sorted)

plt.figure(figsize=(8,6))
plt.plot(d11_sorted, d11_cdf, label="D11", linewidth=2)
plt.plot(k0_sorted, k0_cdf, label="K0", linewidth=2)
plt.xlabel("Długość CAG")
plt.ylabel("Cumulative fraction")
plt.title("CDF of CAG repeat lengths")
plt.legend()
plt.grid(True)
plt.tight_layout()
plt.savefig("NGS_data_analysis/CAG_CDF.png", dpi=300)
plt.show()

# ========================
# TEST NORMALNOŚCI (Shapiro-Wilka)
# ========================
stat_d11, p_d11 = shapiro(d11_exp[:5000])
stat_k0, p_k0 = shapiro(k0_exp[:5000])
print("=== Shapiro-Wilk Test ===")
print(f"D11 normality p-value: {p_d11:.5f}")
print(f"K0  normality p-value: {p_k0:.5f}")

# ========================
# KDE PLOT
# ========================
plt.figure(figsize=(10,6))
kde_d11 = gaussian_kde(d11_exp)
kde_k0 = gaussian_kde(k0_exp)
x_vals = np.linspace(min(d11_exp.min(), k0_exp.min()), max(d11_exp.max(), k0_exp.max()), 200)
plt.plot(x_vals, kde_d11(x_vals), label="D11 KDE", linewidth=2)
plt.plot(x_vals, kde_k0(x_vals), label="K0 KDE", linewidth=2)
plt.xlabel("CAG length")
plt.ylabel("Density")
plt.title("Kernel Density Estimation of CAG lengths")
plt.legend()
plt.grid(True)
plt.tight_layout()
plt.savefig("NGS_data_analysis/CAG_KDE.png", dpi=300)
plt.show()