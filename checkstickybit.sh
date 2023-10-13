#!/bin/bash

sudo chmod u-s /usr/bin/awk
sudo chmod u-s /usr/bin/bash
sudo chmod u-s /usr/bin/bzip2
sudo chmod u-s /usr/bin/cat
sudo chmod u-s /usr/bin/chmod
sudo chmod u-s /usr/bin/choom
sudo chmod u-s /usr/bin/chown
sudo chmod u-s /usr/bin/chroot
sudo chmod u-s /usr/bin/clamscan
sudo chmod u-s /usr/bin/cp
sudo chmod u-s /usr/bin/csh
sudo chmod u-s /usr/bin/curl
sudo chmod u-s /usr/bin/cut
sudo chmod u-s /usr/bin/date
sudo chmod u-s /usr/bin/diff
sudo chmod u-s /usr/bin/dig
sudo chmod u-s /usr/bin/emacs
sudo chmod u-s /usr/bin/env
sudo chmod u-s /usr/bin/find
sudo chmod u-s /usr/bin/grep
sudo chmod u-s /usr/bin/gzip
sudo chmod u-s /usr/bin/head
sudo chmod u-s /usr/bin/hexdump
sudo chmod u-s /usr/bin/hping3
sudo chmod u-s /usr/bin/install
sudo chmod u-s /usr/bin/ip
sudo chmod u-s /usr/bin/ksh
sudo chmod u-s /usr/bin/ksshell
sudo chmod u-s /usr/bin/less
sudo chmod u-s /usr/bin/make
sudo chmod u-s /usr/bin/more
sudo chmod u-s /usr/bin/mv
sudo chmod u-s /usr/bin/nano
sudo chmod u-s /usr/bin/nmap
sudo chmod u-s /usr/bin/perl
sudo chmod u-s /usr/bin/pexec
sudo chmod u-s /usr/bin/php
sudo chmod u-s /usr/bin/python
sudo chmod u-s /usr/bin/rsync
sudo chmod u-s /usr/bin/rvim
sudo chmod u-s /usr/bin/sed
sudo chmod u-s /usr/bin/sort
sudo chmod u-s /usr/bin/strings
sudo chmod u-s /usr/bin/sysctl
sudo chmod u-s /usr/bin/systemctl
sudo chmod u-s /usr/bin/tail
sudo chmod u-s /usr/bin/tee
sudo chmod u-s /usr/bin/unzip
sudo chmod u-s /usr/bin/vi
sudo chmod u-s /usr/bin/vim.tiny
sudo chmod u-s /usr/bin/zsh

echo "Check sticky bit has completed."
echo ""
echo "Running: sudo find / -perm -u=s -type f | grep -v /snap | sort 2>/dev/null"

sudo find / -perm -u=s -type f | grep -vE "/snap|chfn|chsh|fusermount3|gpasswd|newgrp|passwd|pkexec|/umount|/su|/sudo|/mount|pppd" | sort 2>/dev/null
echo ""
echo "Check this list against: https://gtfobins.github.io/#+suid"
