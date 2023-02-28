#! /bin/sh

read svr < server.txt
file="test.txt"

while read -r line; do


        cuse=`(loginctl | grep -c -w "$line")`



n=${#line}
if [ $cuse -ge 1 ] && [ $n -gt 3 ];
then
                sudo chage -E $(date -d "+5days" +%F) $line
                mme=$(sudo sed "/"$line"/d" test.txt)
                sudo echo "$mme" > test.txt

API_TOKEN=6169617911:AAEUQNiIIK0NGeO4PUw3BqM34EVSg0fE1o0
CHAT_ID=5943862510
read -r -d '' msg <<EOT
Host: $svr
User: $line
has started using....
EOT

curl -s -X POST https://api.telegram.org/bot$API_TOKEN/sendMessage -d chat_id=$CHAT_ID -d text="$msg"

fi


done <$file
