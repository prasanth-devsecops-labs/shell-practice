🐧 Shell & Linux Practice for DevSecOps

A comprehensive guide for system administration, user management, and shell scripting basics.
1. 🚀 DevOps 

SDLC Evolution: Waterfall ➔ Agile ➔ DevOps.
The DevOps Core:
Collaboration over Silos.
Faster feedback loops & robust testing.
Early defect detection (Shift Left).
Improved reliability through CI/CD.

2. 📁 File System & Navigation

Command	Action	Pro-Tip
pwd	Print Working Directory	Know your Absolute vs Relative paths.
ls -ltr	List files by time (reverse)	Great for seeing the most recent logs at the bottom.
cat >> file	Append content	Use cat > file to overwrite, cat >> to append.
cp -r	Copy directory	Always use -r for recursive copying of folders.
curl -L	View URL content	Use -L to follow redirects if the URL moved.
wget <URL>	Download file	Use -O filename to rename the download on the fly.

3. 🔍 Text Processing (The "Big Three")

Grep (Search)
grep -i "word" : Case insensitive.
grep -v "word" : Invert match (show lines without word).
grep -r "word" . : Search recursively in all files in current dir.
grep -o "word" | wc -l : Count exact occurrences of a word.
^word / word$ : Start/End of line anchors.
Cut & Awk (Extract)
cut -d ":" -f1 : Get the first column using : as a delimiter.
awk -F ":" '{print $2}' : More powerful; prints the 2nd column.
Tail & Head (Logs)
tail -f <file> : Crucial for real-time log monitoring.
tail -F <file> : Follows the file even if it is deleted/recreated (Log rotation).

4. 📝 VIM Mastery

Navigation (Normal Mode)
gg : Top of file | G : Bottom of file.
u : Undo | Ctrl + r : Redo.
dd : Delete line | yy : Copy line | p : Paste.
Command Mode (Colon)
:%d : Delete all content.
:/pattern : Forward search | :?pattern : Backward search.
:%s/old/new/g : Global search and replace.
:set nu : Show line numbers.

5. 👤 Identity & Access Management (IAM)

User & Group Basics
useradd / userdel -r : Create or delete (with home dir) users.
usermod -aG group user : Add user to a group without removing existing ones.
chown -R user:group <path> : Change ownership recursively.
Onboarding a New Employee (The DevSecOps Way)
Keys: User sends id_rsa.pub (Public Key) to Admin.
Home Setup: Admin creates user; Linux creates /home/user.
SSH Directory: Create .ssh/ folder (Perms: 700).
Authorized Keys: Create .ssh/authorized_keys (Perms: 600).
Sudo Access: Create file in /etc/sudoers.d/devsecops:
Content: %devsecops ALL=(ALL) NOPASSWD: ALL
Ownership: chown -R user:user /home/user/.ssh

6. 📦 System Administration

Package & Service Management
RHEL/CentOS: dnf install / dnf list installed.
Ubuntu/Debian: apt update && apt install.
Services: systemctl enable --now <service> (Enables and Starts in one command).

Networking & Processes
netstat -lntp / ss -tulnp : View listening ports and which PID owns them.
ps -ef | grep <proc> : Find a running process.
kill -9 <PID> : Force kill a stuck process.
top : Real-time system resource monitor.
Archiving (The Right Way)
Compress: tar -zcvf archive.tar.gz /path/to/files
Extract: tar -zxvf archive.tar.gz
Note: If archiving from a variable list, use xargs to avoid "Argument list too long" errors.

⏰ Cron Job Best Practices
Always use absolute paths: /usr/local/bin/script.sh.
Universal Redirection: * * * * * /path/script.sh >> /path/log.txt 2>&1.
Root Crontab: Use sudo crontab -e to run tasks that require sudo privileges.