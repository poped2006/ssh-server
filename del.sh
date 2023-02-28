#! /bin/sh
read svr < server.txt
echo "Enter user name:"
read Uname
killall -u $Uname
userdel -r -f $Uname
mme=$(sudo sed "/"$Uname"/d" fuser.txt)
sudo echo "$mme" > fuser.txt
mme=$(sudo sed "/"$Uname"/d" exp.txt)
sudo echo "$mme" > exp.txt

API_TOKEN=6169617911:AAEUQNiIIK0NGeO4PUw3BqM34EVSg0fE1o0
CHAT_ID=5943862510
read -r -d '' msg <<EOT
Host: $svr
User: $Uname
has Deleted....
EOT

curl -s -X POST https://api.telegram.org/bot$API_TOKEN/sendMessage -d chat_id=$CHAT_ID -d text="$msg"

echo "success!"
