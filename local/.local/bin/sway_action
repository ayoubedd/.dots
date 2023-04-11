#!/bin/bash

if [ "$(pgrep wofi)" ]
then
	exit 1
fi

entries="Lock,Logout,Suspend,Reboot,Shutdown"

selected=$(echo $entries | tr ',' '\n' | wofi -d -p "Action" | awk '{print tolower($1)}')

case $selected in
  lock)
    exec swaylock -f;;
  logout)
    swaymsg exit;;
  suspend)
    exec systemctl suspend;;
  reboot)
    exec systemctl reboot;;
  shutdown)
    exec systemctl poweroff -i;;
esac
