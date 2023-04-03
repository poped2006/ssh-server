#! /bin/sh

read svr < server.txt
read API_TOKEN < api.txt
read CHAT_ID < id.txt
file="test.txt"

while read -r line; do


        cuse=`(loginctl | grep -c -w "$line")`



n=${#line}
if [ $cuse -ge 1 ] && [ $n -gt 3 ];
then
                sudo chage -E $(date -d "+5days" +%F) $line
                mme=$(sudo sed "/"$line"/d" test.txt)
                sudo echo "$mme" > test.txt


read -r -d '' msg <<EOT
Host: $svr
User: $line
has started using....
EOT

curl -s -X POST https://api.telegram.org/bot$API_TOKEN/sendMessage -d chat_id=$CHAT_ID -d text="$msg"

fi


done <$file
