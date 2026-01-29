#!bin/bash

set -euxo pipefail

# -e (errexit): Tells the shell to exit immediately if any command returns a non-zero (failure) status. This prevents a script from continuing after a silent failure.

# -u (nounset): Treats unset variables as an error when performing parameter expansion. If you try to use a variable that hasn't been defined, the script will exit with an error message instead of treating it as an empty string.

# -x (xtrace): Enables execution tracing (debugging mode). It prints each command and its expanded arguments to standard error before executing them, which is invaluable for troubleshooting.

# -o pipefail
# To make the script even more robust, it is often paired with -o pipefail. By default, a pipeline (e.g., cmd1 | cmd2) only returns the exit status of the last command. With pipefail, the whole pipeline fails if any command within it fails.


trap 'commands_to_run' SIGNAL_NAMES

# The trap command is a shell built-in used in Linux scripts to catch and respond to signals sent to the process. It is primarily used for resource cleanup (e.g., deleting temporary files) and ensuring a script exits gracefully even if interrupted. 



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


