#!/bin/bash

if [ $EUID != 0 ]; then
    echo "You are too stupid to run this script"
    exit 1
else
	
	#installing
	apt install auditd fail2ban apparmor libpam-cracklib sl
	
	#removing
	apt purge telnet hydra john dsniff medusa wireshark cain sendmail rainbow openldap-servers* openswan xorg-x11-server-common ruby
	
	
	#option uninstallation
	numOfPackage=0
	pkgArray=(ftp mysql-server samba sl	)
	packages=${pkgArray[$numOfPackage]}
	for packages in ${pkgArray[*]}
	do
		packages=${pkgArray[numOfPackage]}
		read -r -n1 -p "Do you want to uninstall $packages Y/N" Reply
		if [ "$Reply" == 'Y' ] || [ "$Reply" == "y" ]; then
			apt purge "$packages"
		elif [ "$Reply" == 'N' ] || [ "$Reply" == "n" ]; then
			echo "$packages : fine then I guess I'll remain on this computer and ANNOY YOU 4EVER!!!"
		else
			echo "YOU HAD ONE JOB JUST Y OR N AND YOU FAILED!!!!!!!"
			echo "GO RERUN THE ENTIRE SCRIPT TO KILL $packages ... "
			echo "AND REMEMBER ACTIONS HAVE CONSEQUENCES"
		fi
		((numOfPackage++))
	done
	
	#lynis
	apt-get install lynis
	lynis -c -Q
fi
