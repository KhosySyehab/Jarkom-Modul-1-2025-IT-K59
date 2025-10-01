# !/bin/bash
# soal_10.sh -- spam ping (100 packets) from Melkor to Eru and log result
# Run as root on Melkor

set -euo pipefail
TARGET="${TARGET:-10.93.1.1}"
COUNT="${COUNT:-100}"

if ! command -v ping >/dev/null 2>&1; then
  apt-get update -y || true
  apt-get install -y iputils-ping || true
fi

echo "[soal_10] Pinging $TARGET with $COUNT packets..."
ping -c "$COUNT" "$TARGET"
echo "[soal_10] Done King."
