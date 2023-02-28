#! /bin/sh
read svr < server.txt
read pnum < port.txt
echo "Enter Number Of Account"
read Intnum
echo "Enter Name Of Introducer"
read strname

read -r -d '' ffu < fuser.txt

file=$(wc -l fuser.txt | awk 'NR==1 {print $1}')

for ((i=file+1 ; i<=(file + Intnum) ; i++))
do

Unum=`(echo "$ffu" | grep -c -w "$strname$i")`
if [ $Unum == 0 ]
then

echo "$strname$i" >> fuser.txt
echo "$strname$i" >> test.txt
pts=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 7)
sudo useradd -p $(perl -e 'print crypt($ARGV[0], "password")' $pts) -g users "$strname$i"
usermod -s /bin/false "$strname$i"
echo "$strname$i"
echo $pts

API_TOKEN=6169617911:AAEUQNiIIK0NGeO4PUw3BqM34EVSg0fE1o0
CHAT_ID=5943862510
read -r -d '' msg <<EOT
Limited User
Host: $svr
Port: $pnum
User: $strname$i
Pass: $pts
EOT

curl -s -X POST https://api.telegram.org/bot$API_TOKEN/sendMessage -d chat_id=$CHAT_ID -d text="$msg"
else
Intnum=$((Intnum + 1))
echo "$strname$i skipped"
fi
done
