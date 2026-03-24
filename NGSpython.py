import re
from collections import Counter

LEFT = "CCACCGCCCACCCACC"
RIGHT = "CTCTGGGCCCCCTCCT"

pattern = re.compile(f"{LEFT}(.*?){RIGHT}")

counts = Counter()

with open("D11.seq") as f:
    for line in f:
        seq = line.strip()
        m = pattern.search(seq)
        if m:
            repeat = m.group(1)
            counts[repeat] += 1

with open("D11_filtered_CAG_counts.txt","w") as out:
    for seq,count in counts.items():
        out.write(f"{seq}\t{count}\n")

import re
from collections import Counter

LEFT = "CCACCGCCCACCCACC"
RIGHT = "CTCTGGGCCCCCTCCT"

pattern = re.compile(f"{LEFT}(.*?){RIGHT}")

counts = Counter()

with open("K0.seq") as f:
    for line in f:
        seq = line.strip()
        m = pattern.search(seq)
        if m:
            repeat = m.group(1)
            counts[repeat] += 1

with open("K0_filtered_CAG_counts.txt","w") as out:
    for seq,count in counts.items():
        out.write(f"{seq}\t{count}\n")

print("Filtering finished for K0")
####
# NGSpython_CAG_strict.py
from collections import Counter
import re

LEFT = "CACATCACCAT"
RIGHT = "CATCACGGAAA"
MAX_CAG = 35  # maksymalna realistyczna liczba powtórzeń

def max_CAG_run(seq):
    """Znajdź najdłuższy nieprzerwany ciąg 'CAG' w sekwencji"""
    runs = re.findall(r'(?:CAG)+', seq)
    if not runs:
        return 0
    # zamiana długości w nukleotydach na liczbę powtórzeń
    longest = max(len(r)//3 for r in runs)
    return min(longest, MAX_CAG)

def process_file(input_file, output_file):
    counts = Counter()
    pattern = re.compile(f"{LEFT}(.+?){RIGHT}")

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

# --- WYWOŁANIE ---
process_file("D11_filtered_CAG_counts.txt", "D11_CAG_counts_summary_strict.txt")
process_file("K0_filtered_CAG_counts.txt", "K0_CAG_counts_summary_strict.txt")
#####
import pandas as pd
import matplotlib.pyplot as plt

# Wczytanie plików z podsumowaniami
df_d11 = pd.read_csv("D11_CAG_counts_summary_strict.txt", sep="\t")
df_k0 = pd.read_csv("K0_CAG_counts_summary_strict.txt", sep="\t")

# Obliczenie procentowego udziału
df_d11['Percent'] = df_d11['Read_count'] / df_d11['Read_count'].sum() * 100
df_k0['Percent'] = df_k0['Read_count'] / df_k0['Read_count'].sum() * 100

# Połączenie długości CAG z obu próbek, aby wszystkie długości były na osi X
all_lengths = sorted(set(df_d11['CAG_length']).union(df_k0['CAG_length']))

# Tworzymy słowniki dla szybkiego odczytu udziałów
d11_dict = dict(zip(df_d11['CAG_length'], df_d11['Percent']))
k0_dict = dict(zip(df_k0['CAG_length'], df_k0['Percent']))

# Przygotowanie list do wykresu (0% jeśli brak danej długości)
d11_percent = [d11_dict.get(l, 0) for l in all_lengths]
k0_percent = [k0_dict.get(l, 0) for l in all_lengths]

# Wykres porównawczy
plt.figure(figsize=(12,6))
width = 0.4
plt.bar([x - width/2 for x in all_lengths], d11_percent, width=width, label='D11', color='skyblue')
plt.bar([x + width/2 for x in all_lengths], k0_percent, width=width, label='K0', color='salmon')

plt.xlabel("Długość CAG")
plt.ylabel("Procentowy udział [%]")
plt.title("Porównanie długości powtórzeń CAG w D11 i K0")
plt.xticks(all_lengths)
plt.legend()
plt.grid(axis='y', linestyle='--', alpha=0.7)
plt.tight_layout()
plt.savefig("NGS_data_analysis/CAG_distribution.png", dpi=300)
plt.show()
#statystyka#####
#srednia dlugosc##
def weighted_mean(df):
    return (df['CAG_length'] * df['Read_count']).sum() / df['Read_count'].sum()

print("D11 mean:", weighted_mean(df_d11))
print("K0 mean:", weighted_mean(df_k0))
#porównanie czyste skrocenia CAG i skrócenia z mutacjami przerywajacymi ciagłosc powtorzen CAG

def calculate_percentages(summary_file, filtered_file):
    # czyste CAG
    df = pd.read_csv(summary_file, sep="\t")
    clean_reads = df['Read_count'].sum()

    # wszystkie ready
    total_reads = 0
    with open(filtered_file) as f:
        for line in f:
            parts = line.strip().split()
            if len(parts) > 1:
                total_reads += int(parts[1])

    percent_clean = clean_reads / total_reads * 100
    percent_mut = 100 - percent_clean

    return percent_clean, percent_mut


# --- D11 ---
d11_clean, d11_mut = calculate_percentages(
    "D11_CAG_counts_summary_strict.txt",
    "D11_filtered_CAG_counts.txt"
)

# --- K0 ---
k0_clean, k0_mut = calculate_percentages(
    "K0_CAG_counts_summary_strict.txt",
    "K0_filtered_CAG_counts.txt"
)

print(f"D11 -> Clean: {d11_clean:.2f}%, Mutations: {d11_mut:.2f}%")
print(f"K0  -> Clean: {k0_clean:.2f}%, Mutations: {k0_mut:.2f}%")


# 📊 --- WYKRES ---
labels = ["D11", "K0"]
clean_values = [d11_clean, k0_clean]
mut_values = [d11_mut, k0_mut]

x = range(len(labels))

plt.figure(figsize=(8,6))

plt.bar(x, clean_values, label="Czyste CAG")
plt.bar(x, mut_values, bottom=clean_values, label="Mutacje (nieczyste)")

plt.xticks(x, labels)
plt.ylabel("Procent [%]")
plt.title("Czyste powtórzenia CAG vs mutacje")
plt.legend()

plt.tight_layout()
plt.savefig("NGS_data_analysis/CAG_clean_vs_mutations.png", dpi=300)
plt.show()