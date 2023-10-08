#!/bin/bash
#
# SYNOPSIS
# ./setallpasswd.sh
# 
# DESCRIPTION
# Sets all passwords to "tHis1s@pAsSWord!23", excluding "nobody". 
# 
# NOTE: Includes the current user.
# 
# EXAMPLE
# sudo ./setallpasswd.sh
# 
#

while IFS=':' read -r username password uid gid gecos home shell; do
	# Skip nobody
	if [ "$username" == "nobody" ]; then
		continue
    	fi

	# Only regular users
	if [ "$uid" -ge 1000 ]; then
		echo "${username}'s password was updated."
		echo "$username:tHis1s@pAsSWord!23" | chpasswd
		chage --mindays 10 --maxdays 90 --warndays 7 \
		--expiredate $(date -d +90days +%Y-%m-%d) ${username}
	fi
done < /etc/passwd
