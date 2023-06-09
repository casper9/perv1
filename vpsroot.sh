#!/bin/bash
#echo "$crot    ALL=(ALL:ALL) ALL" >> /etc/sudoers;
wget -qO- -O /etc/ssh/sshd_config https://raw.githubusercontent.com/casper9/sshd/main/sshd_config
systemctl restart sshd
clear
echo -e "Masukkan Password:"
read -e pwe
passwd root > $pwe
clear
echo -e " Mohon Simpan Informasi Akun VPS Ini "
echo -e " ============================================"
echo -e " Akun Root (Akun Utama) "
echo -e " Ip address = $(curl -Ls http://ipinfo.io/ip)"
echo -e " Username   = root"
echo -e " Password   = $pwe"
echo -e " ============================================"
rm -f vpsroot.sh
exit
