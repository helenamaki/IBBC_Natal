# Overview

This repository contains several scripts and tools to make server management and process monitoring easier. Below is an explanation of the folders and their contents.

## Folders and Their Contents

### 1. **processAlert**
This folder contains a script that monitors the completion of long-running processes and sends an email notification once the process finishes.

---

### 2. **sshTools**
This folder contains scripts designed to simplify server interaction by automating tasks like logging in to a remote server without needing to type in the password each time, as well as automating file uploads and downloads.

#### Key Features:
- **Passwordless Login**: Utilizes SSH keys to enable logging in to a remote server without needing to type the password manually.
- **File Transfer Automation**: Includes scripts that make uploading and downloading files to/from a server easier, without the need for typing the password each time.

---

### 3. **exam**
This folder contains my scripts for my exam including:
- **run_pipeline.sh**: The master script that runs the rest of the scripts. Times the process. Uses multithreading to speed it up.
- **01_create_directories.sh**: Creates the directories. 0x_process is the format in which each process' results are output.
- **02_fastp.sh**: Preprocessing of raw data with fastp.
- **03_fastqc.sh**: Quality control with multiqc run on the fastp output.
- **04_multiqc.sh**: Runs multiqc on fastqc results to generate a quality control report.
- **05_getorganelles.sh**: Runs organelles on the samples from fastp.
- **IBBCEmail.py**: Sends an email to the class notiftying of the end of the project with the log and a link to this GitHub in the body.

Final exam also requires a class email list in a csv file and a version of the python script that has a propper password (not included for obvious security reasons).

---
