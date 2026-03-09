(base) magdalena_dabrowska@DESKTOP-N4MLIUB:~$ cd ANALIZA0903
(base) magdalena_dabrowska@DESKTOP-N4MLIUB:~/ANALIZA0903$ fastp \
-i D11DRPLA_FDDP202401552-1a_HLTLGDRXX_L1_1.fq \
-I D11DRPLA_FDDP202401552-1a_HLTLGDRXX_L1_2.fq \
-o D11_clean_R1.fq.gz \
-O D11_clean_R2.fq.gz \
-h D11_fastp_report.html \
-j D11_fastp_report.json \
--detect_adapter_for_pe \
--trim_poly_g \
--cut_front \
--cut_tail \
--cut_mean_quality 20 \
--length_required 50
ERROR: Failed to open file: D11DRPLA_FDDP202401552-1a_HLTLGDRXX_L1_1.fq
(base) magdalena_dabrowska@DESKTOP-N4MLIUB:~/ANALIZA0903$ ls D11*
D11DRPLA_FDDP202401552-1a_HLTLGDRXX_L1_1.fq.gz  D11DRPLA_FDDP202401552-1a_HLTLGDRXX_L1_2.fq.gz
(base) magdalena_dabrowska@DESKTOP-N4MLIUB:~/ANALIZA0903$ fastp \
-i D11DRPLA_FDDP202401552-1a_HLTLGDRXX_L1_1.fq.gz \
-I D11DRPLA_FDDP202401552-1a_HLTLGDRXX_L1_2.fq.gz \
-o D11_clean_R1.fq.gz \
-O D11_clean_R2.fq.gz \
-h D11_fastp_report.html \
-j D11_fastp_report.json \
--detect_adapter_for_pe \
--trim_poly_g \
--cut_front \
--cut_tail \
--cut_mean_quality 20 \
--length_required 50
Detecting adapter sequence for read1...
>Illumina TruSeq Adapter Read 1
AGATCGGAAGAGCACACGTCTGAACTCCAGTCA

Detecting adapter sequence for read2...
No adapter detected for read2

Read1 before filtering:
total reads: 1833944
total bases: 458486000
Q20 bases: 435050420(94.8885%)
Q30 bases: 407020499(88.7749%)

Read2 before filtering:
total reads: 1833944
total bases: 458486000
Q20 bases: 408584320(89.116%)
Q30 bases: 381674309(83.2467%)

Read1 after filtering:
total reads: 1800302
total bases: 263251593
Q20 bases: 255514198(97.0608%)
Q30 bases: 242744309(92.21%)

Read2 after filtering:
total reads: 1800302
total bases: 264088806
Q20 bases: 256584503(97.1584%)
Q30 bases: 246093000(93.1857%)

Filtering result:
reads passed filter: 3600604
reads failed due to low quality: 36310
reads failed due to too many N: 112
reads failed due to too short: 30862
reads with adapter trimmed: 3473012
bases trimmed due to adapters: 204589269

Duplication rate: 4.21501%

Insert size peak (evaluated by paired-end reads): 128

JSON report: D11_fastp_report.json
HTML report: D11_fastp_report.html

fastp -i D11DRPLA_FDDP202401552-1a_HLTLGDRXX_L1_1.fq.gz -I D11DRPLA_FDDP202401552-1a_HLTLGDRXX_L1_2.fq.gz -o D11_clean_R1.fq.gz -O D11_clean_R2.fq.gz -h D11_fastp_report.html -j D11_fastp_report.json --detect_adapter_for_pe --trim_poly_g --cut_front --cut_tail --cut_mean_quality 20 --length_required 50
fastp v0.23.4, time used: 137 seconds
(base) magdalena_dabrowska@DESKTOP-N4MLIUB:~/ANALIZA0903$ fastp \
-i K0_FDDP202401554-1a_HLVKWDRXX_L1_1.fq.gz \
-I K0_FDDP202401554-1a_HLVKWDRXX_L1_2.fq.gz \
-o K0_clean_R1.fq.gz \
-O K0_clean_R2.fq.gz \
-h K0_fastp_report.html \
-j K0_fastp_report.json \
--detect_adapter_for_pe \
--trim_poly_g \
--cut_front \
--cut_tail \
--cut_mean_quality 20 \
--length_required 50
Detecting adapter sequence for read1...
No adapter detected for read1

