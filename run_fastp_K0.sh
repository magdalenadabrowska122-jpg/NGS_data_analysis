  -t 8
[FLASH] ERROR: Failed to open "D11_clean_R1.fq" for reading: No such file or directory
[FLASH] FLASH did not complete successfully; exiting with failure status (1)
(base) magdalena_dabrowska@DESKTOP-N4MLIUB:~/ANALIZA0903/NGS_data_analysis$ cd ANALIZA0903
-bash: cd: ANALIZA0903: No such file or directory
(base) magdalena_dabrowska@DESKTOP-N4MLIUB:~/ANALIZA0903/NGS_data_analysis$ cd ~/ANALIZA0903
(base) magdalena_dabrowska@DESKTOP-N4MLIUB:~/ANALIZA0903$ flash D11_clean_R1.fq D11_clean_R2.fq -o D11 -M 250 -t 8
flash K0_clean_R1.fq K0_clean_R2.fq -o K0 -M 250 -t 8
[FLASH] ERROR: Failed to open "D11_clean_R1.fq" for reading: No such file or directory
[FLASH] FLASH did not complete successfully; exiting with failure status (1)
[FLASH] ERROR: Failed to open "K0_clean_R1.fq" for reading: No such file or directory
[FLASH] FLASH did not complete successfully; exiting with failure status (1)
(base) magdalena_dabrowska@DESKTOP-N4MLIUB:~/ANALIZA0903$ zcat D11_clean_R1.fq.gz > D11_clean_R1.fq
zcat D11_clean_R2.fq.gz > D11_clean_R2.fq
zcat K0_clean_R1.fq.gz > K0_clean_R1.fq
zcat K0_clean_R2.fq.gz > K0_clean_R2.fq
(base) magdalena_dabrowska@DESKTOP-N4MLIUB:~/ANALIZA0903$ # D11
flash D11_clean_R1.fq D11_clean_R2.fq -o D11 -M 250 -t 8

