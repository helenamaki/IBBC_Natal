#!/bin/bash

# Activate conda environment for tools_qc
source /home/fc64678/miniconda3/etc/profile.d/conda.sh
conda activate tools_qc
# Step 1: Run MultiQC on the FastQC output directory
echo "Running MultiQC on FastQC results..."

# Run MultiQC on the 03_fastqc directory
multiqc "03_fastqc" -o "04_multiqc"

# Display completion message
echo "MultiQC report generated in 04_multiqc/"

# Deactivate conda environment
conda deactivate
