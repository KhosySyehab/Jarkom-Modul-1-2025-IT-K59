# !/bin/bash
# soal_13.sh -- ensure OpenSSH server installed and root login allowed (lab only)
set -euo pipefail

if [ "$(id -u)" -ne 0 ]; then echo "Run as root"; exit 1; fi

apt-get update -y || true
apt-get install -y openssh-server || true

# Edit sshd_config safely (backup then modify)
SSHD="/etc/ssh/sshd_config"
cp -n "$SSHD" "${SSHD}.bak" || true

# Ensure PermitRootLogin yes and PasswordAuthentication yes
sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' "$SSHD" || echo "PermitRootLogin yes" >> "$SSHD"
sed -ri 's/^#?PasswordAuthentication\s+.*/PasswordAuthentication yes/' "$SSHD" || echo "PasswordAuthentication yes" >> "$SSHD"

# Restart ssh
if command -v systemctl >/dev/null 2>&1; then
  systemctl restart ssh || service ssh restart || true
else
  service ssh restart || true
fi

ss -ltnp | grep :22 || true

echo "[soal_13] SSH server configured. From Varda run: ssh root@<eru-ip>."
