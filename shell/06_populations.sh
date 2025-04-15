#!/bin/bash

# Define base directories
GSTACKS_DIR="your/working/dir/phox_ddrad/results/05_gstacks"
POP_MAP="your/working/dir/phox_ddrad/data/popmaps/popmap_plumslo.txt"
OUT_BASE_DIR="your/working/dir/phox_ddrad/results/06_populations"

# PBS Job Configuration
#PBS -N populations_revision
#PBS -o your/working/dir/phox_ddrad/PBS_out/06_populations.txt
#PBS -j oe
#PBS -l select=1:ncpus=20:mem=150gb

# Load dependencies
module load NGSmapper/stacks-2.59

# Loop over different MAF values from 0.01 to 0.05
for MAF in 0.01 0.02 0.03 0.04 0.05
do
    echo "Running populations with min-MAF: ${MAF}"

    # Define unique output directory for each MAF
    OUT_DIR="${OUT_BASE_DIR}/maf_${MAF}"
    mkdir -p "${OUT_DIR}"

    # Run populations
    populations \
    -P "${GSTACKS_DIR}" \
    -t 50 \
    -M "${POP_MAP}" \
    -O "${OUT_DIR}" \
    -R 0.85 \
    -r 0.5 \
    --min-maf "${MAF}" \
    --vcf

done
