#!/bin/sh
systemctl --user stop duplicacy-backup.timer
systemctl --user disable duplicacy-backup.timer

systemctl --user stop duplicacy-prune.timer
systemctl --user disable duplicacy-prune.timer

sudo rm /etc/systemd/user/duplicacy-backup.service
sudo rm /etc/systemd/user/duplicacy-backup.timer
sudo rm /usr/local/bin/duplicacy-backup.sh

sudo rm /etc/systemd/user/duplicacy-prune.service
sudo rm /etc/systemd/user/duplicacy-prune.timer
sudo rm /usr/local/bin/duplicacy-prune.sh
