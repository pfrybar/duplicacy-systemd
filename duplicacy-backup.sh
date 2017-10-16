#!/bin/sh

# todo: change these to be customizable
BACKUP_LOC=$HOME
DUP_BIN=$HOME/go/bin/duplicacy

# rudimentary check if computer has internet
if ! ping -q -c 1 -W 2 google.com 1>/dev/null 2>&1; then
    echo "No internet, skipping backup"
    exit 0
fi

cd $BACKUP_LOC
$DUP_BIN backup

if [[ $? -eq 0 ]]; then
    notify-send --icon=document-save 'Duplicacy Backup' 'Backup completed successfully!'
else
    notify-send --icon=dialog-error 'Duplicacy Backup' 'Error occured during backup.'
fi
