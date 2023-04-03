#! /bin/sh

read svr < server.txt
read API_TOKEN < api.txt
read CHAT_ID < id.txt
file="exp.txt"

echo "Enter User name to charge:"
read Uname

read -r -d '' ffu < fuser.txt
Unum=`(echo "$ffu" | grep -c -w $Uname)`
if [ $Unum -gt 0 ]
then
dt=$(chage -l $Uname | cut -d ':' -f2 | head -n 4 | tail -1)
expires=$(date +%s -d "$dt")
nowd=$(date +%s $now)
scnds=$(($expires - $nowd))
dayr=$((($scnds)/(3600*24)))
echo "Remaining Day for $Uname is $dayr days."
echo "enter days to charge ( or Leave it Blank too pass! ):"
read dys


if [ $dys -gt 0 ];
then
sudo chage -E $(date -d +$dys\days +%F) $Uname

read -r -d '' msg <<EOT
Host: $svr
User: $Uname
charged for $dys days...
EOT

curl -s -X POST https://api.telegram.org/bot$API_TOKEN/sendMessage -d chat_id=$CHAT_ID -d text="$msg"
else
echo "nothing changed"
fi
else
echo "$Uname did not exist in Limited User Section!"
fi

