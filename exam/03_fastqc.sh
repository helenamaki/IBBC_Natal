#!/bin/bash

# Activate conda environment for tools_qc
source /home/fc64678/miniconda3/etc/profile.d/conda.sh
conda activate tools_qc

# Step 1: Process trimmed FastQ files from 02_fastp
echo "Running FastQC on trimmed data..."

# Loop through all trimmed R1 FastQ files in the 02_fastp directory
for fastq_file_R1 in "02_fastp"/*_R1_trimmed.fastq.gz; do
    # Get the corresponding R2 trimmed FastQ file
    fastq_file_R2="${fastq_file_R1/_R1_trimmed.fastq.gz/_R2_trimmed.fastq.gz}"
    
    # Check if the R2 file exists
    if [[ -f "$fastq_file_R2" ]]; then
        # Get the base name to name output files
        base_name=$(basename "$fastq_file_R1" _R1_trimmed.fastq.gz)
        
        echo "Running FastQC for: $base_name"
        
        # Run FastQC on the trimmed pair
        fastqc -o "03_fastqc" "$fastq_file_R1" "$fastq_file_R2"
        
        echo "Completed FastQC for: $base_name"
    else
        echo "Warning: No corresponding R2 file for $fastq_file_R1"
    fi
done

# Deactivate conda environment
conda deactivate

