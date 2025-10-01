# !/bin/bash
# soal_12.sh -- scan ports 21, 80, 666 on target using netcat
# Run on Eru (or other node with route to target)

set -euo pipefail
TARGET="${TARGET:-10.93.1.2}"
PORTS=(21 80 666)

if ! command -v nc >/dev/null 2>&1; then
  apt-get update -y || true
  apt-get install -y netcat-openbsd || true
fi

for p in "${PORTS[@]}"; do
  echo -n "Checking $TARGET:$p ... "
  if nc -vz -w 3 "$TARGET" "$p" 2>&1 | grep -q succeeded; then
    echo "OPEN"
  else
    echo "CLOSED/REFUSED/TIMEDOUT"
  fi
done

echo "[soal_12] Done."
