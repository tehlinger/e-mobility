sudo iptables -I internet 1 -t mangle -m mac --mac-source $1 -j RETURN
sudo /usr/bin/rmtrack  $2
