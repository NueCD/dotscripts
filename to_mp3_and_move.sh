#!/bin/sh

[ "$1" == "" ] && echo "Enter source directory." && exit
[ "$2" == "" ] && echo "Enter target directory." && exit

SRC="$1"
TARG="$2"

cd $SRC

while :; do
   for F in *; do
        if [[ "$F" == *".mp3" ]]; then cp "$F" "$TARG/$F"
        else
            [ -f "$F" ] && ffmpeg -i "$F" "$TARG/${F/%$(echo "$F" | awk -F'.' '{print $(NF)}')/mp3}"
        fi
        [ -f "$F" ] && rm "$F"
    done
    sleep 1
done
