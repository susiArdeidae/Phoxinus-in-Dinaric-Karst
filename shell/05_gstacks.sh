#!/bin/bash

# Name of Job
#PBS -N 05_gstacks_plum

# Redirect output stream to this file
#PBS -o your/working/dir/phox_ddrad/PBS_out/05_gstacks_slo.log

# Stream Standard output and standard Error to outputfile
#PBS -j oe

# Select a maximum of 50 cores and 250GB of RAM
#PBS -l select=1:ncpus=50:mem=250gb

# Load dependencies
module load NGSmapper/stacks-2.59

## Define input and output directories
INPUT_DIR="your/working/dir/phox_ddrad/results/04_bwa_referenced_aligned"
POP_MAP="your/working/dir/phox_ddrad/data/popmaps/popmap_plum.txt"
OUT_DIR="your/working/dir/phox_ddrad/results/05_gstacks"

# Run gstacks to build loci for each individual
gstacks -I ${INPUT_DIR} -M ${POP_MAP} -t 50 -O ${OUT_DIR}

