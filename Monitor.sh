#Monitors key services and alerts if any are down.

#!/bin/bash
SERVICES=("nginx" "mysql" "docker")
EMAIL="support@example.com"
for SVC in "${SERVICES[@]}"; do
  if ! systemctl is-active --quiet "$SVC"; then
    echo "$(date): $SVC is down" | mail -s "Service Alert: $SVC down" "$EMAIL"
  fi
done
