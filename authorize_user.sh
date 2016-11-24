#sudo sleep 3
mac=`arp -a | grep $1 | cut -d ' ' -f 4`

sudo iptables -I internet -t mangle -m mac --mac-source $mac -j RETURN
echo 'sudo iptables -t mangle -D internet -t mangle -m mac --mac-source ' $mac ' -j RETURN' >> /home/pi/e-mobility/block_users.sh

sudo ip6tables -I internet -t mangle -m mac --mac-source $mac -j RETURN
echo 'sudo ip6tables -t mangle -D internet -t mangle -m mac --mac-source ' $mac ' -j RETURN' >> /home/pi/e-mobility/block_users.sh

sudo chmod +x  /home/pi/e-mobility/block_users.sh
