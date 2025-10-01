#!/bin/bash
# soal_15.sh -- extract and decode USB HID keystrokes from pcap (requires tshark + python3)
PCAP="${1:-file.pcapng}"
OUT="${2:-decoded_keystrokes.txt}"
if [ ! -f "$PCAP" ]; then echo "Usage: $0 file.pcapng [output]"; exit 1; fi

# Try to extract HID hex lines using tshark fields
if tshark -r "$PCAP" -Y usb.capdata -T fields -e usb.capdata | head -n 1 >/dev/null 2>&1; then
  tshark -r "$PCAP" -Y usb.capdata -T fields -e usb.capdata > /tmp/hid_lines.txt
elif tshark -r "$PCAP" -Y usbhid.data -T fields -e usbhid.data | head -n 1 >/dev/null 2>&1; then
  tshark -r "$PCAP" -Y usbhid.data -T fields -e usbhid.data > /tmp/hid_lines.txt
else
  echo "ERROR: cannot find usb HID fields via tshark. Try -V verbose parse or use Wireshark GUI." >&2
  exit 2
fi

# Now decode using a small Python inline script
python3 - <<'PY'
import re
hidmap = {0x04:'a',0x05:'b',0x06:'c',0x07:'d',0x08:'e',0x09:'f',0x0a:'g',0x0b:'h',0x0c:'i',0x0d:'j',
0x0e:'k',0x0f:'l',0x10:'m',0x11:'n',0x12:'o',0x13:'p',0x14:'q',0x15:'r',0x16:'s',0x17:'t',
0x18:'u',0x19:'v',0x1a:'w',0x1b:'x',0x1c:'y',0x1d:'z',0x1e:'1',0x1f:'2',0x20:'3',0x21:'4',
0x22:'5',0x23:'6',0x24:'7',0x25:'8',0x26:'9',0x27:'0',0x2c:' ',0x28:'\\n',0x2d:'-',0x2e:'=',
0x2f:'[',0x30:']',0x31:'\\\\',0x33:';',0x34:"'",0x36:',',0x37:'.',0x38:'/'}
shift_map = {'1':'!','2':'@','3':'#','4':'$','5':'%','6':'^','7':'&','8':'*','9':'(','0':')'}
def decode(bytes_list):
    if len(bytes_list)<3:
        return ''
    mod = bytes_list[0]
    res=[]
    for u in bytes_list[2:]:
        if u==0: continue
        ch = hidmap.get(u,'?')
        shift = bool(mod & 0x02 or mod & 0x20)
        if shift and ch.isalpha():
            res.append(ch.upper())
        elif shift and ch.isdigit():
            res.append(shift_map.get(ch,ch))
        else:
            res.append(ch)
    return ''.join(res)

lines=[]
with open('/tmp/hid_lines.txt') as fh:
    for l in fh:
        hexs = re.findall(r'[0-9a-fA-F]{2}', l)
        if not hexs: continue
        bytes_list=[int(x,16) for x in hexs]
        lines.append(bytes_list)
# remove repeated key-hold duplicates
out=[]
last=None
for b in lines:
    key = tuple(b[2:]) if len(b)>=3 else ()
    if key==last: continue
    last=key
    out.append(decode(b))
text=''.join(out)
with open('''${OUT}''','w') as of:
    of.write(text)
print("Decoded saved to ${OUT}")
PY
