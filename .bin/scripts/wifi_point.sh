netctl stop-all
#ifconfig wlp3s0 192.168.42.1/24 up
#dhcpcd
sysctl net.ipv4.ip_forward=1 
systemctl start dnsmasq
iptables -t nat -A POSTROUTING -o enp4s0 -j MASQUERADE
systemctl start hostapd
