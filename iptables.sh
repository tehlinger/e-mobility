IPTABLES=/sbin/iptables

IP_ADDRESS=`ifconfig  | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1}' | head -n 1`

sudo $IPTABLES -F
sudo $IPTABLES -N internet -t mangle
sudo $IPTABLES -t mangle -A PREROUTING -i wlan0 -j internet

sudo $IPTABLES -t mangle -A internet -j MARK --set-mark 99
sudo $IPTABLES -t nat -A PREROUTING -m mark --mark 99 -p tcp --dport  80 -j DNAT --to-destination $IP_ADDRESS
sudo $IPTABLES -t nat -A PREROUTING -m mark --mark 99 -p tcp --dport 443 -j DNAT --to-destination $IP_ADDRESS
sudo $IPTABLES -t filter -A FORWARD -m mark --mark 99 -j DROP

sudo echo "1" > /proc/sys/net/ipv4/ip_forward
sudo $IPTABLES -A FORWARD -i wlan0 -o eth0 -m state --state ESTABLISHED,RELATED -j ACCEPT
sudo $IPTABLES -A FORWARD -i eth0 -o wlan0 -j ACCEPT
sudo $IPTABLES -t nat -A POSTROUTING -o wlan0 -j MASQUERADE

