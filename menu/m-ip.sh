#!/bin/bash
BURIQ () {
    curl -sS https://raw.githubusercontent.com/casper/theme > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f /root/tmp
}

MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/casper9/permission/main/ipmini | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Permission Accepted..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/casper9/permission/main/ipmini | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}
red='\e[1;31m'
green='\e[1;32m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
PERMISSION
if [ -f /home/needupdate ]; then
red "Your script need to update first !"
exit 0
elif [ "$res" = "Permission Accepted..." ]; then
echo -ne
else
red "Permission Denied!"
exit 0
fi

MYIP=$(wget -qO- ipinfo.io/ip);

colornow=$(cat /etc/casper/theme/color.conf)
NC="\e[0m"
COLOR1="$(cat /etc/casper/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
COLBG1="$(cat /etc/casper/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"
WH='\033[1;37m'

APIGIT=$(cat /etc/github/api)
EMAILGIT=$(cat /etc/github/email)
USERGIT=$(cat /etc/github/username)
author=$(cat /etc/profil)


function del_ip(){
author=$(cat /etc/profil)
superadmin=$(curl -sS https://raw.githubusercontent.com/casper9/permission/main/ipmini | grep $MYIP | awk '{print $7}')
if [ "$superadmin" = "VIP" ]; then
delipvps
else
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}              ${WH}• IPVPS GITHUB API •              ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}   [INFO] Kamu Bukan Super Admin"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• $author •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-ip
fi
}
function setapi(){
clear
author=$(cat /etc/profil)
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}              ${WH}• IPVPS GITHUB API •              ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"

if [[ -f /etc/github/api && -f /etc/github/email && /etc/github/username ]]; then
   rec="OK"
else
    mkdir /etc/github > /dev/null 2>&1
fi

read -p " E-mail   : " EMAIL1
if [ -z $EMAIL1 ]; then
echo -e "$COLOR1 ${NC}   [INFO] Please Input Your Github Email Adress"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• $author •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-ip
fi

read -p " Username : " USERNAME1
if [ -z $USERNAME1 ]; then
echo -e "$COLOR1 ${NC}   [INFO] Please Input Your Github Username"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• $author •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-ip
fi

read -p " API      : " API1
if [ -z $API1 ]; then
echo -e "$COLOR1 ${NC}  [INFO] Please Input Your Github API"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• $author •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e ""
read -n 1 -s -r -p "  Press any key to back on menu"
m-ip
fi

sleep 2
echo "$EMAIL1" > /etc/github/email
echo "$USERNAME1" > /etc/github/username
echo "$API1" > /etc/github/api
echo "ON" > /etc/github/gitstat
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}               ${WH}• REGISTER IPVPS •              ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}   [INFO] Github Api Setup Successfully"
echo -e "$COLOR1 ${NC}"
echo -e "$COLOR1 ${NC}   • Email : $EMAIL1"
echo -e "$COLOR1 ${NC}   • User  : $USERNAME1"
echo -e "$COLOR1 ${NC}   • API   : $API1"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• $author •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-ip
}

