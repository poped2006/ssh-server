#! /bin/sh



file="fuser.txt"
i=0

while [ $i -lt 7 ]; do
#--------------------------------------------
while read -r line; do


        cuse=`(loginctl | grep -c -w "$line")`



n=${#line}
if [ $cuse -ge 2 ] && [ $n -gt 3 ];
then
        #sew=`(loginctl)`
        sudo echo `date` >> Deleted_User.txt
        sudo echo $line >> Deleted_User.txt
        #sudo echo "$sew" >> Deleted_User.txt
        sudo echo "----------------------------------" >> Deleted_User.txt
        sudo killall -u $line


fi


done <$file
#------------------------------------------
sleep 8
  i=$(( i + 1 ))
done
