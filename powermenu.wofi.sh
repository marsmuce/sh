#!/bin/bash
# Entries
entries="Logout\nReboot\nShutdown"

# Launch Wofi
selected=$(echo -e "$entries" | wofi -E -j --dmenu -- cache-file /dev/null | awk '{print tolower($1)}')

case $selected in
  logout)
    loginctl terminate-user $USER ;;
  reboot)
    systemctl reboot ;;
  shutdown)
    systemctl poweroff ;;
esac
