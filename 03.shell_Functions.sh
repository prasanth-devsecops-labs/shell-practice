#!bin/bash

set -e

LOGS_FOLDER="/var/log/shell-practice"
LOG_FILE="${LOGS_FOLDER}/$0.log"

mkdir -p "${HOME}/var/log/shell-practice"

#installation based on user access permissions check
USERID=$(id -u)

if [ $USERID -ne 0 ]; then
	echo "please run with root user access"
	exit 1
fi

# function it can accept args and do the task whenever called.
VALIDATE() {
    if [ $1 -ne 0 ]; then
        echo "$2 .. failed...." | tee -a $LOG_FILE
        exit 1
    else
        echo "$2 .. success..." | tee -a $LOG_FILE
    fi
}

# dnf install nginx -y &>> $LOG_FILE
# VALIDATE $? "NGINX installation"

# dnf install mysqld -y &>> $LOG_FILE
# VALIDATE $? "mysqld installation"

# dnf install nodejs -y &>> $LOG_FILE
# VALIDATE $? "nodejs installation"


for package in $@   # script <args>
do
    dnf installed $package
    if [ $? -ne 0 ]; then
        dnf install $package -y
        VALIDATE $? "$package installation"
    else
        echo "$package installated.. skipping" 
    if 
done
