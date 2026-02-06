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

MESSAGE=""
THRESHOLD=4
IP_ADDRESS=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)

log() {
    echo -e "$(date "+%Y-%m-%d-%H:%M:%S") $1" | tee -a $LOG_FILE
}

DISK_USAGE=$(df -hT | grep -v Filesystem)

# tTODO: check again  
# MESSAGE=$(echo "$DISK_USAGE" | awk -v thresh=$THRESHOLD '$5+0 >= thresh {printf "<b>%s</b>: %s<br>", $6, $5}')


while IFS= read line; do
    USAGE=$(echo $line | awk '{print $6}' | cut -d "%" -f1)
    PARTITION=$(echo $line | awk '{print $7}')
    if [ "$USAGE" -gt "$THRESHOLD" ]; then
        MESSAGE+="<b>$PARTITION</b>: $USAGE% usage<br>"
    fi
done <<< $DISK_USAGE

sh mail.sh "prasanthreddy1792@gmail.com" "High disk usage alert on $IP_ADDRESS" "$MESSAGE" "HIGH_DISK_USAGE" "$IP_ADDRESS" "DEVOPS Team"