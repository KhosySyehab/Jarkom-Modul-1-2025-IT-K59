#!/bin/bash
# soal_9.sh -- set ainur to read-only on shared dir, then test from Manwe
set -euo pipefail

if [ "$(id -u)" -ne 0 ]; then
  echo "Run on Eru as root" >&2; exit 1
fi

# Make shared read-only for ainur
chown -R ainur:ainur /home/ainur/ftp/shared
chmod -R 550 /home/ainur/ftp/shared
# ensure directory accessible to ftp chroot
chmod 755 /home/ainur/ftp

echo "[soal_9] Shared set to read-only for owner. Files should not be writable via FTP."

# To test from Manwe:
cat <<'INSTR'
-- On Manwe (client), test:
ftp 10.93.1.1
# login as ainur
cd shared
put /root/somefile.txt   # should fail (553 Could not create file)
get kitab_penciptaan.txt # should succeed if present
INSTR
