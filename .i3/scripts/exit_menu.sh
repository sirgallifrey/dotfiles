#!/bin/bash
$select="noop"
select=$(echo -e 'Cancel\nPoweroff\nReboot\nHalt\nLogoff\nReboot Windows' | rofi -dmenu -p 'Exit menu' )
[ "$select" = "Cancel" ] && exit 0
[ "$select" = "Poweroff" ] && poweroff
[ "$select" = "Reboot" ] && reboot
[ "$select" = "halt" ] && halt
[ "$select" = "Logoff" ] && i3-msg exit

exit 0
