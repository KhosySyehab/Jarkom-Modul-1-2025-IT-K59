# !/bin/bash
# soal_14.sh -- helper commands to analyze given pcap (count packets, top talkers, syn counts)
PCAP="${1:-file.pcapng}"

if [ ! -f "$PCAP" ]; then
  echo "Usage: $0 file.pcapng" >&2
  exit 1
fi

# total packets
echo "Total packets:"
tshark -r "$PCAP" | wc -l

# top 10 IPv4 talkers
echo "Top IPv4 endpoints (by packets):"
tshark -r "$PCAP" -q -z endpoints,ip | sed -n '1,60p'

# count SYN packets per dst port
echo "Top SYN dest ports:"
tshark -r "$PCAP" -Y "tcp.flags.syn==1 && tcp.flags.ack==0" -T fields -e tcp.dstport | sort | uniq -c | sort -nr | head -n 20
