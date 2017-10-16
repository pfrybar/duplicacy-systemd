#!/bin/sh

# prune the old backups, keeping:
#    -keep 1:7     => Keep 1 snapshot per day for snapshots older than 7 days
#    -keep 7:30    => Keep 1 snapshot every 7 days for snapshots older than 30 days
#    -keep 30:180  => Keep 1 snapshot every 30 days for snapshots older than 180 days
#    -keep 0:360   => Keep no snapshots older than 360 days

# todo: change these to be customizable,
#       can probably add to systemd env
BACKUP_LOC=$HOME
DUP_BIN=$HOME/go/bin/duplicacy

# rudimentary check if computer has internet
if ! ping -q -c 1 -W 2 google.com 1>/dev/null 2>&1; then
    echo "No internet, skipping backup"
    exit 0
fi

cd $BACKUP_LOC
$DUP_BIN prune -keep 0:360 -keep 30:180 -keep 7:30 -keep 1:7

if [[ $? -eq 0 ]]; then
    notify-send --icon=document-save 'Duplicacy Prune' 'Prune completed successfully!'
else
    notify-send --icon=dialog-error 'Duplicacy Prune' 'Error occured during prune.'
fi
