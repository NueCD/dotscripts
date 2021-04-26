#!/bin/sh

# Control for displaying colors on the CPU cooler.

liquidctl set logo color off
PTEMP="0"

while :; do
    TEMP=$(sensors | grep Tctl | awk -F' ' '{print $2}')
    TEMP=$(echo ${TEMP:1:2})

    [[ "$TEMP" -lt "50" ]] && TEMP=1
    [[ "$TEMP" -gt "50" && "$TEMP" -lt "60" ]] && TEMP=2
    [[ "$TEMP" -gt "60" && "$TEMP" -lt "70" ]] && TEMP=3
    [[ "$TEMP" -gt "70" && "$TEMP" -lt "80" ]] && TEMP=4
    [[ "$TEMP" -gt "80" ]] && TEMP=5

    if [[ "$PTEMP" != "$TEMP" ]]; then
        PTEMP=$TEMP
        [[ "$TEMP" == "1" ]] && liquidctl set ring color breathing ff00ff
        [[ "$TEMP" == "2" ]] && liquidctl set ring color fixed 00ff00
        [[ "$TEMP" == "3" ]] && liquidctl set ring color fixed ffff00
        [[ "$TEMP" == "4" ]] && liquidctl set ring color fixed ff3300
        [[ "$TEMP" == "5" ]] && liquidctl set ring color fixed ff0000
    fi

    sleep 5
done
