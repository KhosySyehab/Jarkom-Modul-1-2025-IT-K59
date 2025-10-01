#!/bin/bash
# Konfigurasi jaringan sesuai topologi:
# Eru sebagai router, dengan 2 switch ke 4 client (Melkor, Manwe, Varda, Ulmo)

# Konfigurasi pada Router (Eru)
ip addr add 192.168.1.1/24 dev eth1   # menuju Switch1
ip addr add 192.168.2.1/24 dev eth2   # menuju Switch2
ip link set eth1 up
ip link set eth2 up
ip link set eth0 up                   # NAT1 tetap hidup (internet)
sysctl -w net.ipv4.ip_forward=1       # aktifkan IP forwarding

# Konfigurasi pada Melkor
ip addr add 192.168.1.2/24 dev eth0
ip link set eth0 up
ip route add default via 192.168.1.1

# Konfigurasi pada Manwe
ip addr add 192.168.1.3/24 dev eth0
ip link set eth0 up
ip route add default via 192.168.1.1

# Konfigurasi pada Varda
ip addr add 192.168.2.2/24 dev eth0
ip link set eth0 up
ip route add default via 192.168.2.1

# Konfigurasi pada Ulmo
ip addr add 192.168.2.3/24 dev eth0
ip link set eth0 up
ip route add default via 192.168.2.1

echo "Konfigurasi selesai. Coba ping antar client via Eru."
