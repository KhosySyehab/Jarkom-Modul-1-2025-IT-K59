#!/bin/bash
# soal_5.sh
# Membuat konfigurasi permanen agar tidak hilang setelah restart (prefix 10.93)

# --- Router (Eru) ---
cat <<EOF > /etc/network/interfaces
# Loopback
auto lo
iface lo inet loopback

# Interface ke internet
auto eth0
iface eth0 inet dhcp

# LAN ke Switch1
auto eth1
iface eth1 inet static
  address 10.93.1.1
  netmask 255.255.255.0

# LAN ke Switch2
auto eth2
iface eth2 inet static
  address 10.93.2.1
  netmask 255.255.255.0
EOF

# Aktifkan IP forwarding permanen
sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/' /etc/sysctl.conf
sysctl -p

# Simpan aturan iptables
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables-save > /etc/iptables/rules.v4

# --- Client (contoh Melkor) ---
cat <<EOF > /etc/network/interfaces
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
  address 10.93.1.2
  netmask 255.255.255.0
  gateway 10.93.1.1
EOF

# Untuk client lain tinggal ganti:
# Manwe = 10.93.1.3 gw 10.93.1.1
# Varda = 10.93.2.2 gw 10.93.2.1
# Ulmo  = 10.93.2.3 gw 10.93.2.1

echo "Konfigurasi permanen dengan prefix 10.93 selesai."
