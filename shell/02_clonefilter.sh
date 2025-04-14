#!/bin/sh

#PBS -N 02_clonefilter
#PBS -o your/working/dir/phox_ddrad/PBS_out/02_clonefilter.txt
#PBS -j oe
#PBS -l select=1:ncpus=20:mem=200gb

module load NGSmapper/stacks-2.59

WORK_DIR="your/working/dir/phox_ddrad"
IN_DIR="$WORK_DIR/results/01_trimgalore"
OUT_DIR="$WORK_DIR/results/02_clonefilter"

for pool in {1..94}
do
    if [[ -f "$IN_DIR/Pool${pool}_1_val_1.fq.gz" && -f "$IN_DIR/Pool${pool}_2_val_2.fq.gz" ]]; then
        clone_filter "$IN_DIR/Pool${pool}_1_val_1.fq.gz" "$IN_DIR/Pool${pool}_2_val_2.fq.gz" \
        -i gzfastq -o "$OUT_DIR" --inline_inline --oligo_len_1 0 --oligo_len_2 4
    fi
done