# K0
flash K0_clean_R1.fq K0_clean_R2.fq -o K0 -M 250 -t 8
[FLASH] Starting FLASH v1.2.11
[FLASH] Fast Length Adjustment of SHort reads
[FLASH]
[FLASH] Input files:
[FLASH]     D11_clean_R1.fq
[FLASH]     D11_clean_R2.fq
[FLASH]
[FLASH] Output files:
[FLASH]     ./D11.extendedFrags.fastq
[FLASH]     ./D11.notCombined_1.fastq
[FLASH]     ./D11.notCombined_2.fastq
[FLASH]     ./D11.hist
[FLASH]     ./D11.histogram
[FLASH]
[FLASH] Parameters:
[FLASH]     Min overlap:           10
[FLASH]     Max overlap:           250
[FLASH]     Max mismatch density:  0.250000
[FLASH]     Allow "outie" pairs:   false
[FLASH]     Cap mismatch quals:    false
[FLASH]     Combiner threads:      8
[FLASH]     Input format:          FASTQ, phred_offset=33
[FLASH]     Output format:         FASTQ, phred_offset=33
[FLASH]
[FLASH] Starting reader and writer threads
[FLASH] Starting 8 combiner threads
[FLASH] Processed 25000 read pairs
[FLASH] Processed 50000 read pairs
[FLASH] Processed 75000 read pairs
[FLASH] Processed 100000 read pairs
[FLASH] Processed 125000 read pairs
[FLASH] Processed 150000 read pairs
[FLASH] Processed 175000 read pairs
[FLASH] Processed 200000 read pairs
[FLASH] Processed 225000 read pairs
[FLASH] Processed 250000 read pairs
[FLASH] Processed 275000 read pairs
[FLASH] Processed 300000 read pairs
[FLASH] Processed 325000 read pairs
[FLASH] Processed 350000 read pairs
[FLASH] Processed 375000 read pairs
[FLASH] Processed 400000 read pairs
[FLASH] Processed 425000 read pairs
[FLASH] Processed 450000 read pairs
[FLASH] Processed 475000 read pairs
[FLASH] Processed 500000 read pairs
[FLASH] Processed 525000 read pairs
[FLASH] Processed 550000 read pairs
[FLASH] Processed 575000 read pairs
[FLASH] Processed 600000 read pairs
[FLASH] Processed 625000 read pairs
[FLASH] Processed 650000 read pairs
[FLASH] Processed 675000 read pairs
[FLASH] Processed 700000 read pairs
[FLASH] Processed 725000 read pairs
[FLASH] Processed 750000 read pairs
[FLASH] Processed 775000 read pairs
[FLASH] Processed 800000 read pairs
[FLASH] Processed 825000 read pairs
[FLASH] Processed 850000 read pairs
[FLASH] Processed 875000 read pairs
[FLASH] Processed 900000 read pairs
[FLASH] Processed 925000 read pairs
[FLASH] Processed 950000 read pairs
[FLASH] Processed 975000 read pairs
[FLASH] Processed 1000000 read pairs
[FLASH] Processed 1025000 read pairs
[FLASH] Processed 1050000 read pairs
[FLASH] Processed 1075000 read pairs
[FLASH] Processed 1100000 read pairs
[FLASH] Processed 1125000 read pairs
[FLASH] Processed 1150000 read pairs
[FLASH] Processed 1175000 read pairs
[FLASH] Processed 1200000 read pairs
[FLASH] Processed 1225000 read pairs
[FLASH] Processed 1250000 read pairs
[FLASH] Processed 1275000 read pairs
[FLASH] Processed 1300000 read pairs
[FLASH] Processed 1325000 read pairs
[FLASH] Processed 1350000 read pairs
[FLASH] Processed 1375000 read pairs
[FLASH] Processed 1400000 read pairs
[FLASH] Processed 1425000 read pairs
[FLASH] Processed 1450000 read pairs
[FLASH] Processed 1475000 read pairs
[FLASH] Processed 1500000 read pairs
[FLASH] Processed 1525000 read pairs
[FLASH] Processed 1550000 read pairs
[FLASH] Processed 1575000 read pairs
[FLASH] Processed 1600000 read pairs
[FLASH] Processed 1625000 read pairs
[FLASH] Processed 1650000 read pairs
[FLASH] Processed 1675000 read pairs
[FLASH] Processed 1700000 read pairs
[FLASH] Processed 1725000 read pairs
[FLASH] Processed 1750000 read pairs
[FLASH] Processed 1775000 read pairs
[FLASH] Processed 1800000 read pairs
[FLASH] Processed 1800302 read pairs
[FLASH]
[FLASH] Read combination statistics:
[FLASH]     Total pairs:      1800302
[FLASH]     Combined pairs:   1736231
[FLASH]     Uncombined pairs: 64071
[FLASH]     Percent combined: 96.44%
[FLASH]
[FLASH] Writing histogram files.
[FLASH]
[FLASH] FLASH v1.2.11 complete!
[FLASH] 32.562 seconds elapsed
[FLASH] Starting FLASH v1.2.11
[FLASH] Fast Length Adjustment of SHort reads
[FLASH]
[FLASH] Input files:
[FLASH]     K0_clean_R1.fq
[FLASH]     K0_clean_R2.fq
[FLASH]
[FLASH] Output files:
[FLASH]     ./K0.extendedFrags.fastq
[FLASH]     ./K0.notCombined_1.fastq
[FLASH]     ./K0.notCombined_2.fastq
[FLASH]     ./K0.hist
[FLASH]     ./K0.histogram
[FLASH]
[FLASH] Parameters:
[FLASH]     Min overlap:           10
[FLASH]     Max overlap:           250
[FLASH]     Max mismatch density:  0.250000
[FLASH]     Allow "outie" pairs:   false
[FLASH]     Cap mismatch quals:    false
[FLASH]     Combiner threads:      8
[FLASH]     Input format:          FASTQ, phred_offset=33
[FLASH]     Output format:         FASTQ, phred_offset=33
[FLASH]
[FLASH] Starting reader and writer threads
[FLASH] Starting 8 combiner threads
[FLASH] Processed 25000 read pairs
[FLASH] Processed 50000 read pairs
[FLASH] Processed 75000 read pairs
[FLASH] Processed 100000 read pairs
[FLASH] Processed 125000 read pairs
[FLASH] Processed 150000 read pairs
[FLASH] Processed 175000 read pairs
[FLASH] Processed 200000 read pairs
[FLASH] Processed 225000 read pairs
[FLASH] Processed 250000 read pairs
[FLASH] Processed 275000 read pairs
[FLASH] Processed 300000 read pairs
[FLASH] Processed 325000 read pairs
[FLASH] Processed 350000 read pairs
[FLASH] Processed 375000 read pairs
[FLASH] Processed 400000 read pairs
[FLASH] Processed 425000 read pairs
[FLASH] Processed 450000 read pairs
[FLASH] Processed 475000 read pairs
[FLASH] Processed 500000 read pairs
[FLASH] Processed 525000 read pairs
[FLASH] Processed 550000 read pairs
[FLASH] Processed 575000 read pairs
[FLASH] Processed 600000 read pairs
[FLASH] Processed 625000 read pairs
[FLASH] Processed 650000 read pairs
[FLASH] Processed 675000 read pairs
[FLASH] Processed 700000 read pairs
[FLASH] Processed 725000 read pairs
[FLASH] Processed 750000 read pairs
[FLASH] Processed 775000 read pairs
[FLASH] Processed 800000 read pairs
[FLASH] Processed 825000 read pairs
[FLASH] Processed 850000 read pairs
[FLASH] Processed 875000 read pairs
[FLASH] Processed 900000 read pairs
[FLASH] Processed 925000 read pairs
[FLASH] Processed 947592 read pairs
[FLASH]
[FLASH] Read combination statistics:
[FLASH]     Total pairs:      947592
[FLASH]     Combined pairs:   845383
[FLASH]     Uncombined pairs: 102209
[FLASH]     Percent combined: 89.21%
[FLASH]
[FLASH] Writing histogram files.
[FLASH]
[FLASH] FLASH v1.2.11 complete!
[FLASH] 14.494 seconds elapsed
(base) magdalena_dabrowska@DESKTOP-N4MLIUB:~/ANALIZA0903$ # Liczba zmergowanych odczytów (każdy read ma 4 linie w FASTQ)
wc -l D11.extendedFrags.fastq
wc -l K0.extendedFrags.fastq

# Liczba odczytów = liczba linii / 4
6944924 D11.extendedFrags.fastq
3381532 K0.extendedFrags.fastq
(base) magdalena_dabrowska@DESKTOP-N4MLIUB:~/ANALIZA0903$ cd ~/ANALIZA0903/NGS_data_analysis
(base) magdalena_dabrowska@DESKTOP-N4MLIUB:~/ANALIZA0903/NGS_data_analysis$ nano run_fastp_D11.sh
nano run_fastp_K0.sh
(base) magdalena_dabrowska@DESKTOP-N4MLIUB:~/ANALIZA0903/NGS_data_analysis$ nano run_fastp_D11.sh nano run_fastp_K0.sh
(base) magdalena_dabrowska@DESKTOP-N4MLIUB:~/ANALIZA0903/NGS_data_analysis$fastp -i K0_FDDP202401554-1a_HLVKWDRXX_L1_1.fq.gz -I K0_FDDP202401554-1a_HLVKWDRXX_L1_2.fq.gz -o K0_clean_R1.fq.gz -O K0_clean_R2.fq.gz -h K0_fastp_report.html -j K0_fastp_report.json --detect_adapter_for_pe --trim_poly_g --cut_front --cut_tail --cut_mean_quality 20 --length_required 50
