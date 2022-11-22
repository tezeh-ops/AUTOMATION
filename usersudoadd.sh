#!/bin/bash
#This script is to grant full sudo right to user in linux server
#This script will work for RedHat and Centos servers.


echo "please enter the name of the user you are granting sudo right"
read name
#verify if the user exist in the server
id $name
if [ $? -eq 0 ]
then
echo "Granting sudo rigth to the user $name"
sudo echo "$name ALL=(ALL)  NOPASSWD: ALL" | sudo tee /etc/sudoers.d/$name
#verify that the user was added to the sudoers file
sudo grep $name /etc/sudoers
echo "$name now has a sudo right.Thank you."
else
        echo "The user you entered does not exist in the linux server"
        echo "Would you like to create this user with the name $name?"
        echo "Enter 'yes' to continue or 'no' to terminate"
        read answer
        yes=create
        no=donotcreate
if [ $answer = yes ]
then
        echo "Creating user with the name $name"
        sudo adduser $name
        echo "Assigning password for the user $name"
        read -s password
        echo "$password" | sudo passwd "$name" --stdin #(standard in)
       #verify that the user has been added and assigned password.
id $name
grep $name /etc/passwd
sudo grep $name /etc/shadow
echo "$name is now created and password updated base on the input."
echo "Do you still want to continue with granting sudo previlages to the user $name?"
echo " Enter 'yes' to continue or 'no' to terminate"
read option
if [ $option = yes ]
then
        echo "Granting full sudoers right to $name"
        sudo echo "$name ALL=(ALL)  NOPASSWD: ALL" | sudo tee /etc/sudoers.d/$name
        sudo grep $name /etc/sudoers
echo "$name now has a sudo right.Thank you."
else
        echo "Thank you"
fi
else
        echo "Thank you"
fi
fi


