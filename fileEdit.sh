#!/bin/bash

#checking for sudo
if [ $UID != 0 ]; then
    echo " use sudo and try again... "
    exit
else
	#appending array to file
    array="(allow-guest=false greeter-show-remote-login=false)"
    for item in ${array[*]}
    do
    	printf "%s\n" "$item" >> /usr/share/lightdm/lightdm.conf.d/50-unity-greeter.conf
    done
	#appending array to file #2
	array2="(allow-guest=false greeter-show-remote-login=false)"
    for item2 in ${array2[*]}
    do
    	printf "%s\n" "$item2" >> /usr/share/lightdm/lightdm.conf.d/50-unity-greeter.conf
    done
	#find & replace in file
	sed -i -e 's/anonymos_enable=YES/anonymos_enable=NO/g' /etc/vsftpd.conf
	sed -i -e 's/chroot_local_user=YES/chroot_local_user=NO/g' /etc/vsftpd.conf
	sed -i -e 's/xferlog_enable=NO/xferlog_enable=YES/g' /etc/vsftpd.conf
fi
	#find & replace in files ONLY WORKS WITH mysql-server installed
	#replace "ThingToFind" "WhatToReplaceItWith" -- file1.txt file2.txt file3.txt
