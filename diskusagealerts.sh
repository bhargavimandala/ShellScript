#Checks disk usage and alerts if above threshold.
#!/bin/bash
THRESHOLD=90
EMAIL="support@example.com"
df -H | grep -vE '^Filesystem|tmpfs|cdrom' | while read -r line; do
  USAGE=$(echo $line | awk '{ print $5 }' | sed 's/%//')
  MOUNT=$(echo $line | awk '{ print $6 }')
  if [ "$USAGE" -gt "$THRESHOLD" ]; then
    echo "$MOUNT at ${USAGE}% usage" | mail -s "Disk Alert" "$EMAIL"
  fi
done

