# Factors beyond karstification have shaped the population structure of a surface-dwelling minnow (Phoxinus lumaireul) able to disperse underground


This repositories includes the following Bash Scripts:


01. Trim Galore (01_trimgalore.sh)

Trims sequencing data with Trim Galore.

02. Clone Filter (02_clonefilter.sh)

Removes PCR duplicates with Stacks clone_filter.

03. Demultiplex (03_demultiplex.sh)

Demultiplexes reads based on barcodes.

04. Reference Alignment (04_bwa_mapping.sh)

Aligns demultiplexed individuals to a reference genome with BWA-MEM and sorts output with SAMtools.

05. gstacks (05_gstacks.sh)

Builds loci from paired-end alignment data using gstacks.

06. populations Analysis (06_populations.sh)

Runs STACKS populations with varying minor allele frequency (MAF) filtering.
