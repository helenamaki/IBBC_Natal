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

## **For macOS**

### Step 1: Create a Shell Script (.sh)

1. Open **TextEdit** and set the format to **Plain Text** (Format > Make Plain Text).
2. Write your command inside the script. For example:

    ```bash
    #!/bin/bash
    sshpass -p "your_password" ssh your_username@thor.fc.ul.pt
    ```

3. Save the file with a `.sh` extension (e.g., `run_ssh.sh`).

### Step 2: Make the Script Executable

1. Open **Terminal**.
2. Navigate to the directory where your `.sh` file is saved.
3. Run the following command to make the script executable:

    ```bash
    chmod +x run_ssh.sh
    ```

### Step 3: Create a Custom Application Icon (Using Automator)

1. Open **Automator** (you can find it using Spotlight).
2. Select **Application** when prompted to choose a document type.
3. In the search bar, type **"Run Shell Script"** and drag the action into the workflow.
4. Inside the **Run Shell Script** box, enter the path to your script. For example:

    ```bash
    /path/to/run_ssh.sh
    ```

5. Save the Automator application with a name like `Run SSH.app` on your desktop.
6. Right-click the new app, select **Get Info**, and drag a custom icon file (.icns) to the icon area.

Now, you can double-click the application on your desktop to run the command.

---

## **For Linux**

### Step 1: Create a Shell Script (.sh)

1. Open your preferred text editor and write your command inside the script. For example:

    ```bash
    #!/bin/bash
    sshpass -p "your_password" ssh your_username@thor.fc.ul.pt
    ```

2. Save the file with a `.sh` extension (e.g., `run_ssh.sh`).

### Step 2: Make the Script Executable

1. Open a terminal.
2. Navigate to the folder where the `.sh` file is located.
3. Make it executable with the following command:

    ```bash
    chmod +x run_ssh.sh
    ```

### Step 3: Create a Desktop Shortcut (Launcher)

1. In your terminal, navigate to the directory where you want to create the launcher (typically `~/Desktop`).
2. Create a `.desktop` file by running:

    ```bash
    nano run_ssh.desktop
    ```

3. Inside the file, write the following:

    ```ini
    [Desktop Entry]
    Version=1.0
    Name=Run SSH
    Comment=Run SSH command using sshpass
    Exec=/path/to/run_ssh.sh
    Icon=/path/to/icon.png
    Terminal=false
    Type=Application
    ```

4. Save and exit by pressing **Ctrl+X**, then **Y**, and then **Enter**.
5. Make the `.desktop` file executable:

    ```bash
    chmod +x run_ssh.desktop
    ```

Now, you can double-click the `.desktop` file to run the command, and it will appear as an icon on your desktop.

---

## Conclusion

By following these steps, you can create custom icons to easily run commands, whether you're on **Windows**, **macOS**, or **Linux**. This setup will help streamline your workflow and make repeated tasks more convenient.

