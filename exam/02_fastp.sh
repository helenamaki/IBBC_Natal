#!/bin/bash

# Activate conda environment for tools_qc
# Ensure conda is initialized
source /home/fc64678/miniconda3/etc/profile.d/conda.sh

conda activate tools_qc

# Step 1: Process FastQ files in pairs (R1 and R2) from 01_rawdata
echo "Running fastp for quality control and trimming..."

# Loop over all pairs of raw FastQ files
for fastq_file_R1 in "01_rawdata"/*_R1.fastq.gz; do
    # Get the corresponding R2 FastQ file
    fastq_file_R2="${fastq_file_R1/_R1.fastq.gz/_R2.fastq.gz}"
    
    # Check if the R2 file exists
    if [[ -f "$fastq_file_R2" ]]; then
        # Get the base name (without extension) to name output files
        base_name=$(basename "$fastq_file_R1" _R1.fastq.gz)
        
        echo "Processing pair: $base_name with fastp"
        
        # Run fastp on the pair of files
        fastp -i "$fastq_file_R1" -I "$fastq_file_R2" \
              -o "02_fastp/${base_name}_R1_trimmed.fastq.gz" \
              -O "02_fastp/${base_name}_R2_trimmed.fastq.gz" \
              -l 80 -q 20 -g -D -p \
              --html "02_fastp/${base_name}_fastp.html" \
              --failed_out "02_fastp/${base_name}_failed.out" \
              --json "02_fastp/${base_name}_fastp.json"
        
        echo "Completed fastp for: $base_name"
    else
        echo "Warning: No corresponding R2 file for $fastq_file_R1"
    fi
done