function viewapi(){
author=$(cat /etc/profil)
IPVPS=$(curl -s ipinfo.io/ip )
ISP=$(cat /etc/xray/isp)
CITY=$(cat /etc/xray/city)
nama2=$(curl -sS https://raw.githubusercontent.com/casper9/permission/main/ipmini | grep $MYIP | awk '{print $2}')
Exp2=$(curl -sS https://raw.githubusercontent.com/casper9/permission/main/ipmini | grep $MYIP | awk '{print $3}')
job2=$(curl -sS https://raw.githubusercontent.com/casper9/permission/main/ipmini | grep $MYIP | awk '{print $7}')
ipmini=$(curl -sS https://raw.githubusercontent.com/casper9/permission/main/ipmini | grep $MYIP | awk '{print $6}')
sisaip=$(cat /etc/regip/ipmini | wc -l) 
totalip=$(expr $ipmini - $sisaip)
if [ "job2" = "VIP" ]; then
job="VIP SUPER ADMIN"
else
job="VIP ADMIN"
fi
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}             ${WH}• LIST REGISTER IP •              ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}  • Nama   : $nama2"
echo -e "$COLOR1 ${NC}  • IP     : $IPVPS"
echo -e "$COLOR1 ${NC}  • ISP    : $ISP & $CITY"
echo -e "$COLOR1 ${NC}  • EXP    : $Exp2"
echo -e "$COLOR1 ${NC}  • ROLE   : $job"
echo -e "$COLOR1 ${NC}  • SISA IP : $totalip"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• $author •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-ip
}

function add_ip(){
clear
nama2=$(curl -sS https://raw.githubusercontent.com/casper9/permission/main/ipmini | grep $MYIP | awk '{print $2}')
author=$(cat /etc/profil)
TIMES="10"
CHATID=$(cat /etc/per/id)
KEY=$(cat /etc/per/token)
URL="https://api.telegram.org/bot$KEY/sendMessage"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}               ${WH}• REGISTER IPVPS •              ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
rm -rf /root/casper
read -p "   MASUKKAN IPNYA: " daftar
echo -e "$COLOR1 ${NC}"
echo -e "$COLOR1 ${NC}  [INFO] Checking the IPVPS!"
sleep 1
REQIP=$(curl -sS https://raw.githubusercontent.com/${USERGIT}/permission/main/ipmini | awk '{print $4}' | grep $daftar)
if [[ $daftar = $REQIP ]]; then
echo -e "$COLOR1 ${NC}  [INFO] VPS IP Already Registered!!"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• $author •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-ip
else
echo -e "$COLOR1 ${NC}  [INFO] OK! IP VPS is not Registered!"
echo -e "$COLOR1 ${NC}  [INFO] Lets Register it!"
sleep 3
clear
fi
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}               ${WH}• REGISTER IPVPS •              ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1      ${NC}${WH}GA BOLEH ADA SPASI${NC}                 $COLOR1 $NC"

read -p "   User Name  : " client
if [ -z $client ]; then
cd
echo -e "$COLOR1 ${NC}  [INFO] Please Input client"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• $author •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-ip
fi
clear
read -p " Expired (days): " hari
if [ -z $hari ]; then
echo -e "$COLOR1 ${NC}   [INFO] Please Input exp date"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• $author •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-ip
fi

superadmin=$(curl -sS https://raw.githubusercontent.com/casper9/permission/main/ipmini | grep $MYIP | awk '{print $7}')
if [ "$superadmin" = "VIP" ]; then
x="ok"

satu="ON"
dua="OFF"
while true $x != "ok"
do

echo -e "$COLOR1 ${NC}"
echo -e "$COLOR1 ${NC}  ${COLOR1}[01]${NC} • ADMIN   ${COLOR1}[02]${NC} • NORMAL"
echo -e "$COLOR1 ${NC}"
echo -ne "   Input your choice : "; read list
echo ""
case "$list" in 
   1) isadmin="$satu";break;;
   2) isadmin="$dua";break;;
esac
done

until [[ $iplim =~ ^[0-9]+$ ]]; do
read -p "Limit User (IP): " ipmini
done
if [ -z ${iplim} ]; then
  iplim="999"
fi
echo "$daftar}" >> /etc/regip/ipmini
fi
exp=$(date -d "$hari days" +"%Y-%m-%d")
hariini=$(date -d "0 days" +"%Y-%m-%d")
git config --global user.email "${EMAILGIT}" &> /dev/null
git config --global user.name "${USERGIT}" &> /dev/null
mkdir /root/casper
cd /root/casper/ &> /dev/null
rm -rf .git &> /dev/null
git init &> /dev/null
wget https://raw.githubusercontent.com/${USERGIT}/permission/main/ipmini &> /dev/null
if [ "$superadmin" = "VIP" ]; then
echo "### $client $exp $daftar $isadmin $ipmini @$nama2" >>ipmini
else
echo "### $client $exp $daftar @$nama2" >>ipmini 
fi
git add ipmini
git commit -m register &> /dev/null
git branch -M main &> /dev/null
git remote add origin https://github.com/${USERGIT}/permission &> /dev/null
git push -f https://${APIGIT}@github.com/${USERGIT}/permission &> /dev/null
sleep 1
clear
echo -e "$COLOR1┌────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}      ${WH}• REGISTER IPVPS •      ${NC} $COLOR1 $NC"
echo -e "$COLOR1└────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}  Client IP Register Successfully"
echo -e "$COLOR1 ${NC}"
echo -e "$COLOR1 ${NC}  Client Name   : $client"
if [ "$superadmin" = "VIP" ]; then
echo -e "$COLOR1 ${NC}  Admin Panel   : $isadmin"
echo -e "$COLOR1 ${NC}  JUMLAH IP    : $ipmini IP"
fi
echo -e "$COLOR1 ${NC}  IP VPS        : $daftar"
echo -e "$COLOR1 ${NC}  Register Date : $hariini"
echo -e "$COLOR1 ${NC}  Expired Date  : $exp"
cd
TEXT="
<code>◇━━━━━━━━━━━━━━◇</code>
<b>  ⚠️ INFO REGISTER IP </b>
<code>◇━━━━━━━━━━━━━━◇</code>
<b>CLIENT NAME   : <code>${client} </b> </code>
<b>IP VPS CLIENT  : <code>$daftar </b></code>
<b>REGISTER DATE : <code>$hariini </b></code>
<b>EXPIRED DATE  : <code>${exp} </b></code>
<code>◇━━━━━━━━━━━━━━◇</code>
"

curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null

rm -rf /root/casper
echo -e "$COLOR1└────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌───────────── ${WH}BY${NC} ${COLOR1}───────────────┐${NC}"
echo -e "$COLOR1 ${NC}             ${WH}• $author •${NC}               $COLOR1 $NC"
echo -e "$COLOR1└────────────────────────────────┘${NC}" 
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-ip
}
function delipvps(){
clear
author=$(cat /etc/profil)
TIMES="10"
CHATID=$(cat /etc/per/id)
KEY=$(cat /etc/per/token)
URL="https://api.telegram.org/bot$KEY/sendMessage"
rm -rf /root/casper &> /dev/null
git config --global user.email "${EMAILGIT}" &> /dev/null
git config --global user.name "${USERGIT}" &> /dev/null
mkdir /root/casper
cd /root/casper/ &> /dev/null
rm -rf .git &> /dev/null
wget https://raw.githubusercontent.com/${USERGIT}/permission/main/ipmini &> /dev/null
git init &> /dev/null
touch ipmini &> /dev/null
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}                 ${WH}• DELETE IPVPS •              ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
grep -E "^### " "ipmini" | cut -d ' ' -f 2-4 | nl -s '. '
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• $author •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo ""
read -rp "   Please Input Number Ctrl + C Exit : " nombor
if [ -z $nombor ]; then
cd
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}                 ${WH}• DELETE IPVPS •              ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1 ${NC}   [INFO] Please Input Correct Number"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• $author •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-ip
fi

