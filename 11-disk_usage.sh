#!/bin/

# check disk usage 
# based on threshold set value compare with usage value
# if usage value exceeds threshold, send an alert mail

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

THRESHOLD=4

log() {
    echo -e "$(date "+%Y-%m-%d-%H:%M:%S") $1" | tee -a $LOG_FILE
}

DISK_USAGE=$(df -hT | grep -v Filesystem)

while IFS= read line; do
    USAGE=$(echo $line | awk '{print $6}' | cut -d "%" -f1)
    PARTITION=$(echo $line | awk '{print $7}')
    if [ "$USAGE" -gt "$THRESHOLD" ]; then
        log "disk usage : $USAGE is excedded from threshold level : $THRESHOLD : at $PARTITION"
    fi
done <<< $DISK_USAGE
