# !/bin/bash
# soal_11.sh -- install and enable telnet service on Melkor
# Run on Melkor as root

set -euo pipefail
if [ "$(id -u)" -ne 0 ]; then echo "Run as root"; exit 1; fi

apt-get update -y || true
apt-get install -y inetutils-inetd telnetd || true

# Ensure inetd configuration contains telnet line (idempotent)
grep -q '^telnet[[:space:]]' /etc/inetd.conf || echo "telnet  stream  tcp     nowait  root    /usr/sbin/tcpd  /usr/sbin/telnetd" >> /etc/inetd.conf

# Restart inetd
if command -v systemctl >/dev/null 2>&1; then
  systemctl restart inetutils-inetd.service 2>/dev/null || service inetutils-inetd restart || true
else
  service inetutils-inetd restart || true
fi

ss -ltnp | grep :23 || true

echo "[soal_11] Telnet should be listening now on port 23."
