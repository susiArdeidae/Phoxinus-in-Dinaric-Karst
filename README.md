# Factors beyond karstification have shaped the population structure of a surface-dwelling minnow (Phoxinus lumaireul) able to disperse underground

This repository contains the ddRAD data processing pipeline used in the manuscript:
“Factors beyond karstification have shaped the population structure of a surface-dwelling minnow (Phoxinus lumaireul) able to disperse underground.”

The analyses explore how both historical and contemporary factors influence the genetic structure of P. lumaireul across karst and non-karst habitats using ddRADseq data.

Overview

This project uses ddRAD sequencing data digested with MsPI and EcoRI, and size-selected for fragments 250–450 bp in length.
The processing pipeline is based on widely used tools including Trim Galore, STACKS, BWA, and SAMtools.

📁 Available Bash Scripts

🔹 01_trimgalore.sh
Purpose: Trims sequencing reads.
Tool: Trim Galore
Function: Removes adapters and low-quality reads (Q<30), with minimum read length filtering.

🔹 02_clonefilter.sh
Purpose: Removes PCR duplicates.
Tool: clone_filter (Stacks v2.59)
Function: Filters out identical reads to reduce amplification bias.

🔹 03_demultiplex.sh
Purpose: Demultiplexes reads by barcode.
Tool: process_radtags (Stacks)
Function: Assigns reads to individual samples based on inline barcodes and filters reads for quality.

🔹 04_bwa_mapping.sh
Purpose: Aligns reads to a reference genome.
Tool: BWA-MEM + SAMtools
Function: Aligns paired-end reads to the Phoxinus phoxinus draft genome and generates sorted BAM files.

🔹 05_gstacks.sh
Purpose: Builds loci from aligned reads.
Tool: gstacks (Stacks v2.59)
Function: Calls SNPs, builds loci, and generates haplotypes across samples.

🔹 06_populations.sh
Purpose: Filters and exports SNP datasets.
Tool: populations (Stacks)
Function: Generates population-level SNP datasets under various filtering thresholds:
    MAF thresholds (0.01–0.05)
    Missing data and coverage filters

📂 Population Genomic Analyses

Additional scripts used for downstream analyses (PCA, ADMIXTURE, TreeMix, FST, migration rates, etc.) can be found here:
➡️ https://doi.org/10.57756/58udvj
