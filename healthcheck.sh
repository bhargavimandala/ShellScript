#Performs a simple HTTP check to your app’s endpoint.
#!/bin/bash
URL="http://localhost:8080/health"
STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$URL")
[ "$STATUS" -ne 200 ] && echo "App health check failed ($STATUS)" | mail -s "App Down" support@example.com
