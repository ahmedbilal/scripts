ip link add name br0 type bridge
ip addr add 192.168.100.50/24 dev br0
ip link set br0 up
dnsmasq --interface=br0 --bind-interfaces --dhcp-range=192.168.100.2,192.168.100.254

modprobe tun

[[ ! -d /etc/qemu ]] && mkdir /etc/qemu
echo allow br0 > /etc/qemu/bridge.conf

sysctl net.ipv4.ip_forward=1
sysctl net.ipv6.conf.default.forwarding=1
sysctl net.ipv6.conf.all.forwarding=1

iptables -t nat -A POSTROUTING -o wlp3s0 -j MASQUERADE

iptables -A FORWARD -i wlp3s0 -o br0 -m state --state RELATED,ESTABLISHED -j ACCEPT 

iptables -A FORWARD -i br0 -o wlp3s0 -j ACCEPT 

