#!/bin/bash

THRESHOLD=80
SERVICE="laravel-backend"

CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')

if (( $(echo "$CPU_USAGE > $THRESHOLD" | bc -l) )); then
  echo "CPU usage ($CPU_USAGE%) exceeded threshold ($THRESHOLD%). Restarting service..."
  sudo systemctl restart $SERVICE
fi
