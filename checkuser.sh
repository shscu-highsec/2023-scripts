#!/bin/bash
# 
# SYNOPSIS
# ./checkuser.sh admin_user_list std_user_list
# ./checkuser.sh
# 	
# DESCRIPTION
# Sets all admin and standard users according to lists separated by comma (,)
# or from files separated by whitespace (newline). Users are created as needed.
# No users are deleted. Any user not listed will be printed to stdout
# (both system users and regular users, excluding "nobody").
# 
# NOTE: Setting users to standard or admin may need extra steps depending on
# the system. This script only adds/removes them from the sudo group. If no
# points are rewarded, check the image brief for any details and edit the script
# or use the GUI as necessary.
# 
# 
# Further Procedure
# Note down any unlisted users. After finishing any forensics that require them,
# remove them with:
#  `sudo userdel -r username`
# 
# Note if any system users are related to prohibited services or suspiciously
# named. After finishing any forensics that require them, remove them and anything
# associated with them. If any admins have suspicious shells,
# run 'less /etc/passwd' to check and research them. If they are not safe run to
# change the shell:
#   `sudo chsh -s /sbin/nologin username`
# 
# EXAMPLE
# sudo ./checkuser.sh min,manny,noonoo fin,yan,poppy
# 

# Get all known users
if [[ $# == 0 ]]; then
	read -a admin_users <<< "$(cat admin.txt)"
	read -a std_users <<< "$(cat std.txt)"
else
	IFS=","
	read -a admin_users <<< "$1"
	read -a std_users <<< "$2"
fi

known_users=("${admin_users[@]}" "${std_users[@]}")

# Read and filter users from /etc/passwd into system/regular users
sys_users=()
reg_users=()
shell_warning=()

while IFS=':' read -r username password uid gid gecos home shell; do

	# Check if unknown (skip if known)
	found=false
	for item in "${known_users[@]}"; do
		if [[ "$item" == "$username" ]]; then
			found=true
			break
		fi
	done
	if $found; then continue; fi

	# Separate into sys and reg
	if [ "$uid" -lt 1000 ]; then
		sys_users+=("$username")
		if ! [[ "$shell" == "/usr/sbin/nologin" ]]; then
			shell_warning+=("$username")
		fi
	else
		reg_users+=("$username")
	fi
done < /etc/passwd

for user in "${known_users[@]}"; do
	if ! id "$user" &>/dev/null; then
		useradd -m "$user" --shell /bin/bash
		echo "User $user was created."
	fi
done

echo -e "\nAdmins:"
for user in "${admin_users[@]}"; do
	usermod -aG sudo "$user"
	echo "$user"
done

echo -e "\nStandard users:"
for user in "${std_users[@]}"; do
	deluser "$user" sudo
	echo "$user"
done

echo -e "\nUnlisted regular users:"
for user in "${reg_users[@]}"; do
	deluser "$user" sudo
	# Ignore echoing "nobody" user
	if [ "$user" == "nobody" ]; then continue; fi
	echo "$user"
done

echo -e "\nSystem users:"
for user in "${sys_users[@]}"; do
	deluser "$user" sudo
	echo "$user"
done

echo -e "\nSystem users with suspicious shell:"
for user in "${shell_warning[@]}"; do
	deluser "$user" sudo
	echo "$user"
done

