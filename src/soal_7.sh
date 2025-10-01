# !/bin/bash
# soal_7.sh -- install vsftpd, buat user ainur (rw) dan melkor (no access)
# Run on Eru as root
set -euo pipefail

if [ "$(id -u)" -ne 0 ]; then
  echo "Run as root" >&2; exit 1
fi

apt-get update -y || true
apt-get install -y vsftpd || { echo "Cannot install vsftpd"; exit 2; }

# Ensure users exist
if ! id -u ainur >/dev/null 2>&1; then
  useradd -m -s /bin/bash ainur
  echo "ainur:ainurpass" | chpasswd
fi

if ! id -u melkor >/dev/null 2>&1; then
  useradd -m -s /bin/bash melkor
  echo "melkor:melkorpass" | chpasswd
fi

# Setup ftp directory
mkdir -p /home/ainur/ftp/shared
chown -R ainur:ainur /home/ainur/ftp
chmod 750 /home/ainur
chmod 770 /home/ainur/ftp/shared

# Backup and create minimal vsftpd config
if [ ! -f /etc/vsftpd.conf.bak ]; then
  [ -f /etc/vsftpd.conf ] && cp /etc/vsftpd.conf /etc/vsftpd.conf.bak || true
fi

cat > /etc/vsftpd.conf <<'EOF'
listen=YES
listen_ipv6=NO
anonymous_enable=NO
local_enable=YES
write_enable=YES
local_umask=022
chroot_local_user=YES
allow_writeable_chroot=YES
pasv_enable=YES
pasv_min_port=30000
pasv_max_port=31000
seccomp_sandbox=NO
EOF

# Start/restart vsftpd. If systemd not running (container), try openrc or sysv.
if command -v systemctl >/dev/null 2>&1 && systemctl --version >/dev/null 2>&1; then
  systemctl restart vsftpd || systemctl start vsftpd || true
else
  # fallback try invoke-rc.d or service
  service vsftpd restart 2>/dev/null || service vsftpd start 2>/dev/null || true
fi

echo "[soal_7] vsftpd configured. ainur (rw) -> /home/ainur/ftp/shared"
echo "Note: set permissions on /home/ainur/ftp/shared if needed."