name1=$(grep -E "^### " "ipmini" | cut -d ' ' -f 2 | sed -n "$nombor"p) #name
exp=$(grep -E "^### " "ipmini" | cut -d ' ' -f 3 | sed -n "$nombor"p) #exp
ivps1=$(grep -E "^### " "ipmini" | cut -d ' ' -f 4 | sed -n "$nombor"p) #ip
sed -i "s/### $name1 $exp $ivps1//g" ipmini &> /dev/null
hariini2=$(date -d "0 days" +"%Y-%m-%d")
TEXTD="
Name     : $name1
IPVPS    : $ivps1  
Status   : Deleted on  $hariini2
" 
echo "${TEXTD}" >>/root/casper/delete_log  &> /dev/null

git add ipmini &> /dev/null
git commit -m remove &> /dev/null
git branch -M main &> /dev/null
git remote add origin https://github.com/${USERGIT}/permission.git &> /dev/null
git push -f https://${APIGIT}@github.com/${USERGIT}/permission.git &> /dev/null
clear
echo -e "$COLOR1┌──────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}         ${WH}• DELETE IPVPS •        ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}  Client IP Deleted Successfully"
echo -e "$COLOR1 ${NC}"
echo -e "$COLOR1 ${NC}  Ip VPS       : $ivps1"
echo -e "$COLOR1 ${NC}  Expired Date : $exp"
echo -e "$COLOR1 ${NC}  Client Name  : $name1"
cd
TEXT="
<code>◇━━━━━━━━━━━━━━◇</code>
<b>  ⚠️ INFO DELETE IP </b>
<code>◇━━━━━━━━━━━━━━◇</code>
<b>CLIENT NAME   : <code>${name1} </b> </code>
<b>IP VPS CLIENT  : <code>$ivps1 </b></code>
<b>EXPIRED DATE  : <code>${exp} </b></code>
<b>Succes Delete this IP</b></code>
<code>◇━━━━━━━━━━━━━━◇</code>
"

curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null

rm -rf /root/casper
echo -e "$COLOR1└─────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌──────────────── ${WH}BY${NC} ${COLOR1}─────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• $author •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────┘${NC}" 
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-ip
}
function gantinama(){
clear
author=$(cat /etc/profil)
TIMES="10"
CHATID=$(cat /etc/per/id)
KEY=$(cat /etc/per/token)
URL="https://api.telegram.org/bot$KEY/sendMessage"
rm -rf /root/casper &> /dev/null
git config --global user.email "${EMAILGIT}" &> /dev/null
git config --global user.name "${USERGIT}" &> /dev/null
mkdir /root/casper
cd /root/casper/ &> /dev/null
rm -rf .git &> /dev/null
wget https://raw.githubusercontent.com/${USERGIT}/permission/main/ipmini &> /dev/null
git init &> /dev/null
touch ipmini &> /dev/null
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}                 ${WH}• GANTI NAMA IPVPS •              ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
grep -E "^### " "ipmini" | cut -d ' ' -f 2-4 | nl -s '. '
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• $author •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo ""
read -rp "   Please Input Number Ctrl + C Exit : " nombor
if [ -z $nombor ]; then
cd
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}                 ${WH}• GANTI NAMA IPVPS •              ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1 ${NC}   [INFO] Please Input Correct Number"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• $author •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-ip
fi

read -rp "   Please Input New Name : " namabaru

name1=$(grep -E "^### " "ipmini" | cut -d ' ' -f 2 | sed -n "$nombor"p) #name
exp=$(grep -E "^### " "ipmini" | cut -d ' ' -f 3 | sed -n "$nombor"p) #exp
ivps1=$(grep -E "^### " "ipmini" | cut -d ' ' -f 4 | sed -n "$nombor"p) #ip
sed -i "s/### $name1/### $namabaru/g" ipmini &> /dev/null
hariini2=$(date -d "0 days" +"%Y-%m-%d")
TEXTD="
Name old     : $namabaru
Name New    : $name1
Status        : succes change
" 
echo "${TEXTD}" >>/root/casper/delete_log  &> /dev/null

git add ipmini &> /dev/null
git commit -m remove &> /dev/null
git branch -M main &> /dev/null
git remote add origin https://github.com/${USERGIT}/permission.git &> /dev/null
git push -f https://${APIGIT}@github.com/${USERGIT}/permission.git &> /dev/null
clear
echo -e "$COLOR1┌──────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}         ${WH}• GANTI NAMA IPVPS •        ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}  Client IP Successfully Change"
echo -e "$COLOR1 ${NC}"
echo -e "$COLOR1 ${NC}  Name old    : $name1"
echo -e "$COLOR1 ${NC}  Name New   : $namabaru"
echo -e "$COLOR1 ${NC}  IPVPS        : $ivps1"
cd
TEXT="
<code>◇━━━━━━━━━━━━━━◇</code>
<b>  ⚠️ INFO GANTI NAMA</b>
<code>◇━━━━━━━━━━━━━━◇</code>
<b>Name Old   : <code>${name1} </b> </code>
<b>New Name  : <code>$namabaru </b></code>
<b>Succes Change</b></code>
<code>◇━━━━━━━━━━━━━━◇</code>
"

curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null

rm -rf /root/casper
echo -e "$COLOR1└─────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌──────────────── ${WH}BY${NC} ${COLOR1}─────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• $author •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────┘${NC}" 
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-ip
}
function gantiip(){
clear
author=$(cat /etc/profil)
TIMES="10"
CHATID=$(cat /etc/per/id)
KEY=$(cat /etc/per/token)
URL="https://api.telegram.org/bot$KEY/sendMessage"
rm -rf /root/casper &> /dev/null
git config --global user.email "${EMAILGIT}" &> /dev/null
git config --global user.name "${USERGIT}" &> /dev/null
mkdir /root/casper
cd /root/casper/ &> /dev/null
rm -rf .git &> /dev/null
wget https://raw.githubusercontent.com/${USERGIT}/permission/main/ipmini &> /dev/null
git init &> /dev/null
touch ipmini &> /dev/null
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}                 ${WH}• GANTI IPVPS •              ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
grep -E "^### " "ipmini" | cut -d ' ' -f 2-4 | nl -s '. '
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• $author •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo ""
read -rp "   Please Input Number Ctrl + C Exit : " nombor
if [ -z $nombor ]; then
cd
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}                 ${WH}• GANTI IPVPS •              ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1 ${NC}   [INFO] Please Input Correct Number"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• $author •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-ip
fi

read -rp "   Please Input New IP : " ipbaru

name1=$(grep -E "^### " "ipmini" | cut -d ' ' -f 2 | sed -n "$nombor"p) #name
exp=$(grep -E "^### " "ipmini" | cut -d ' ' -f 3 | sed -n "$nombor"p) #exp
ivps1=$(grep -E "^### " "ipmini" | cut -d ' ' -f 4 | sed -n "$nombor"p) #ip
sed -i "s/### $name1 $exp $ivps1/### $name1 $exp $ipbaru/g" ipmini &> /dev/null
hariini2=$(date -d "0 days" +"%Y-%m-%d")
TEXTD="
IPVPS old     : $ipvps
IPVPS New    : $ipbaru
Status        : succes change
" 
echo "${TEXTD}" >>/root/casper/delete_log  &> /dev/null

git add ipmini &> /dev/null
git commit -m remove &> /dev/null
git branch -M main &> /dev/null
git remote add origin https://github.com/${USERGIT}/permission.git &> /dev/null
git push -f https://${APIGIT}@github.com/${USERGIT}/permission.git &> /dev/null
clear
echo -e "$COLOR1┌──────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}         ${WH}• GANTI IPVPS •        ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}  Client IP Successfully Change"
echo -e "$COLOR1 ${NC}"
echo -e "$COLOR1 ${NC}  IP VPS old    : $ivps1"
echo -e "$COLOR1 ${NC}  IP VPS New   : $ipbaru"
echo -e "$COLOR1 ${NC}  Client Name   : $name1"
cd
TEXT="
<code>◇━━━━━━━━━━━━━━◇</code>
<b>  ⚠️ INFO GANTI IP</b>
<code>◇━━━━━━━━━━━━━━◇</code>
<b>IP Lama   : <code>${name1} </b> </code>
<b>IP Baru  : <code>$namabaru </b></code>
<b>Succes Change</b></code>
<code>◇━━━━━━━━━━━━━━◇</code>
"

curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null

rm -rf /root/casper
echo -e "$COLOR1└─────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌──────────────── ${WH}BY${NC} ${COLOR1}─────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• $author •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────┘${NC}" 
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-ip
}
function renewipvps(){
clear
author=$(cat /etc/profil)
TIMES="10"
CHATID=$(cat /etc/per/id)
KEY=$(cat /etc/per/token)
URL="https://api.telegram.org/bot$KEY/sendMessage"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}               ${WH}• RENEW IPVPS •              ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
rm -rf /root/casper
git config --global user.email "${EMAILGIT}" &> /dev/null
git config --global user.name "${USERGIT}" &> /dev/null
mkdir /root/casper
cd /root/casper
rm -rf .git
wget https://raw.githubusercontent.com/${USERGIT}/permission/main/ipmini &> /dev/null
git init
touch ipmini
echo -e "   [ ${Lyellow}INFO${NC} ] Checking list.."

