#Scans logs for known error patterns and sends alerts.
#!/bin/bash
LOG="/var/log/myapp/app.log"
PATTERNS=("ERROR" "Exception" "Traceback")
EMAIL="support@example.com"
for word in "${PATTERNS[@]}"; do
  if grep -q "$word" "$LOG"; then
    echo "[$(date)] $word found in logs!" | mail -s "Log Error Found: $word" "$EMAIL"
  fi
done

