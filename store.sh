
echo "Welcome To Sensitive Data Storage Department"
x=0
pass="pass:iamPass"
get_data(){
	echo "Enter Your Sensitive Data"
	read -s data
	echo "" > /home/JKJ-ryuk/bin/pass.txt
	echo "previous Data Is Erased"

#	data=`openssl aes-256-cbc -a -salt -in $data`
	echo -n $data | openssl enc -base64 -pass $pass -e -aes-256-cbc -a -salt -pbkdf2 >> /home/JKJ-ryuk/bin/pass.txt
# 	echo "$data" >> /home/JKJ-ryuk/bin/pass.txt
	echo "data is SAVED"
}
read_data(){
	echo "Data Sotred IS: "
	data=`cat /home/JKJ-ryuk/bin/pass.txt`
	#echo $pass
	echo `openssl enc -base64 -pass $pass -d -aes-256-cbc -a -salt -pbkdf2 -in /home/JKJ-ryuk/bin/pass.txt`
}

set_new_pass(){
	echo "Enter New Password"
	read -s newpass
	pass="pass:${newpass}"
	echo "key change detected:data must be changed"
	get_data
}

while [ $x -eq 0 ]
do
	echo "1)Enter New Sensitive Data"
	echo "2)Read previously stored sensitive data"
	echo "3)Set New Password"
	echo "4)Exit me!!"
	read res
	case $res in
		1)
			echo "new data Call"
			get_data
			;;
		2)
			echo "readd prv call"
			read_data
			;;
		3)
			echo "New Pass"
			set_new_pass
			;;
		4)
			echo "Sad To See you GO.."
			x=1
			;;
		*)
			echo "Enter Correct charecter boi"
			;;
	esac
done
#echo "outside While" 
