#!/bin/bash

# Loop all individuals
# Starting with demultiplexed individuals

for name in your/working/dir/phox_ddrad/results/03_demultiplex/*.rem.1.fq.gz

  do

    # Extract individual ID from the file path
    temp=${name%%.*}       # Remove file extension
    ID=${temp##*/}         # Get the last part (individual ID)
    dir=${temp%/*}         # Get the directory part

    echo "Processing individual: $ID"

    echo """
    #!/bin/bash

    # Name of Job
    #PBS -N BWA_${ID}

    # Redirect output stream to this file
    #PBS -o your/working/dir/phox_ddrad/PBS_out/04_bwa/PBSoutput_${ID}.logfiles

    # Stream Standard Error to output
    #PBS -j oe

    # Select a maximum of 20 cores and 200GB of RAM
    #PBS -l select=1:ncpus=20:mem=200gb

    # Load necessary modules
    module load NGSmapper/bwa-0.7.13 # For BWA alignment
    module load Tools/samtools-1.12 # For BAM conversion and sorting

    # Run BWA mem for alignment and pipe to samtools to convert and sort
    bwa mem -t 20 your/working/dir/phox_ddrad/Phoxinus_draftgenome/fPhoPho.hap1.20220427.fa.gz \
    ${dir}/${ID}.1.fq.gz \
    ${dir}/${ID}.2.fq.gz \
    | samtools view -bh \
    | samtools sort > your/working/dir/phox_ddrad/results/04_bwa_referenced_aligned/${ID}.bam
    """ > your/working/dir/phox_ddrad/shell/04_bwa/Phox/QSUB_${ID}.sh

    # Submit the job to the cluster
    qsub your/working/dir/phox_ddrad/shell/04_bwa/Phox/QSUB_${ID}.sh

done
