#!/bin/sh

#PBS -N 01_trimgalore
#PBS -o your/working/dir/phox_ddrad/PBS_out/01_trimgalore.txt
#PBS -j oe
#PBS -l select=1:ncpus=20:mem=200gb

source /opt/anaconda3/etc/profile.d/conda.sh
conda activate trim-galore-0.6

WORK_DIR="your/working/dir/phox_ddrad"
RAW_DIR="$WORK_DIR/rawdata"
OUT_DIR="$WORK_DIR/results/01_trimgalore"

#Setup Trim Galore Output Directory
mkdir -p $WORK_DIR/results/01_trimgalore

for pool in {1..85}
do
    if [[ -f "$RAW_DIR/Pool${pool}_1.fastq.gz" && -f "$RAW_DIR/Pool${pool}_2.fastq.gz" ]]; then
        trim_galore --paired --quality 30 --length 40 --cores 10 -o "$OUT_DIR" "$RAW_DIR/Pool${pool}_1.fastq.gz" "$RAW_DIR/Pool${pool}_2.fastq.gz"
    fi
done
