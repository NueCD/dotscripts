#!/bin/sh

D="$(date "+%H:%M:%S")"
[[ "$D" < "24:00:00" ]] && S="Free time"
[[ "$D" < "22:00:00" ]] && S="Training"
[[ "$D" < "21:00:00" ]] && S="Projects/Study"
[[ "$D" < "19:00:00" ]] && S="Dinner/Rest"
[[ "$D" < "17:00:00" ]] && S="Work"
[[ "$D" < "13:00:00" ]] && S="Lunch"
[[ "$D" < "12:00:00" ]] && S="Work"
[[ "$D" < "08:00:00" ]] && S="Free time"

printf "$S $(date "+%d/%m-%Y %H:%M:%S")"
