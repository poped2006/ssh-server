#! /bin/sh
echo "Do you want to change root password? (y or n):"
read chngpass
if [ $chngpass == "y" ]
then
passwd
echo "1.pass changed"
fi
echo "Enter Server Address:"
read svr
echo $svr >> /root/server.txt
echo "Enter Port Number:"
read pnum
sudo cp /root/ssh-server/telegram-api.sh /root/telegram-api.sh
sudo bash /root/telegram-api.sh
echo "Telegram Bot Installed"
sleep 1
sudo cp /root/ssh-server/sss /usr/bin/sss
sudo chmod +x /usr/bin/sss
echo "Server Manager Installed"
sleep 1
echo "Port $pnum" >> /etc/ssh/sshd_config
echo "2.port Added"
yum install -q -y policycoreutils-python
sleep 1
echo "3.policycoreutils-python Installed"
semanage port -a -t ssh_port_t -p tcp $pnum
echo "4.Port Added semanage at"
semanage port -m -t ssh_port_t -p tcp $pnum
echo "5.Port Added semanage mt"
sleep 1
sudo systemctl status firewalld
echo "6.firewalld status"
firewall-cmd --permanent --remove-service=ssh
sleep 1
echo "7.Remove ssh"
firewall-cmd --permanent --add-port=$pnum/tcp
sleep 1
echo "8.Add $pnum to firewalld"
firewall-cmd --reload
echo "9.Reload firewall"
systemctl restart sshd
sleep 1
echo "10.SSHD Restarted"
systemctl status sshd
echo "11.Status of firewalld Showed"
sleep 1
sudo firewall-cmd --list-all
echo "12.firewalld Listed"
sudo cp /root/ssh-server/check.sh /root/check.sh
echo "13.check.sh Copied"
sudo cp /root/ssh-server/exp.sh /root/exp.sh
echo "14.exp.sh Copied"
sudo cp /root/ssh-server/testexp.sh /root/testexp.sh
echo "15.testexp.sh Copied"
sudo cp /root/ssh-server/create.sh /root/create.sh
echo "16.create.sh Copied"
sudo cp /root/ssh-server/tamdid.sh /root/tamdid.sh
echo "17.server.txt skipped!"
sudo cp /root/ssh-server/test.sh /root/test.sh
echo "18.test.sh Copied"
sudo cp /root/ssh-server/del.sh /root/del.sh
echo "19.del.sh Copied"
wget https://raw.githubusercontent.com/669800/badvpn/master/easyinstall && bash easyinstall
echo "20.badvpn Installed"
badvpn start
echo "21.badvpn Started"
echo "*/1 * * * * /usr/bin/bash /root/check.sh" >> /var/spool/cron/root
echo "22.check.sh Added to crontab"
echo "*/1 * * * * /usr/bin/bash /root/exp.sh" >> /var/spool/cron/root
echo "23.exp.sh  Added to crontab"
echo "*/1 * * * * /usr/bin/bash /root/testexp.sh" >> /var/spool/cron/root
echo "24.testexp.sh  Added to crontab"
echo "" >> /root/fuser.txt
echo "" >> /root/exp.txt
echo "" >> /root/test.txt
echo "$pnum" >> /root/port.txt
printf " ----------------------------------------------
*****************************
*******************
Installation Is Compeleted!
Server Adrss: $svr
Server Port : $pnum
*******************
*****************************
----------------------------------------------
"
