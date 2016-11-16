IPTABLES=/sbin/iptables

IP_ADDRESS=`ifconfig  | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1}' | head -n 1`
echo $IP_ADDRESS

$IPTABLES -F
$IPTABLES -N internet -t mangle
$IPTABLES -t mangle -A PREROUTING -i wlan0 -j internet

#awk 'BEGIN { FS="\t"; } { system("sudo /sbin/iptables -t mangle -A internet -m mac --mac-source "$4" -j RETURN"); }' /var/lib/users

$IPTABLES -t mangle -A internet -j MARK --set-mark 99
$IPTABLES -t nat -A PREROUTING -m mark --mark 99 -p tcp --dport 80 -j DNAT --to-destination $IP_ADDRESS
$IPTABLES -t filter -A FORWARD -m mark --mark 99 -j DROP

echo "1" > /proc/sys/net/ipv4/ip_forward
$IPTABLES -A FORWARD -i wlan0 -o eth0 -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -i eth0 -o wlan0 -j ACCEPT
$IPTABLES -t nat -A POSTROUTING -o wlan0 -j MASQUERADE

