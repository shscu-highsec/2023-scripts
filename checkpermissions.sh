#!/bin/bash

sudo chmod -R 750 /home
sudo chmod 755 /home
sudo chmod 600 /etc/securetty
sudo chmod 400 /etc/inetd.d
sudo chmod 400 /etc/gshadow
sudo chmod 440 /etc/inetd.conf
sudo chmod 440 /etc/sudoers
sudo chmod 750 /etc/sudoers.d
sudo chmod 440 /etc/xinted.conf
sudo chmod 600 /etc/anacrontab
sudo chmod 700 /etc/cron.d
sudo chmod 700 /etc/cron.daily
sudo chmod 700 /etc/cron.hourly
sudo chmod 700 /etc/cron.monthly
sudo chmod 700 /etc/cron.weekly
sudo chmod 600 /etc/crontab
sudo chmod 640 /etc/shadow
sudo chmod 640 /etc/ftpusers
sudo chmod 640 /etc/cups/cupsd.conf
sudo chmod 644 /etc/crontab
sudo chmod 644 /etc/group
sudo chmod 644 /etc/hosts.allow
sudo chmod 644 /etc/hosts.deny
sudo chmod 644 /etc/passwd
sudo chown root:root /etc/anacrontab
sudo chown root:root /etc/cron.d
sudo chown root:root /etc/cron.daily
sudo chown root:root /etc/cron.hourly
sudo chown root:root /etc/cron.monthly
sudo chown root:root /etc/cron.weekly
sudo chown root:root /etc/crontab
sudo chown root:root /etc/group
sudo chown root:root /etc/passwd
sudo chown root:root /etc/securetty
sudo chown root:shadow /etc/shadow
sudo chown root:root /boot/grub/grub.cfg
sudo chmod 600 /boot/grub/grub.cfg

echo "Check permissions has completed."

