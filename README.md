# Project Overview

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
- **run_pipeline.sh**: The master script that runs the rest of the scripts.
- **01_create_directories.sh**: Creates the directories.
- **02_fastp.sh**: Preprocessing.
- **03_fastqc.sh**: Quality control.
- **04_multiqc.sh**: The master script that runs the rest of the scripts.
- **05_getorganelles.sh**: Creates the directories
- **IBBCEmail.py**: Creates the directories

Final exam also requires a class email list in a csv file and a version of the python script that has a propper password (not included for obvious security reasons).

---
