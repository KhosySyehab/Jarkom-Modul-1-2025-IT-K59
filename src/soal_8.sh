# !/bin/bash
# soal_8.sh -- prepare file and upload to Eru's FTP server as ainur
set -euo pipefail

ERU_IP="${ERU_IP:-10.93.1.1}"
FTP_USER="${FTP_USER:-ainur}"
FTP_PASS="${FTP_PASS:-ainurpass}"
LOCAL_FILE="${LOCAL_FILE:-/root/ramalan_cuaca.txt}"

# create sample file if missing
if [ ! -f "$LOCAL_FILE" ]; then
  echo "Ramalan cuaca sample" > "$LOCAL_FILE"
fi

# ensure ftp client available
if ! command -v ftp >/dev/null 2>&1; then
  echo "ftp client not found. Trying to install netkit-ftp / inetutils-ftpd package..."
  apt-get update -y || true
  apt-get install -y inetutils-ftpd ftp || true
  # if still not available, inform user to install manually
  if ! command -v ftp >/dev/null 2>&1; then
    echo "ftp client not installed. Please install ftp or use lftp/curl." >&2
    exit 2
  fi
fi

# Upload using standard ftp client in a noninteractive here-doc
ftp -n "$ERU_IP" <<END_FTP
user $FTP_USER $FTP_PASS
binary
cd shared || exit 1
put $LOCAL_FILE
quit
END_FTP

echo "[soal_8] Upload attempted. Check /home/ainur/ftp/shared on Eru."
