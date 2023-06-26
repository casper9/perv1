user="$2"

exp=$(grep -wE "^#vm $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
        sed -i "/^#vm $user $exp/,/^},{/d" /etc/xray/config.json >/dev/null 2>&1
        sed -i "/^#vmg $user $exp/,/^},{/d" /etc/xray/config.json >/dev/null 2>&1
        rm /home/vps/public_html/vmess-$user.txt >/dev/null 2>&1
        rm /etc/vmess/${user}IP >/dev/null 2>&1
        rm /etc/vmess/${user}login >/dev/null 2>&1
        systemctl restart xray >/dev/null 2>&1
