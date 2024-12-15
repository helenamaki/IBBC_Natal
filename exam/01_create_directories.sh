#!/bin/bash

# Directories to create
directories=("01_rawdata" "02_fastp" "03_fastqc" "04_multiqc" "05_getorganelles")

# Create the directories, but only clean out ones that are not '01_rawdata'
for dir in "${directories[@]}"; do
    if [ ! -d "$dir" ]; then
        mkdir "$dir"
        echo "Created directory: $dir"
    else
        if [ "$dir" != "01_rawdata" ]; then
            rm -rf "$dir"/*  # Clean contents, but not the directory itself
            echo "Cleaned directory: $dir"
        fi
    fi
done
