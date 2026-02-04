#!/bin/bash

# Take user input from src dir and dest dir and days info(by default 14 days)
# Validate inputs: src dir and dest dir exists or not
# Find the files
# archive them in backup/dest folder
# check archival status if success then
# delete them in src folder


R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-roboshop"
SCRIPT_NAME=$(basename "$0")
LOG_FILE="${LOGS_FOLDER}/backup.log"
mkdir -p "$LOGS_FOLDER"

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}

log() {
    echo -e "$(date "+%Y-%m-%d %H:%M:%S") $1" | tee -a $LOG_FILE
}

USAGE() {
    log "sudo bash backup <src dir> <dest dir> <days>(14 days default)"
}

if [ $# -lt 2 ]; then
    USAGE
    exit 1
fi

if [ $USERID -ne 0 ]; then
    log "please check user access and permissions"
    exit 1
fi

if [ ! -d "$SOURCE_DIR" ]; then
    log "Source directory : $SOURCE_DIR does not exists"
    exit 1
fi

if [ ! -d "$DEST_DIR" ]; then
    log "Destination directory : $DEST_DIR does not exists"
    exit 1
fi

FILES=$(find "$SOURCE_DIR" -name "*.log" -type f -mtime +"$DAYS")

log "back up started"
log "Source directory :  $SOURCE_DIR"
log "Destination directory :  $DEST_DIR"
log "Days : $DAYS"

if [ -z "$FILES" ]; then
    log "no filesto archive... skipping"
else
    log "Files found to archive : $FILES"
    TIME_STAMP=$(date "+%Y-%m-%d %H:%M:%S")
    ZIP_FILE_NAME="$DEST_DIR/applogs_$TIME_STAMP.tar,gz"

    tar -zcvf "$ZIP_FILE_NAME" "$FILES"

    if [ -f "$ZIP_FILE_NAME" ]; then
        log "Archival success..."
        while IFS= read -r filepath; do
            rm -rf $filepath
            log "removed $filepath"
        done <<< $FILES
    else
        log "archival failed"
        exit 1
    fi
fi

