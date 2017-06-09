#!/bin/bash
select="noop"
select=$( pamixer --list-sinks | cut -d\  -f3- | awk '/"/ { print $0 }' | sed 's/"//g' | rofi -dmenu -p 'Sound Sink:' )

echo $(pamixer --list-sinks | grep "$select" | awk '{ print $1 }')

exit 0
