# Project Overview

This repository contains several scripts and tools to make server management and process monitoring easier. Below is an explanation of the folders and their contents.

## Folders and Their Contents

### 1. **processAlert**
This folder contains a script that monitors the completion of long-running processes and sends an email notification once the process finishes.

#### Key Features:
- **Automated Email Alerts**: Sends an email notification when a specified process finishes running.
    
**Use Case**: You can use this script to be notified when a data processing task, script, or long-running command completes, without needing to monitor the terminal.

---

### 2. **sshTools**
This folder contains scripts designed to simplify server interaction by automating tasks like logging in to a remote server without needing to type in the password each time, as well as automating file uploads and downloads.

#### Key Features:
- **Passwordless Login**: Utilizes SSH keys to enable logging in to a remote server without needing to type the password manually.
- **File Transfer Automation**: Includes scripts that make uploading and downloading files to/from a server easier, without the need for typing the password each time.

**Use Case**: This folder is particularly useful for anyone who frequently interacts with a remote server and wants to streamline the login process and file management.

---

By organizing your scripts into these folders, you can quickly identify and use the tools that are most relevant to your needs, whether it's monitoring processes or automating server interactions.
