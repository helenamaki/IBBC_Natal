# Setting Up Dependencies for FCUL Server

This guide helps you set up the necessary dependencies and permissions to work with the FCUL server.

## Prerequisites

Ensure you have the following dependencies installed:

- **`sshpass`**: A command-line tool for non-interactive password authentication.
- **`chmod`**: To change file permissions.

### Step 1: Install `sshpass`

If you don't have `sshpass` installed, you can install it using the following commands depending on your system:

#### For Debian/Ubuntu-based systems:
```bash
sudo apt-get update
sudo apt-get install sshpass
```
#### For macOS:

```bash
Copy code
brew install brew install sshpass
```

### Step 2: Set Up the Script for Easy Access
1. Edit the Variables: Open the script and fill in your actual username and password for the FCUL server:
```bash
Copy code
SERVER="thor.fc.ul.pt"
USERNAME="your_actual_username"  # Replace with your actual username
PASSWORD="your_password"        # Replace with your actual password
```

# Creating an Icon to Run a Command

This guide explains how to create an icon that runs a command on **Windows**, **macOS**, and **Linux**.

---

## **For Windows**

### Step 1: Create a Batch File (.bat)

1. Open **Notepad** or any text editor.
2. Write the command you want to run. For example, if you're running an `ssh` command with `sshpass`:

    ```batch
    sshpass -p "your_password" ssh your_username@thor.fc.ul.pt
    ```

3. Save the file with a `.bat` extension. For example: `run_ssh.bat`.

### Step 2: Create a Shortcut to the Batch File

1. **Right-click** on the `.bat` file you just created.
2. Select **Send to** > **Desktop (create shortcut)**.
3. On your desktop, you will now have a shortcut to the batch file. You can double-click this icon to execute the command.

### Step 3: Change the Icon (Optional)

1. **Right-click** the shortcut and choose **Properties**.
2. In the **Shortcut** tab, click on the **Change Icon** button.
3. Choose an icon from the list or browse to an icon file (.ico) of your choice.

---

# Creating an Icon to Run `login_to_server.sh` on macOS, Windows, and Linux

This guide explains how to create a command file that runs the `login_to_server.sh` script and assign an icon to the file for **macOS**, **Windows**, and **Linux**. 

---

## macOS Instructions

### Step 1: Make the Shell Script Executable

1. Make sure `login_to_server.sh` is located in a directory (e.g., `~/Desktop/Ferrementas/scripts/`).
2. Open **Terminal** and make the script executable by running:

    ```bash
    chmod +x ~/Desktop/Ferrementas/scripts/login_to_server.sh
    ```

---

### Step 2: Create the `.command` File

1. Open **TextEdit** and set the format to **Plain Text**.
2. Write the following:

    ```bash
    #!/bin/bash
    ~/Desktop/Ferrementas/scripts/login_to_server.sh
    ```

3. Save the file as `run_login_to_server.command`.
4. Make it executable by running the following in **Terminal**:

    ```bash
    chmod +x /path/to/run_login_to_server.command
    ```

### Step 3: Change the Icon (Optional)

1. Download or find an icon you want to use (e.g., FCUL logo).
2. Right-click the `.command` file and select **Get Info**.
3. Drag and drop your icon file into the top-left corner of the **Get Info** window.

---

## Windows Instructions

### Step 1: Install `sshpass` (if not installed)

1. Download **Git Bash** from [Git's official website](https://git-scm.com/).
2. Install **sshpass** using **Git Bash**:

    ```bash
    sudo apt-get install sshpass
    ```

---

### Step 2: Create the Batch Script (`login_to_server.bat`)

1. Open **Notepad**.
2. Write the following batch script:

    ```batch
    @echo off
    set SERVER=thor.fc.ul.pt
    set USERNAME=your_username
    set PASSWORD=your_password

    sshpass -p %PASSWORD% ssh %USERNAME%@%SERVER%
    ```

3. Save the file as `login_to_server.bat`.

---

### Step 3: Change the Icon (Optional)

1. Download an icon (e.g., FCUL logo).
2. Right-click the `.bat` file and select **Create shortcut**.
3. Right-click the shortcut and select **Properties**.
4. Under the **Shortcut** tab, click **Change Icon...**.
5. Browse to the icon you downloaded, select it, and click **OK**.

---

## Linux Instructions

### Step 1: Make the Shell Script Executable

1. Make sure `login_to_server.sh` is in the correct directory (e.g., `~/Desktop/Ferrementas/scripts/`).
2. Open **Terminal** and make the script executable:

    ```bash
    chmod +x ~/Desktop/Ferrementas/scripts/login_to_server.sh
    ```

---

### Step 2: Create the `.desktop` File (Linux)

1. Open your text editor and create a new file:

    ```bash
    [Desktop Entry]
    Name=Login to Server
    Exec=~/Desktop/Ferrementas/scripts/login_to_server.sh
    Icon=/path/to/icon.png  # Optional: path to your custom icon
    Terminal=true
    Type=Application
    ```

2. Save the file as `login_to_server.desktop`.
3. Make the `.desktop` file executable:

    ```bash
    chmod +x /path/to/login_to_server.desktop
    ```

---
