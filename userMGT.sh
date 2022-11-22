#!/bin/bash
<<mm
This script will create and manage users
........in redhat and cetos linux server
Run ONLY as a root user or user with sudo access.
mm
echo "please enter your username"
read newuser
sudo adduser $newuser
echo "please enter your password"
read -s password
echo "$password" | sudo passwd "$newuser" --stdin
echo "Congratulations your username is $newuser"
#Verify if the user account is created
sudo lid $newuser
id $newuser
grep $newuser /etc/passwd
tail -3 /etc/passwd

