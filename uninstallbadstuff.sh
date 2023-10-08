#!/bin/bash
#
# IMPORTANT:  
#   Before uninstalling make sure the README doesn’t specify you need
#   the application (e.g. FTP). Also make sure that there are no forensics
#   questions that may rely on it. Check carefully for anything listed as
#   a critical service.
#

badstuff="aircrack-ng apache2 apache2-bin bind9 deluge deluge-common dovecot ettercap fakeroot hping3 hydra john kismet metasploit nessus netcat netcat-traditional netcat-openbsd nginx nikto nmap ophcrack owasp ptunnel postfix postgresql pure-ftpd rhythmbox ripper samba sendmail snort talkd tcpdump tftpd thc tightvncserver vsftpd wireshark wireshark-qt x11vnc xinetd zenmap"

# Prompt the user for confirmation
echo "REVIEW THIS LIST. This script will uninstall the following packages:"
echo $badstuff
echo ""
read -p "Press Y to continue or N to exit? (Y/N): " choice

# Check if the choice is NOT 'y' or 'Y'
if [[ ! "$choice" =~ ^[Yy]$ ]]; then
  exit 1
fi

echo ""
sudo dpkg --purge $badstuff

#sudo dpkg --purge aircrack-ng apache2 apache2-bin bind9 deluge deluge-common dovecot ettercap fakeroot hping3 hydra john kismet metasploit nessus netcat netcat-traditional netcat-openbsd nginx nikto nmap ophcrack owasp ptunnel postfix postgresql pure-ftpd rhythmbox ripper samba sendmail snort talkd tcpdump tftpd thc tightvncserver vsftpd wireshark wireshark-qt x11vnc xinetd zenmap

echo ""
echo "Ignore any messages that says 'ignoring request to remove <package> which isn’t installed'"
echo "If you see any packages that couldn’t be removed then use sudo apt-get remove instead. Then re-run this script again until there are no more errors."