NUMBER_OF_CLIENTS=$(grep -c -E "^### " "ipmini")
if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
  clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}               ${WH}• RENEW IPVPS •              ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}   [INFO] You have no existing clients!"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• $author •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-ip
fi
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}               ${WH}• RENEW PVPS •              ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
grep -E "^### " "ipmini" | cut -d ' ' -f 2-4 | nl -s '. '
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• $author •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e ""
until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
  if [[ ${CLIENT_NUMBER} == '1' ]]; then
    read -rp " Select one client Ctrl + C Exit [1]: " CLIENT_NUMBER
  else
    read -rp " Select one client Ctrl + C Exit [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
  fi
if [ -z $CLIENT_NUMBER ]; then
cd
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}               ${WH}• RENEW PVPS •              ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}   [INFO] Please Input Correct Number"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• $author •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-ip
fi
done
echo -e ""
read -p " Expired (days): " masaaktif
if [ -z $masaaktif ]; then
cd
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}               ${WH}• RENEW PVPS •              ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}  [INFO] Please Input Correct Number"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• $author •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-ip
fi
name1=$(grep -E "^### " "ipmini" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p) #name
exp=$(grep -E "^### " "ipmini" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p) #exp
ivps1=$(grep -E "^### " "ipmini" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p) #ip

now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(((d1 - d2) / 86400))
exp3=$(($exp2 + $masaaktif))
exp4=$(date -d "$exp3 days" +"%Y-%m-%d")
sed -i "s/### $name1 $exp $ivps1/### $name1 $exp4 $ivps1/g" ipmini
git add ipmini
git commit -m renew
git branch -M main
git remote add origin https://github.com/${USERGIT}/permission.git
git push -f https://${APIGIT}@github.com/${USERGIT}/permission.git
clear
echo -e "$COLOR1┌────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}      ${WH}• RENEW IPVPS •      ${NC} $COLOR1 $NC"
echo -e "$COLOR1└────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}  Client IP VPS Renew Successfully"
echo -e "$COLOR1 ${NC}"
echo -e "$COLOR1 ${NC}  Ip VPS        : $ivps1"
echo -e "$COLOR1 ${NC}  Renew Date    : $now"
echo -e "$COLOR1 ${NC}  Days Added    : $masaaktif Days"
echo -e "$COLOR1 ${NC}  Expired Date  : $exp4"
echo -e "$COLOR1 ${NC}  Client Name   : $name1"
cd
TEXT="
<code>◇━━━━━━━━━━━━━━◇</code>
<b>  ⚠️ RENEW IP SCRIPT</b>
<code>◇━━━━━━━━━━━━━━◇</code>
<b>CLIENT NAME   : <code>${name1} </b> </code>
<b>IP VPS CLIENT  : <code>$ivps1 </b></code>
<b>RENEW DATE    : <code>$now </b></code>
<b>DAYS ADDED    : <code>$masaaktif Days </b></code>
<b>EXPIRED DATE  : <code>${exp4} </b></code>
<code>◇━━━━━━━━━━━━━━◇</code>
"

curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null

rm -rf /root/casper
echo -e "$COLOR1└────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌──────────── ${WH}BY${NC} ${COLOR1}───────────────┐${NC}"
echo -e "$COLOR1 ${NC}       ${WH}• $author •${NC}         $COLOR1 $NC"
echo -e "$COLOR1└────────────────────────────────┘${NC}" 
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-ip
}

function useripvps(){
clear
author=$(cat /etc/profil)
rm -rf /root/casper
git config --global user.email "${EMAILGIT}"
git config --global user.name "${USERGIT}"
mkdir /root/casper
cd /root/casper/
rm -rf .git
wget https://raw.githubusercontent.com/${USERGIT}/permission/main/ipmini &> /dev/null
git init
touch ipmini
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}               ${WH}• USER IPVPS •              ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
grep -E "^### " "ipmini" | cut -d ' ' -f 2 | nl -s '. '
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• $author •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
cd
rm -rf /root/casper
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-ip
}


