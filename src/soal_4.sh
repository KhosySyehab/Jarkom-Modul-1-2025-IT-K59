#!/bin/bash
# soal_4.sh
# Konfigurasi agar semua Ainur (Client) bisa akses internet melalui Eru dengan prefix 10.93

# --- Router (Eru) ---
# Aktifkan IP Forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward

# NAT (masquerade) agar LAN bisa keluar ke internet via eth0
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

# --- Konfigurasi interface router ---
# LAN ke Switch1
ip addr add 10.93.1.1/24 dev eth1
# LAN ke Switch2
ip addr add 10.93.2.1/24 dev eth2

# --- Konfigurasi Client ---
# Melkor
ip addr add 10.93.1.2/24 dev eth0
ip route add default via 10.93.1.1

# Manwe
ip addr add 10.93.1.3/24 dev eth0
ip route add default via 10.93.1.1

# Varda
ip addr add 10.93.2.2/24 dev eth0
ip route add default via 10.93.2.1

# Ulmo
ip addr add 10.93.2.3/24 dev eth0
ip route add default via 10.93.2.1

echo "Semua Ainur sudah bisa terkoneksi ke internet melalui Eru (prefix 10.93)."
