#!/bin/bash
echo "enter username"
read -p "username : " username
grep $username /etc/passwd | cut -d: -f1 > statue.txt
sleep 2
var1=$(cat statue.txt)
sleep 2
if [[ "$username" == "$var1" ]]
then
	echo "This user $username exist"
	echo "What would you like to do today?"
	echo  "*******************************"
	echo "1. Modify"
	echo "2. Delete"
	echo "3. Exit"
	echo "*********************************"
	echo "Enter 1, 2, or 3 based on what you want to do"
	read -p "action: " action
	if [[ "$action" == 3 ]]
	then
		exit 0
	elif [[ "$action" == 2 ]]
	then
		sudo userdel -r $username
		echo "user successfully deleted"
	elif [[ "$action" == 1 ]]
	then
		echo "Below are the following actions you can perform"
		echo "***********************************************"
		echo "1. Add user to a group"
		echo "2. Remove user from a group"
		echo "3. Change Password"
		echo "4. Exit"
		echo "*************************************************"
		echo "Enter 1, 2, 3,or 4 based on the action you want to perform"
		read -p "user_input: " user_input
		case $user_input in
			1)
				echo "Enter the group name"
				read -p "Group name: " group_name
				sudo usermod -aG "$group_name" "$username"
				echo "User $username added to $group_name successfully"
				;;
			2)
				echo "Enter the group name"
				read -p "Group name: " group_name
				sudo deluser "$username" "$group_name"
				if [ $? -eq 0 ]; then
					echo "User $username deleted from $group_name successfully"
				else
					echo "This group $group_name does not exist"
					echo "Terminating process ...."
				fi
				;;
			3)
				echo "Kindly enter your username again"
				read -p "UserName : " username2
				if [[ "$username2" == "$username" ]]
				then
					sudo passwd $username
				else
					echo "username did not match"
					echo "Terminating process......."
					exit
				fi
				;;
			4)
				echo "Exiting ....."
				exit 
				;;
		esac
		exit 
	else
		echo "You have typed a wrong action"
		echo "exiting ..."
		exit
	fi
else
	echo "User does not exist"
	echo "Do you want to add this user? yes/no "
	read -p "response: " response
	if [[ "$response" == "yes" ]]
	then
		sudo useradd $username
		echo "User $username successfully added!!!!!"
	elif [[ "$response" == "no" ]]
	then
		echo "exiting ..."
		exit
	else
		echo "You have typed a wrong action"
		echo "terminating process..."
		exit
	fi
fi
