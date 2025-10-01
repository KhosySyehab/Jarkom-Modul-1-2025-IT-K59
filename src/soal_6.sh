# !/bin/bash
# soal_6.sh -- konfigurasi dasar Eru: IP forwarding dan NAT (nftables)

set -euo pipefail
echo "[soal_6] Starting configuration on Eru..."

if [ "$(id -u)" -ne 0 ]; then
  echo "ERROR: please run as root" >&2
  exit 1
fi

# Enable ip forwarding temporarily
sysctl -w net.ipv4.ip_forward=1 >/dev/null

# Install nftables if missing (with retry)
if ! command -v nft >/dev/null 2>&1; then
  apt-get update -y || true
  apt-get install -y nftables || { echo "ERROR: cannot install nftables"; exit 2; }
fi

# Determine external interface (assumes eth0 connected to internet)
# if unsure, you can set IFOUT manually by exporting IFOUT before running script
IFOUT="${IFOUT:-eth0}"

# Create NAT table and POSTROUTING chain (idempotent)
nft list table ip nat >/dev/null 2>&1 || nft add table ip nat
nft 'list chain ip nat POSTROUTING' >/dev/null 2>&1 || \
  nft add chain ip nat POSTROUTING '{ type nat hook postrouting priority 100 ; }' || true

# Add masquerade rule (replace existing one if needed)
if ! nft list ruleset | grep -q "postrouting.*masquerade"; then
  nft add rule ip nat POSTROUTING oifname \""$IFOUT"\" masquerade || true
fi

echo "[soal_6] ip forwarding enabled and NAT configured on $IFOUT"
echo "[soal_6] Done KIng."
