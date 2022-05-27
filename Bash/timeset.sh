#!/usr/bin/env bash
lasttime=`cat /home/pi/scripts/timelast`
currtime=`date +'%s'`
if [[ "$lasttime" -gt "currtime" ]]
then sudo date -s "@$lasttime"
fi
date '+%s' > /home/pi/scripts/timelast
# timeset дотор дээрх хоёр мөр кодыг бичээд хадгалж гарна.
