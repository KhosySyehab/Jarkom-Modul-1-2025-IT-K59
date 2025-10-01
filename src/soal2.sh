#!/bin/bash
# Konfigurasi agar Eru bisa tersambung ke internet
# dan melakukan NAT untuk melayani client di Arda.

# ---- Konfigurasi IP Router (Eru) ----
ip addr add 192.168.1.1/24 dev eth1   # LAN ke Switch1
ip addr add 192.168.2.1/24 dev eth2   # LAN ke Switch2
ip link set eth0 up                   # interface ke internet
ip link set eth1 up
ip link set eth2 up

# Aktifkan IP Forwarding
sysctl -w net.ipv4.ip_forward=1

# ---- NAT (Masquerade) ----
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

echo "Router Eru siap, NAT aktif. Client bisa akses internet via Eru."
