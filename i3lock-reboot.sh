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

TIME=10m

if [ -z "$2" ]; then
	echo "Default sleeping time is " $TIME
else
	TIME=$2
	echo "Sleeping time set to " $TIME
fi

while [ 1 -eq 1 ]; do
	sh $COMMAND &
	PID=$!
	sleep $TIME
	if kill -0 $PID ;then
		echo "Reboot !"
		kill -9 $PID
	else
		echo "Unlock !"
		exit 0
	fi
done