Detecting adapter sequence for read2...
^C
(base) magdalena_dabrowska@DESKTOP-N4MLIUB:~/ANALIZA0903$ zcat K0_FDDP202401554-1a_HLVKWDRXX_L1_1.fq.gz | head
zcat K0_FDDP202401554-1a_HLVKWDRXX_L1_2.fq.gz | head
@A00920:319:HLVKWDRXX:1:2101:10809:1078 1:N:0:CTAGCAGT+CCAGTGTT
CCCCTTCCCTCCCTCTACTGGGGCCCAGTCCACCGCCCACCCACCAGTTTCAACACATCACCATCACCACCAGCAACAGCAACAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCCGCATCACGGAAACACTGGGCCCCCTCCTCCAGGAGCATTACCCCACCAGATCCGAAGAGCACACGTCTGACCTCCAGTCACCAAGCAGAATCTCGTATGACGTCTTCTGCTT
+
FF,FFFF:FFFFFFFFFFFFFFFFFFFFF:F:FFFFFFFFFFFFF,:FF,FFFFFF,FFFFFF:FFFFFFF:FFF:FFFFFFFFFFFFF,F:FFF,F::FF:F:FF:,,F,::,F:,FFFFF:FFF:FF:F:,:,,:,F::,:::,FF,FF,F,:FFFFFFF,FF,F:,,FF,F,,F,,FF::F:F,FFF,:,F,F,::F,F,,F,FF,F,F:,,,:FF:,:,F,,,,FFF:FFF:,,F,,F,,F,,FF,
@A00920:319:HLVKWDRXX:1:2101:14407:1110 1:N:0:CTAGCAGT+CCAGTGTT
GGTGGGGAAATGCTCCAGGAGGAGGGGGCCCAGAGTTTCCGTGATGCTGCTGCTGTTGCAGTTGCTGGTGGTGATGGTGATGTGTTGAGACTGGTGGGTGGGCGGTGGACTGGGCCCCAGTAGAGGGAGGGAAGGGGAGATCGGAAGAGCACACGTCTGAACTCCAGTCACCTAGCAGTATCTCGTATGCCGTCTTCTGCTTGAAAAAAGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
+
,,FFFFFFFFFFFFFFFFFF:FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF:FFFFFFFFFFFF:FFFFFFFFFFFFFF,FFFFFFFFF::FFFFFFFFFFFF:FFFFFFFFFFFFFF,FFFFFFFFF:FFFFFFFFFFFFF:F:FFFFFFFF:FFFFFFFFFFFFFFFFFFFFFFFF,,,,:,,FFF:FFF,FFFFFFFFFFFFFFFFFFFFFFFFFFFF
@A00920:319:HLVKWDRXX:1:2101:21025:1110 1:N:0:CTAGCAGT+CCAGTGTT
GGTGGGGAAATGCTCCAGGAGGAGGGGGCCCAGAGTTTCCGTGATGCTGCTGCTGCTGCTGCTGCTGCTGCTGCTGCTGCTGCTGCTGCTGGTGATGGTGCTGGTGGTGATGGTGATGTGTTGAAACTGGTGGGTGGGCGGAGGACTGGGCCCCAGGAGAGGGAGGGAGGGGGAGATCTGACGAGCACACGTCTGAACCACCAGACTCCAAGCAGAATCTCGTATGACGACTTCTGCTTGAAATTCGGGG
@A00920:319:HLVKWDRXX:1:2101:10809:1078 2:N:0:CTAGCAGT+CCAGTGTT
GGTGGGGAAATGCTCCAGGAGGAGGGGGCCCAGAGTTTCCGTGATGCTGCTGCTGCTGCTGCTGCTGCTGCTGCTGCTGCTGCTGCTGCTGCTGCTGCTGCTGTTGCTGGTGCTGGTGGTGATGGTGATGTGTTGAAACTGGTGGGTGGGCGGTGGACTGGGCCCCAGTAGAGGGAGGGAAGGGGAGATCGGAAGAGCGTCGTGTAGGGAAAGAAACACTGGGTGTAGAGCTCGGTGGGCGCCGGCTGAG
+
FFFFFFFF,FFF:FFFFFFFFF:FFFFFFFFFFFF:FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF:FFF:F:FFF,FFFFFFFFFF::FFFFFFFFFF::F:FFFF:FFFFFFFF,FFFFFFFF:FFFFFFF,FFFFFFFFFFFFF,F::F,F:FF,FFF:FFFFFFFF,F:F,FFFFFFFFF,F,,,F:FF,F,,F,F,:,FF,,F,,,::,,,,
@A00920:319:HLVKWDRXX:1:2101:14407:1110 2:N:0:CTAGCAGT+CCAGTGTT
CCCCTTCCCTCCCTCTACTGGGGCCCAGTCCACCGCCCACCCACCAGTCTCAACACATCACCATCACCACCAGCAACTGCAACAGCAGCAGCATCACGGAAACTCTGGGCCCCCTCCTCCTGGAGCATTTCCCCACCAGATCGGAAGAGCGTCGTGTAGGGAAAGAAACACTGGGTGTAGTTCTCGGGGGTCGGCGTAGGTGTAAAGTGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
+
FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF:FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF:FFFFFFFFFFFFFF:FFFFFFFFFFFFF:FFFFFFFFFFFFFFFFFFFFFFFF:::FFFFFFF,F,,,FFFF,FF,,F,:F,,,,,,,,,,,,,FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
@A00920:319:HLVKWDRXX:1:2101:21025:1110 2:N:0:CTAGCAGT+CCAGTGTT
CCCCTTCCCTCCCTCTACTGGGGCCCAGTCCACCGCCCACCCACCAGTTTCAACACATCACCATCACCACCAGCAACAGCAACAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAACGAAAATCTGCTCCCCCACCTCCTGCAGCATAAAACCACCACCTCTGAAGAGCGTCGTGGAGGGCACTAAGAAAGGGTTGGTGTGGGGGGGGGGGGGCGGGGGGGGTGGGGGGGGGG
(base) magdalena_dabrowska@DESKTOP-N4MLIUB:~/ANALIZA0903$ fastp \
-i K0_FDDP202401554-1a_HLVKWDRXX_L1_1.fq.gz \
-I K0_FDDP202401554-1a_HLVKWDRXX_L1_2.fq.gz \
-o K0_clean_R1.fq.gz \
-O K0_clean_R2.fq.gz \
-h K0_fastp_report.html \
-j K0_fastp_report.json \
--adapter_sequence AGATCGGAAGAGCACACGTCTGAACTCCAGTCA \
--adapter_sequence_r2 AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT \
--trim_poly_g \
--cut_front \
--cut_tail \
--cut_mean_quality 20 \
--length_required 50
Read1 before filtering:
total reads: 954919
total bases: 238729750
Q20 bases: 219522412(91.9544%)
Q30 bases: 199074610(83.3891%)

