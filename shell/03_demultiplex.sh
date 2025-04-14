#!/bin/bash

#PBS -N 03_demultiplex
#PBS -o your/working/dir/phox_ddrad/PBS_out/03_demultiplex.txt
#PBS -j oe
#PBS -l select=1:ncpus=20:mem=200gb

module load NGSmapper/stacks-2.59

WORK_DIR="your/working/dir/phox_ddrad"
IN_DIR="$WORK_DIR/results/02_clonefilter"
OUT_DIR="$WORK_DIR/results/03_demultiplex"

for pool in {1..94}
do
    if [[ -f "$IN_DIR/Pool${pool}_1_val_1.fq.gz" && -f "$IN_DIR/Pool${pool}_2_val_2.fq.gz" ]]; then
        mkdir -p "$OUT_DIR/Pool${pool}"
        process_radtags -P --inline_inline -1 "$IN_DIR/Pool${pool}_1_val_1.fq.gz" \
        -2 "$IN_DIR/Pool${pool}_2_val_2.fq.gz" -o "$OUT_DIR/Pool${pool}" -c -q -r \
        --renz_1 ecoRI --renz_2 mspI -b "$WORK_DIR/data/barcodefiles/Pool${pool}.txt"
    fi
done
