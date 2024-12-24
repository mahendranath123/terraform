#!/bin/bash

: << 'readme'
This script performs a backup with a 5-day rotation.

Usage:
./backup.sh <path_to_source> <path_to_backup_directory>

Example:
./backup.sh /path/to/source /path/to/backup

The script will:
1. Create a compressed tar backup of the source directory.
2. Rotate backups by deleting backups older than 5 days in the backup directory.

readme

# Function to display usage instructions
function display_usage {
    echo "Usage: ./backup.sh <path_to_source> <path_to_backup_directory>"
    exit 1
}

# Ensure the script is called with the correct number of arguments
if [ $# -ne 2 ]; then
    display_usage
fi

# Assign arguments to variables
source_dir=$1
backup_dir=$2

# Validate source directory
if [ ! -d "$source_dir" ]; then
    echo "Error: Source directory '$source_dir' does not exist."
    exit 1
fi

# Validate or create backup directory
if [ ! -d "$backup_dir" ]; then
    echo "Backup directory '$backup_dir' does not exist. Creating it..."
    mkdir -p "$backup_dir"
    if [ $? -ne 0 ]; then
        echo "Error: Failed to create backup directory '$backup_dir'."
        exit 1
    fi
fi

# Create a timestamp for the backup file
timestamp=$(date '+%Y-%m-%d-%H-%M-%S')

# Function to create a backup
function create_backup {
    zip -r "${backup_dir}/backup_${timestamp}.zip" "$source_dir" > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "Backup created successfully: ${backup_dir}/backup_${timestamp}.zip"
    else
        echo "Error: Failed to create backup."
        exit 1
    fi
}

# Function to rotate old backups (delete files older than 5 days)
function rotate_backups {
    echo "Rotating backups: Removing files older than 5 days in $backup_dir"
    find "$backup_dir" -type f -name "backup_*.zip" -mtime +5 -exec rm -f {} \;
    if [ $? -eq 0 ]; then
        echo "Backup rotation completed successfully."
    else
        echo "Error: Failed to rotate backups."
        exit 1
    fi
}

# Perform the backup and rotation
create_backup
rotate_backups
