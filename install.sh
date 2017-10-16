#!/bin/sh
sudo ln -s "$PWD/duplicacy-backup.service" /etc/systemd/user/
sudo ln -s "$PWD/duplicacy-backup.timer" /etc/systemd/user/
sudo ln -s "$PWD/duplicacy-backup.sh" /usr/local/bin/

sudo ln -s "$PWD/duplicacy-prune.service" /etc/systemd/user/
sudo ln -s "$PWD/duplicacy-prune.timer" /etc/systemd/user/
sudo ln -s "$PWD/duplicacy-prune.sh" /usr/local/bin/

systemctl --user enable duplicacy-backup.timer
systemctl --user start duplicacy-backup.timer

systemctl --user enable duplicacy-prune.timer
systemctl --user start duplicacy-prune.timer
