#!/usr/bin/env bash


url=http://10.61.1.44:8000/airtime_128

pscount=`pgrep omxplayer | wc -l`

if [ "$pscount" -gt 2 ]
then
echo "`date` Too many processes ... Killing "
killall -9 omxplayer
killall -9 omxplayer.bin
fi

if [ "$pscount" -eq 2 ]
then
echo "`date` Everything looks good ..."
else
cd /tmp
rm -Rf omx*
nohup omxplayer -g -o local $url &

#fail=`systemctl status bluetooth |grep "not connected" | wc -l`
#if [ "$fail" -gt 0 ]
#then
# systemctl restart bluetooth
# bluetoothctl connect 08:12:62:BA:A7:39
# nohup omxplayer -g -o alsa:bluealsa $url &
#else
# nohup omxplayer -g -o alsa:bluealsa $url &
#fi
fi
