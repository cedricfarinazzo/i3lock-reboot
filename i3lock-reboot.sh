#!/bin/sh

echo " "
echo "      i3lock reboot"
echo " "
echo " "

if [ -z "$1" ]; then
        echo "Command is not set"
        exit 1 
else
        COMMAND=$1
        echo "To run : " $COMMAND
fi

TIME=2520

if [ -z "$2" ]; then
	echo "Default sleeping time is " $TIME
else
	$TIME=$2
	echo "Sleeping time set to " $TIME
fi

while [ 1 -eq 1 ]; do
	$($COMMAND) &
	sleep $TIME
	if [ pgrep -x $COMMAND > /dev/null ]; then
		echo "Reboot !"
		ps -ef | grep $COMMAND | grep -v grep | awk '{print $2}' | xargs -r kill -9
	else
		echo "Unlock !"
		exit 0
	fi
done