Read2 before filtering:
total reads: 954919
total bases: 238729750
Q20 bases: 214861773(90.0021%)
Q30 bases: 194449395(81.4517%)

Read1 after filtering:
total reads: 947592
total bases: 207522820
Q20 bases: 193135094(93.0669%)
Q30 bases: 176603005(85.1005%)

Read2 after filtering:
total reads: 947592
total bases: 207845893
Q20 bases: 191942547(92.3485%)
Q30 bases: 175797631(84.5808%)

Filtering result:
reads passed filter: 1895184
reads failed due to low quality: 11202
reads failed due to too many N: 576
reads failed due to too short: 2876
reads with adapter trimmed: 1764897
bases trimmed due to adapters: 49447290

Duplication rate: 27.5598%

Insert size peak (evaluated by paired-end reads): 233

JSON report: K0_fastp_report.json
HTML report: K0_fastp_report.html

fastp -i K0_FDDP202401554-1a_HLVKWDRXX_L1_1.fq.gz -I K0_FDDP202401554-1a_HLVKWDRXX_L1_2.fq.gz -o K0_clean_R1.fq.gz -O K0_clean_R2.fq.gz -h K0_fastp_report.html -j K0_fastp_report.json --adapter_sequence AGATCGGAAGAGCACACGTCTGAACTCCAGTCA --adapter_sequence_r2 AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT --trim_poly_g --cut_front --cut_tail --cut_mean_quality 20 --length_required 50
fastp v0.23.4, time used: 9 seconds
(base) magdalena_dabrowska@DESKTOP-N4MLIUB:~/ANALIZA0903$ cd ~/ANALIZA0903
(base) magdalena_dabrowska@DESKTOP-N4MLIUB:~/ANALIZA0903$ mkdir -p NGS_data_analysis
(base) magdalena_dabrowska@DESKTOP-N4MLIUB:~/ANALIZA0903$ mv D11_fastp_report.* NGS_data_analysis/
mv K0_fastp_report.* NGS_data_analysis/
mv run_fastp_*.sh NGS_data_analysis/
mv: cannot stat 'run_fastp_*.sh': No such file or directory
(base) magdalena_dabrowska@DESKTOP-N4MLIUB:~/ANALIZA0903$ cd NGS_data_analysis
git add D11_fastp_report.* K0_fastp_report.*
git commit -m "Add fastp reports"
git push --set-upstream origin main
Auto packing the repository in background for optimum performance.
See "git help gc" for manual housekeeping.
[master (root-commit) e40a484] Add fastp reports
 4 files changed, 10150 insertions(+)
 create mode 100644 ANALIZA0903/NGS_data_analysis/D11_fastp_report.html
 create mode 100644 ANALIZA0903/NGS_data_analysis/D11_fastp_report.json
 create mode 100644 ANALIZA0903/NGS_data_analysis/K0_fastp_report.html
 create mode 100644 ANALIZA0903/NGS_data_analysis/K0_fastp_report.json
