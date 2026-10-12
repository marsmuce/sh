#!/bin/bash

# while-menu-dialog: a menu driven system information program

DIALOG_CANCEL=1
DIALOG_ESC=255
HEIGHT=0
WIDTH=0

display_result() {
  dialog --title "$1" \
    --no-collapse \
    --msgbox "$result" 0 0
}

while true; do
  exec 3>&1
  selection=$(dialog \
    --backtitle "Ctrl Alt Delete" \
    --title "Power Options" \
    --clear \
    --cancel-label "Cancel" \
    --menu "Logged in as $USER" $HEIGHT $WIDTH 4 \
    "1" "Logout" \
    "2" "Reboot" \
    "3" "Shutdown" \
    2>&1 1>&3)
  exit_status=$?
  exec 3>&-
  case $exit_status in
    $DIALOG_CANCEL)
      clear
      echo "Program terminated."
      exit
      ;;
    $DIALOG_ESC)
      clear
      echo "Program aborted." >&2
      exit 1
      ;;
  esac
  case $selection in
    1 )
        loginctl terminate-user $USER ;;
    2 )
        systemctl reboot ;;
    3 )
        systemctl poweroff ;;
  esac
done
