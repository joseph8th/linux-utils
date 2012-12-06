#!/bin/bash

# shalarm.sh - Shell Alarm Clock
# Joseph Edwards (joseph8th@urcomics.com)
# A 'cheap' alarm clock using system alert bell.

if [ $# != 3 ]; then
    echo $#
    printf "\nUsage: shalarm.sh DD HH MM\n\nSIGTERM to cancel\nAny key to stop alarm\n"
    exit 1
fi

DAY=$1
HOUR=$2
MIN=$3

getday() {
    date '+%d'
}

gethour() {
    date '+%H'
}

getmin() {
    date '+%M'
}

getsec() {
    date '+%S'
}

setalarmoff() {
    while true; do
        printf '\a'
        sleep 3
    done
}

today=$(getday)
now_hour=$(gethour)
now_min=$(getmin)
now_sec=$(getsec)

let "waitsecs = ((((DAY-today)*24 - now_hour) + HOUR)*60 + (MIN-now_min))*60 - now_sec"

if [ "$waitsecs" -lt "0" ]; then
    echo "You cannot set off an alarm in the past!"
    exit 1
fi

echo "Now: $today : $now_hour:$now_min:$now_sec"
printf "Alarm: %02d : %02d:%02d:00 (%d secs from now)\n" "$DAY" "$HOUR" "$MIN" "$waitsecs"

sleep $waitsecs

setalarmoff&

read -n 1 -s

kill $!