error: src refspec main does not match any
error: failed to push some refs to 'origin'
(base) magdalena_dabrowska@DESKTOP-N4MLIUB:~/ANALIZA0903/NGS_data_analysis$ cd ~/ANALIZA0903/NGS_data_analysis
(base) magdalena_dabrowska@DESKTOP-N4MLIUB:~/ANALIZA0903/NGS_data_analysis$ git init
hint: Using 'master' as the name for the initial branch. This default branch name
hint: is subject to change. To configure the initial branch name to use in all
hint: of your new repositories, which will suppress this warning, call:
hint:
hint:   git config --global init.defaultBranch <name>
hint:
hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and
hint: 'development'. The just-created branch can be renamed via this command:
hint:
hint:   git branch -m <name>
Initialized empty Git repository in /home/magdalena_dabrowska/ANALIZA0903/NGS_data_analysis/.git/
(base) magdalena_dabrowska@DESKTOP-N4MLIUB:~/ANALIZA0903/NGS_data_analysis$ git add D11_fastp_report.* K0_fastp_report.*
(base) magdalena_dabrowska@DESKTOP-N4MLIUB:~/ANALIZA0903/NGS_data_analysis$ git commit -m "Add fastp reports"
[master (root-commit) 5611c5e] Add fastp reports
 4 files changed, 10150 insertions(+)
 create mode 100644 D11_fastp_report.html
 create mode 100644 D11_fastp_report.json
 create mode 100644 K0_fastp_report.html
 create mode 100644 K0_fastp_report.json
(base) magdalena_dabrowska@DESKTOP-N4MLIUB:~/ANALIZA0903/NGS_data_analysis$ git remote add origin https://github.com/magdalenadabrowska122-jpg/NGS_data_analysis.git
(base) magdalena_dabrowska@DESKTOP-N4MLIUB:~/ANALIZA0903/NGS_data_analysis$ git branch -M main
git push -u origin main
Username for 'https://github.com': magdalenadabrowska122-jpg
Password for 'https://magdalenadabrowska122-jpg@github.com':
remote: Invalid username or token. Password authentication is not supported for Git operations.
fatal: Authentication failed for 'https://github.com/magdalenadabrowska122-jpg/NGS_data_analysis.git/'
(base) magdalena_dabrowska@DESKTOP-N4MLIUB:~/ANALIZA0903/NGS_data_analysis$ git branch -M main
git push -u origin main
Username for 'https://github.com': magdalenadabrowska122-jpg
Password for 'https://magdalenadabrowska122-jpg@github.com':
Enumerating objects: 6, done.
Counting objects: 100% (6/6), done.
Delta compression using up to 8 threads
Compressing objects: 100% (6/6), done.
Writing objects: 100% (6/6), 358.78 KiB | 5.13 MiB/s, done.
Total 6 (delta 1), reused 0 (delta 0), pack-reused 0
remote: Resolving deltas: 100% (1/1), done.
To https://github.com/magdalenadabrowska122-jpg/NGS_data_analysis.git
 * [new branch]      main -> main
