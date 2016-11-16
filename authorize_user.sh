#sudo sleep 3
sudo iptables -I internet 1 -t mangle -s $1 -j RETURN
echo 'sudo iptables -t mangle -D internet -s' $1 '-j RETURN' >> /home/pi/e-mobility/block_users.sh
#sudo /usr/bin/rmtrack  $1
