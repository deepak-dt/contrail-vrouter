#!/bin/bash
if [ $1 = "start" ]; then
    sudo ifconfig $2 up
    sleep 5
    sudo tcpdump ether host $4 -U -i $2 -w $3 &
    sleep 5
elif [ $1 = "stop" ]; then
    sleep 5
    TCPDUMP_PID=`pgrep tcpdump`
    echo $TCPDUMP_PID
    sudo kill -9 $TCPDUMP_PID
fi
