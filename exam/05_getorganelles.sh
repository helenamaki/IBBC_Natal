#!/bin/bash

source /home/fc64678/miniconda3/etc/profile.d/conda.sh
conda activate organelles

# Directories to work with
data_dir="02_fastp"
output_dir="05_getorganelles"
seed_database="SardinaMH329246.fasta"

# Loop through the raw data files and process them in paired-end manner
echo "Running GetOrganelle for organelle extraction..."
for fastq_file_R1 in "$data_dir"/*_R1_trimmed.fastq.gz; do
    # Get the base name (without the _R1.fastq.gz suffix)
    basename=$(basename "$fastq_file_R1" _R1_trimmed.fastq.gz)

    # Find the corresponding _R2.fastq.gz file
    fastq_file_R2="$data_dir/${basename}_R2_trimmed.fastq.gz"

    # Check if the corresponding _R2 file exists
    if [ -f "$fastq_file_R2" ]; then
        # Run GetOrganelle for the pair of files
        echo "Processing pair: $basename"
        get_organelle_from_reads.py -1 "$fastq_file_R1" \
                                    -2 "$fastq_file_R2" \
                                    -R 10 \
                                    -k 21,45,65,85,105 \
                                    -F animal_mt \
                                    -t 8 \
                                    -s "$seed_database" \
                                    -o "$output_dir/${basename}_organelles"
        echo "Completed GetOrganelle for: $basename"
    else
        echo "Warning: No corresponding R2 file found for $basename, skipping."
    fi
done

echo "Completed organelle extraction."

conda deactivate
