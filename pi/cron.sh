#!/bin/bash
# Crontab:
# * 9-18 * * 1-5 sh /home/pi/cron.sh

GONG_TOKEN="<SET A TOKEN>"
SERVER="<YOUR GONG SERVER>"

for i in `seq 1 60`; do
  if curl -f -XPOST "$SERVER/queue/$GONG/pop" 2>/dev/null; then
    flock -w 10 /tmp/gong sh /home/pi/gong.sh
  else
    sleep 1
  fi
done
