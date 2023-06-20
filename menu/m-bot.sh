#!/bin/bash
domen=`cat /etc/xray/domain`

#install
apt update -y && apt upgrade -y
apt install python3 python3-pip git -y --fix-missing
apt-get install libjpeg-dev zlib1g-dev -y --fix-missing
git clone https://github.com/casper9/bot_panel.git
unzip bot_panel/geo.zip
pip3 install -r geo/requirements.txt
pip3 install pillow

#isi data
echo ""
read -e -p "[*] Input your Bot Token : " bottoken
read -e -p "[*] Input Your Id Telegram :" admin
echo -e BOT_TOKEN='"'$bottoken'"' >> /root/geo/var.txt
echo -e ADMIN='"'$admin'"' >> /root/geo/var.txt
echo -e DOMAIN='"'$domen'"' >> /root/geo/var.txt
clear
echo "Done"
echo "Your Data Bot"
echo -e "==============================="
echo "DOMAIN         : $bottoken"
echo "Email          : $admin"
echo -e "==============================="
echo "Setting done"


cat > /etc/systemd/system/geo.service << END
[Unit]
Description=Simple geo - @geo
After=network.target

[Service]
WorkingDirectory=/root
ExecStart=/usr/bin/python3 -m geo
Restart=always

[Install]
WantedBy=multi-user.target
END

systemctl start geo
systemctl enable geo
systemctl restart geo

clear

echo " Installations complete, type /menu on your bot"
