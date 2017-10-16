#!/bin/sh
sudo ln -s "$PWD/duplicacy-backup.service" /etc/systemd/user/
sudo ln -s "$PWD/duplicacy-backup.timer" /etc/systemd/user/
sudo ln -s "$PWD/duplicacy-backup.sh" /usr/local/bin/

systemctl --user enable duplicacy-backup.timer
systemctl --user start duplicacy-backup.timer
