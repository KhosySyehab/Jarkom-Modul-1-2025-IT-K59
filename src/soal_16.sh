#!/bin/bash
# soal_16.sh -- extract HTTP Basic auth or POSTed form creds from pcap
PCAP="${1:-file.pcapng}"
OUT="${2:-http_creds.txt}"
if [ ! -f "$PCAP" ]; then echo "Usage: $0 file.pcapng"; exit 1; fi

# Extract HTTP Authorization headers (Basic)
tshark -r "$PCAP" -Y 'http.authorization' -T fields -e http.host -e http.request.uri -e http.authorization | \
awk -F'\t' '{print $1"\t"$2"\t"$3}' > /tmp/http_auth_lines.txt

# Decode Basic tokens if present
> "$OUT"
while IFS=$'\t' read -r host uri auth; do
  if [[ $auth == Basic* ]]; then
    token=$(echo "$auth" | awk '{print $2}')
    decoded=$(echo "$token" | base64 -d 2>/dev/null || true)
    echo "$host $uri $decoded" >> "$OUT"
  fi
done < /tmp/http_auth_lines.txt

# Also check POSTs for form login fields
tshark -r "$PCAP" -Y 'http.request.method == "POST"' -T fields -e frame.number -e tcp.stream -e http.host -e http.request.uri -e http.file_data | \
awk 'NF{print $0}' >> "$OUT"

echo "Outputs appended to $OUT. Inspect for user:pass pairs."
