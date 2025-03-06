#!/bin/bash

#Simple bash script to mount and unmount different drives

udisksctl status

read -p "Would you like to mount or unmount a drive? " mount

if [ -z "$mount" ]; then
	echo "Must either mount or unmount drive"
elif [ "$mount" == mount ]; then
	read -p "Which drive would you like to mount? " drive
	if [ -z "$drive" ]; then
		echo "Drive name cannot be empty."
	elif [ "$drive" == sda ]; then
		udisksctl mount -b /dev/sda1
	elif [ "$drive" == nvme0n1p3 ]; then
		udisksctl mount -b /dev/nvme0n1p3
	fi
elif [ "$mount" == unmount ]; then
	read -p "Which drive would you like to unmount? " unmount
	if [ -z "$unmount" ]; then
		echo "Drive name cannot be empty"
	elif [ "$unmount" == sda ]; then
		udisksctl unmount -b /dev/sda1
	elif [ "$unmount" == nvme0n1p3 ]; then
		udisksctl unmount -b /dev/nvme0n1p3
	fi
fi
