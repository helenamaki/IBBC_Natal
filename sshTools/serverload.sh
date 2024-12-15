#!/bin/bash

# Define the server and username
SERVER="????.fc.ul.pt"       # Replace with your server address
USERNAME="??"           # Replace with your username
PASSWORD="??"         # Replace with your actual password

# Prompt for the action (upload or download)
read -p "Do you want to upload or download a file? (Enter 'up' or 'down'): " action
read -p "Do you want to use scp or rsync: " mode

# Made it so it just checks the first letter to make it even quicker if you just want to input one character
if [ "${action:0:1}" == "u" ]; then
    # Prompt for the local file path
    read -p "Enter the local file path to upload: " local_file_path
    local_file_path="${local_file_path/#\~\//}"
    
    # Prompt for the server destination
    read -p "Enter the destination path on the server: " remote_destination
    
    # Upload the file using sshpass
    if [[ "${mode:0:1}" == "r" ]]; then
        sshpass -p "$PASSWORD" rsync -avz "$HOME/$local_file_path" "$USERNAME@$SERVER:$remote_destination"
    elif [[ "${mode:0:1}" == "s" ]]; then
        sshpass -p "$PASSWORD" scp -r "$HOME/$local_file_path" "$USERNAME@$SERVER:$remote_destination"
    else
        echo "Invalid option. Please run the script again and enter 'scp' or 'rsync'."
    fi
    
    echo "Please check if it was uploaded"

elif [ "${action:0:1}" == "d" ]; then
    # Downloading a file
    read -p "Enter the path of the file on the server to download: " remote_file_path
    remote_file_path="${remote_file_path/#\~\//}"
    
    # Prompt for the local destination
    read -p "Enter the local destination path: " local_destination

    # Download the file using sshpass
    if [[ "${mode:0:1}" == "r" ]]; then
        sshpass -p "$PASSWORD" rsync -avz "$USERNAME@$SERVER:$remote_file_path" "$HOME/$local_destination"
    elif [[ "${mode:0:1}" == "s" ]]; then
        sshpass -p "$PASSWORD" scp -r "$USERNAME@$SERVER:$remote_file_path" "$HOME/$local_destination"	
    else
        echo "Invalid option. Please run the script again and enter 'scp' or 'rsync'."
    fi
    
    echo "Please check if it was downloaded"

else
    echo "Invalid option. Please run the script again and enter 'up' or 'down'."
fi