branch 'main' set up to track 'origin/main'.
(base) magdalena_dabrowska@DESKTOP-N4MLIUB:~/ANALIZA0903/NGS_data_analysis$ cd ~/ANALIZA0903
mkdir -p NGS_data_analysis
(base) magdalena_dabrowska@DESKTOP-N4MLIUB:~/ANALIZA0903$ echo 'fastp -i D11DRPLA_FDDP202401552-1a_HLTLGDRXX_L1_1.fq.gz -I D11DRPLA_FDDP202401552-1a_HLTLGDRXX_L1_2.fq.gz -o D11_clean_R1.fq.gz -O D11_clean_R2.fq.gz -h D11_fastp_report.html -j D11_fastp_report.json --detect_adapter_for_pe --trim_poly_g --cut_front --cut_tail --cut_mean_quality 20 --length_required 50' > NGS_data_analysis/run_fastp_D11.sh
(base) magdalena_dabrowska@DESKTOP-N4MLIUB:~/ANALIZA0903$ echo 'fastp -i K0_FDDP202401554-1a_HLVKWDRXX_L1_1.fq.gz -I K0_FDDP202401554-1a_HLVKWDRXX_L1_2.fq.gz -o K0_clean_R1.fq.gz -O K0_clean_R2.fq.gz -h K0_fastp_report.html -j K0_fastp_report.json --detect_adapter_for_pe --trim_poly_g --cut_front --cut_tail --cut_mean_quality 20 --length_required 50' > NGS_data_analysis/run_fastp_K0.sh
(base) magdalena_dabrowska@DESKTOP-N4MLIUB:~/ANALIZA0903$ mv D11_fastp_report.* NGS_data_analysis/
mv K0_fastp_report.* NGS_data_analysis/
mv: cannot stat 'D11_fastp_report.*': No such file or directory
mv: cannot stat 'K0_fastp_report.*': No such file or directory
(base) magdalena_dabrowska@DESKTOP-N4MLIUB:~/ANALIZA0903$ ls -lh D11*fastp* K0*fastp*
ls: cannot access 'D11*fastp*': No such file or directory
ls: cannot access 'K0*fastp*': No such file or directory
(base) magdalena_dabrowska@DESKTOP-N4MLIUB:~/ANALIZA0903$ find . -name "*fastp*"
./NGS_data_analysis/run_fastp_D11.sh
./NGS_data_analysis/D11_fastp_report.html
./NGS_data_analysis/K0_fastp_report.html
./NGS_data_analysis/K0_fastp_report.json
./NGS_data_analysis/run_fastp_K0.sh
./NGS_data_analysis/D11_fastp_report.json
(base) magdalena_dabrowska@DESKTOP-N4MLIUB:~/ANALIZA0903$ cd ~/ANALIZA0903/NGS_data_analysis  # przejdź do katalogu projektu

git add D11_fastp_report.html K0_fastp_report.html D11_fastp_report.json K0_fastp_report.json
git commit -m "Add fastp reports for D11 and K0"
git push -u origin main
On branch main
Your branch is up to date with 'origin/main'.

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        run_fastp_D11.sh
        run_fastp_K0.sh

nothing added to commit but untracked files present (use "git add" to track)
Username for 'https://github.com': magdalenadabrowska122-jpg
Password for 'https://magdalenadabrowska122-jpg@github.com':
branch 'main' set up to track 'origin/main'.
Everything up-to-date
