#!/bin/bash

entries="
Lock,
Logout,
Suspend,
Reboot,
Shutdown"

selected=$(echo $entries | rofi -m 0 -dmenu -sep ',' -p "power" -i | awk '{print tolower($1)}')

case $selected in
  lock)
    exec ~/.local/bin/scripts/lock.sh;;
  logout)
    swaymsg exit;;
  suspend)
    exec systemctl suspend;;
  reboot)
    exec systemctl reboot;;
  shutdown)
    exec systemctl poweroff -i;;
esac
