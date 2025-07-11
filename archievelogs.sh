#Archives and deletes old logs.
#!/bin/bash
LOG_DIR="/var/log/myapp"
find $LOG_DIR -name "*.log" -mtime +7 -exec gzip {} \;
find $LOG_DIR -name "*.gz" -mtime +30 -exec rm {} \;

#!/bin/bash
Shebang line.

Tells the system to use the Bash shell to interpret the script.

It's required for the script to run correctly when executed as a file (e.g., ./script.sh).

LOG_DIR="/var/log/myapp"
This defines a variable named LOG_DIR and sets it to /var/log/myapp.

This is the directory path where your application’s log files are stored.

Makes the script more flexible and readable.

find $LOG_DIR -name "*.log" -mtime +7 -exec gzip {} \;
🔍 What it does:
Finds all files in $LOG_DIR (i.e., /var/log/myapp) with names ending in .log.

That are older than 7 days.

Then compresses them using the gzip command.

🔧 Breakdown:
find: Linux command to search files and directories.

$LOG_DIR: Expanded to /var/log/myapp.

-name "*.log": Matches files with the .log extension.

-mtime +7: Files that were last modified more than 7 days ago.

-exec gzip {} \;: For each file found, run the gzip command on it.

{} is a placeholder for the current file.

\; marks the end of the -exec clause.

✅ Result: Older .log files are compressed into .log.gz.

find $LOG_DIR -name "*.gz" -mtime +30 -exec rm {} \;
🔍 What it does:
Finds all compressed log files (.gz) in $LOG_DIR.

That are older than 30 days.

Then deletes them using rm.

🔧 Breakdown:
-name "*.gz": Matches compressed files (created by gzip).

-mtime +30: Files modified more than 30 days ago.

-exec rm {} \;: Deletes those old compressed files.

✅ Result: Keeps disk clean by removing logs older than 30 days.

🧠 Why This Script Is Useful
Saves Disk Space:

Old logs are compressed, which can reduce size by 80–90%.

Logs older than 30 days are deleted — keeping only recent, relevant data.

Low Maintenance:

Can be scheduled via cron to run daily or weekly without human intervention.

