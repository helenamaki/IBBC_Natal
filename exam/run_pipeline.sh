#!/bin/bash
# DefineEmailListFile
EMAIL_LIST_FILE="courseEmails.csv"
# Capture the start time
start_time=$(date +%s)
# Define log folder and log file name
LOG_FOLDER="logs"
LOG_FILE="$LOG_FOLDER/output.log"

# Check if the "logs" directory exists
if [ ! -d "$LOG_FOLDER" ]; then
    # If it doesn't exist, create the "logs" directory
    echo "Log folder does not exist. Creating '$LOG_FOLDER'."
    mkdir "$LOG_FOLDER"
else
    # If it exists, clean out its contents (remove existing logs)
    echo "Log folder '$LOG_FOLDER' exists. Cleaning out old logs."
    rm -f "$LOG_FOLDER/*"
fi

# Start logging all output (echoes and command outputs) to the log file and terminal
exec > >(tee -a "$LOG_FILE") 2>&1

# Print a message to indicate that logging has started
echo "Logging started... All output will be saved to $LOG_FILE and displayed here."

# Execute the first script to create directories
echo "Executing 01_create_directories.sh"
bash 01_create_directories.sh

# Fastp must be done first
echo "Executing 02_fastp.sh"
bash 02_fastp.sh

# Multithreaded process to speed it up
# These two both work on fastp so they can run at the same time
# Start FastQC in the background
{
    echo "Executing 03_fastqc.sh"
    bash 03_fastqc.sh
} &  # Run FastQC in the background
FASTQ_PID=$!  # Store the PID of the FastQC process

# Start GetOrganelle in parallel with FastQC
{
    echo "Executing 05_getorganelles.sh"
    bash 05_getorganelles.sh
} &  # Run GetOrganelle in the background
GETORGANELLES_PID=$!  # Store the PID of the GetOrganelle process

# Wait for FastQC to finish before starting MultiQC
wait $FASTQ_PID  # Wait for FastQC to finish

# Now run MultiQC (after FastQC completes)
{
    echo "Executing 04_multiqc.sh"
    bash 04_multiqc.sh
} &  # Run MultiQC in the background
MULTIQC_PID=$!  # Store the PID of the MultiQC process
# Wait for both GetOrganelle and MultiQC to finish
wait $GETORGANELLES_PID
wait $MULTIQC_PID 
# Capture the end time
end_time=$(date +%s)

# Calculate the duration
duration=$((end_time - start_time))
# Stop logging to the file and print only to the terminal
echo "Total execution time: $((duration / 60)) minutes and $((duration % 60)) seconds."
exec > /dev/tty 2>&1

source /home/fc64678/miniconda3/etc/profile.d/conda.sh
conda activate base

# Now run the Python script to send the email with the log
echo "Sending email with log contents"
python IBBCEmail.py "$LOG_FILE" "$EMAIL_LIST_FILE"
