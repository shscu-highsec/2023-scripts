#!/bin/bash

sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1
sudo sysctl -w net.ipv6.conf.default.disable_ipv6=1
sudo sysctl -w net.ipv6.conf.lo.disable_ipv6=1
sudo sysctl -w net.ipv4.tcp_syncookies=1  
sudo sysctl -w net.ipv4.ip_forward=0  
sudo sysctl -w net.ipv4.conf.all.send_redirects=0
sudo sysctl -w net.ipv4.conf.default.send_redirects=0
sudo sysctl -w net.ipv4.conf.all.accept_redirects=0
sudo sysctl -w net.ipv4.conf.default.accept_redirects=0
sudo sysctl -w net.ipv4.conf.all.secure_redirects=0
sudo sysctl -w net.ipv4.conf.default.secure_redirects=0
echo ""
echo ""
echo "sysctl secured completed. Make sure you now sudo gedit /etc/sysctl.conf to make the following edits:"
echo ""
cat <<EOF
net.ipv4.conf.default.rp.filter=1
net.ipv4.conf.all.rp_filter=1
net.ipv4.tcp_syncookies=1  
net.ipv4.ip_forward=0  
net.ipv4.conf.all.accept_redirects = 0
net.ipv6.conf.all.accept_redirects = 0
net.ipv4.conf.all.secure_redirects=0
net.ipv4.conf.all.send_redirects=0

net.ipv4.conf.default.secure_redirects=0
net.ipv4.conf.default.send_redirects=0
net.ipv4.conf.default.accept_redirects=0
net.ipv6.conf.all.disable_ipv6=1
net.ipv6.conf.default.disable_ipv6=1
net.ipv6.conf.lo.disable_ipv6=1
net.ipv4.icmp_echo_ignore_broadcasts = 1
net.ipv4.icmp_ignore_bogus_error_responses = 1
net.ipv4.tcp_synack_retries = 3
EOF

