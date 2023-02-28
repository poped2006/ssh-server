#! /bin/sh
root change password
echo "Port 2022" >> /etc/ssh/sshd_config
yum install policycoreutils-python
semanage port -a -t ssh_port_t -p tcp 2022
semanage port -m -t ssh_port_t -p tcp 2022
sudo systemctl status firewalld
firewall-cmd --permanent --remove-service=ssh
firewall-cmd --permanent --add-port=2022/tcp
firewall-cmd --reload
systemctl restart sshd
systemctl status sshd
ssudo firewall-cmd --list-all
sudo cp check.sh /root/check.sh
sudo cp exp.sh /root/exp.sh
sudo cp testexp.sh /root/testexp.sh
sudo cp create.sh /root/create.sh
sudo cp server.txt /root/server.sh
sudo cp test.sh /root/test.sh
sudo cp del.sh /root/del.sh
wget https://raw.githubusercontent.com/669800/badvpn/master/easyinstall && bash easyinstall
badvpn start
echo "*/1 * * * * /usr/bin/bash /root/check.sh" >> /var/spool/cron/root
echo "*/1 * * * * /usr/bin/bash /root/exp.sh" >> /var/spool/cron/root
echo "*/1 * * * * /usr/bin/bash /root/testexp.sh" >> /var/spool/cron/root

printf " ----------------------------------------------
*****************************
*******************
Installation Is Compeleted!
*******************
*****************************
----------------------------------------------"