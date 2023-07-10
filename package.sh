if [ $(dpkg-query -W -f='${Status}' $1 2>/dev/null | grep -c "ok installed") -eq 1 ]; 
	then
		echo "$1 is already installed. "
		echo  "Removing installed $pkg"
		sleep 5
		sudo apt-get purge $1
		echo "$1 removed successfully"
	else
read -p "$1 is not installed. Answer y/n if want installation_ " request
	if  [ $request == "y" ]
	then
		echo -ne  '###### installing $pkg \r'
		sudo apt-get update	
		sudo apt-get install $1
		echo  "nginx installed Successfully"
		sudo systemctl status $1
	fi
fi
