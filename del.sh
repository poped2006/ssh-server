#! /bin/sh
read svr < server.txt
read API_TOKEN < api.txt
read CHAT_ID < id.txt
echo "Enter user name:"
read Uname
killall -u $Uname
userdel -r -f $Uname
mme=$(sudo sed "/"$Uname"/d" fuser.txt)
sudo echo "$mme" > fuser.txt
mme=$(sudo sed "/"$Uname"/d" exp.txt)
sudo echo "$mme" > exp.txt

read -r -d '' msg <<EOT
Host: $svr
User: $Uname
has Deleted....
EOT

curl -s -X POST https://api.telegram.org/bot$API_TOKEN/sendMessage -d chat_id=$CHAT_ID -d text="$msg"

echo "success!"
