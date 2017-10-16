#!/bin/sh
systemctl --user stop duplicacy-backup.timer
systemctl --user disable duplicacy-backup.timer

sudo rm /etc/systemd/user/duplicacy-backup.service
sudo rm /etc/systemd/user/duplicacy-backup.timer
sudo rm /usr/local/bin/duplicacy-backup.sh
