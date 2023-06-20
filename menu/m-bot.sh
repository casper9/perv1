#!/bin/bash

#install
apt update -y && apt upgrade -y
apt install python3 python3-pip git -y --fix-missing
apt-get install libjpeg-dev zlib1g-dev -y --fix-missing
git clone https://github.com/casper9/bot_panel.git
unzip bot_panel/casper.zip
pip3 install -r casper/requirements.txt
pip3 install pillow

#isi data
echo ""
read -e -p "[*] Input your Bot Token : " bottoken
read -e -p "[*] Input Your Id Telegram :" admin
echo -e BOT_TOKEN='"'$bottoken'"' >> /root/casper/var.txt
echo -e ADMIN='"'$admin'"' >> /root/casper/var.txt
clear
echo "Done"
echo "Your Data Bot"
echo -e "==============================="
echo "DOMAIN         : $bottoken"
echo "Email          : $admin"
echo -e "==============================="
echo "Setting done"


cat > /etc/systemd/system/casper.service << END
[Unit]
Description=Simple casper - @casper
After=network.target

[Service]
WorkingDirectory=/root
ExecStart=/usr/bin/python3 -m /root/casper
Restart=always

[Install]
WantedBy=multi-user.target
END

systemctl start casper
systemctl enable casper
systemctl restart casper

clear

echo " Installations complete, type /menu on your bot"