function resetipvps(){
clear
rm -f /etc/github/email
rm -f /etc/github/username
rm -f /etc/github/api
rm -f /etc/github/gitstat
echo "OFF" > /etc/github/gitstat
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}              ${WH}• RESET GITUB API •              ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}  [INFO] Github API Reseted Successfully"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• $author •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-ip  
}
if [ ! -e /etc/regip ]; then
  mkdir -p /etc/regip
  touch /etc/regip/ipmini
fi
Isadmin=$(curl -sS https://raw.githubusercontent.com/casper9/permission/main/ipmini | grep $MYIP | awk '{print $5}')
ipmini=$(curl -sS https://raw.githubusercontent.com/casper9/permission/main/ipmini | grep $MYIP | awk '{print $6}')
sisaip=$(cat /etc/regip/ipmini | wc -l) 
if [ "$Isadmin" = "OFF" ]; then
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}            ${WH}• PREMIUM USER ONLY •              ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} [INFO] Only PRO Users Can Use This Panel"
echo -e "$COLOR1 ${NC} [INFO] Buy Premium Membership : "
echo -e "$COLOR1 ${NC} [INFO] PM : https://t.me/CasperGaming"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• $author •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu
if [ "$sisaip" -gt "$ipmini" ]; then
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}            ${WH}• PREMIUM USER ONLY •              ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} [INFO] SISA IP REGIST KAMU SUDAH HABIS"
echo -e "$COLOR1 ${NC} [INFO] Buy Premium Membership : "
echo -e "$COLOR1 ${NC} [INFO] PM : https://t.me/CasperGaming"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• $author •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu
fi
totalip=$(expr $ipmini - $sisaip)
clear
rm -rf /etc/github/gitstat
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}               ${WH}• REGISTER IPVPS •              ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
GITREQ=/etc/github/gitstat
if [ -f "$GITREQ" ]; then
    cekk="ok"
else 
#    mkdir /etc/github
    touch /etc/github/gitstat
    echo "ON" > /etc/github/gitstat
fi

stst1=$(cat /etc/github/gitstat)
if [ "$stst1" = "OFF" ]; then
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}               ${WH}• REGISTER IPVPS •              ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}   • You Need To Set Github API First!"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• $author •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e ""
read -n 1 -s -r -p "   Press any key to Set API"
setapi
fi
stst=$(cat /etc/github/gitstat)
if [ "$stst" = "ON" ]; then
APIOK="CEK ADMIN"
rex="viewapi"
else
APIOK="SET API"
rex="setapi"
fi
if [ "$stst" = "ON" ]; then
ISON="RESET API"
ressee="resetipvps"
else
ISON=""
ressee="m-ip"
fi
echo -e "   $COLOR1 [01]$NC • $APIOK      $COLOR1 [05]$NC • RENEW IPVPS" 
echo -e "   $COLOR1 [02]$NC • ADD IPVPS      $COLOR1 [06]$NC • LIST IPVPS"
echo -e "   $COLOR1 [03]$NC • DELETE IPVPS   $COLOR1 [07]$NC • $ISON"
echo -e "   $COLOR1 [04]$NC • CHANGE NAME    $COLOR1 [08]$NC • CHANGE IPVPS"
echo -e "   "
echo -e "   $COLOR1 [00]$NC • GO BACK"

echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌───────────────── ${WH}SISA IP REG${NC} ${COLOR1}───────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                    ${WH}• $totalip •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e ""
echo -ne " ${WH}Select menu ${COLOR1}: ${WH}"; read opt
case $opt in
01 | 1) clear ; $rex ;;
02 | 2) clear ; add_ip ;;
03 | 3) clear ; del_ip ;;
04 | 4) clear ; gantinama ;;
05 | 5) clear ; renewipvps ;;
05 | 5) clear ; useripvps ;;
06 | 6) clear ; $ressee ;;
07 | 7) clear ; renewip ;;
08 | 8) clear ; gantiip ;;
00 | 0) clear ; menu ;;
*) clear ; m-ip ;;
esac
