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