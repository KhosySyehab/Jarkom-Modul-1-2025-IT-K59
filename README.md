# Jarkom-Modul-1-2025-IT-K59

| Nama           | NRP        |
|----------------|------------|
| Muhammad Farrel Rafli Al Fasya | 5027241075 |
| Muhammad Khosyi Syehab   | 5027241089 |

## **The Ainulindalë**
Sebuah kisah awal mula pembentukan dunia telah dibuka. Eru Ilúvatar atau yang nantinya disebut Eru adalah sang pencipta. Eru menciptakan roh-roh abadi yang disebut Ainur. Mereka adalah "anak-anak dari buah pikirannya". Eru meminta para Ainur untuk menciptakan musik agung bersama-sama. Melalui musik ini, sebuah visi tentang dunia yang akan datang (alam semesta) muncul. Ainu terkuat, Melkor, menjadi sombong dan memasukkan tema-tema sumbang dan egois ke dalam musik, menciptakan disonansi. Ini adalah asal mula kejahatan di alam semesta. Manwë Súlimo yang nantinya disebut Manwe adalah Ainu yang paling memahami kehendak Eru. Selama Musik Penciptaan, dialah yang menjadi konduktor utama untuk tema-tema dari Eru, sering kali berkonflik langsung dengan disonansi yang diciptakan Melkor. Ainur lainnya yang terlibat dalam pembentukan alam semesta dan turun ke Arda (Bumi) yaitu Varda Elentári (Varda) dan Ulmo.

## NO.1
Untuk mempersiapkan pembuatan entitas selain mereka, Eru yang berperan sebagai Router membuat dua Switch/Gateway. Dimana Switch 1 akan menuju ke dua Ainur yaitu Melkor dan Manwe. Sedangkan Switch 2 akan menuju ke dua Ainur lainnya yaitu Varda dan Ulmo. Keempat Ainur tersebut diberi perintah oleh Eru untuk menjadi Client.
<img width="1284" height="688" alt="Screenshot 2025-10-04 232252" src="https://github.com/user-attachments/assets/d84624bb-1c88-49e2-87db-e6abe498e6c9" />
Di GNS3: buat node Eru, tambahkan 3 NIC (eth0 ke NAT, eth1 ke Switch1, eth2 ke Switch2). Buat Switch1, connect `eth1 Eru → Switch1 → Melkor & Manwe`. Buat Switch2, `connect eth2 Eru → Switch2 → Varda & Ulmo`.

## NO.2
Karena menurut Eru pada saat itu Arda (Bumi) masih terisolasi dengan dunia luar, maka buat agar Eru dapat tersambung ke internet.
<img width="1284" height="688" alt="Screenshot 2025-10-04 232252" src="https://github.com/user-attachments/assets/a1da3d7b-8b50-4e88-9369-2067b773d61b" />
Pastikan eth0 Eru terhubung ke NAT. Bila perlu gunakan DHCP: `dhclient eth0 && ip addr show eth0`. Set DNS `echo "nameserver 8.8.8.8" > /etc/resolv.conf`. Tes menggunakan `ping -c 3 8.8.8.8  && ping -c 3 google.com`

## NO.3
Sekarang pastikan agar setiap Ainur (Client) dapat terhubung satu sama lain.
<img width="1284" height="688" alt="Screenshot 2025-10-04 232252" src="https://github.com/user-attachments/assets/943425f8-a020-42cd-9de5-191ba6c8c683" />
Di setiap client, cek: `ping -c 3 10.93.1.2` dan semua client yang ada.

## NO.4
Setelah berhasil terhubung, sekarang Eru ingin agar setiap Ainur (Client) dapat mandiri. Oleh karena itu pastikan agar setiap Client dapat tersambung ke internet.
<img width="1725" height="884" alt="Screenshot 2025-09-30 010243" src="https://github.com/user-attachments/assets/b5caaec6-d6ab-4a50-a9de-29e6f62520c6" />
Tambahkan rule NAT `iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 10.93.0.0/16`. Tambahkan rules FORWARD, ``iptables -A FORWARD -i eth0 -o eth1 -m state --state RELATED,ESTABLISHED -j ACCEPT && iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT && iptables -A FORWARD -i eth0 -o eth2 -m state --state RELATED,ESTABLISHED -j ACCEPT && iptables -A FORWARD -i eth2 -o eth0 -j ACCEPT``

## NO.5
Ainur terkuat Melkor tetap berusaha untuk menanamkan kejahatan ke dalam Arda (Bumi). Sebelum terjadi kerusakan, Eru dan para Ainur lainnya meminta agar semua konfigurasi tidak hilang saat semua node di restart.Ainur terkuat Melkor tetap berusaha untuk menanamkan kejahatan ke dalam Arda (Bumi). Sebelum terjadi kerusakan, Eru dan para Ainur lainnya meminta agar semua konfigurasi tidak hilang saat semua node di restart.
<img width="1284" height="688" alt="Screenshot 2025-10-04 232252" src="https://github.com/user-attachments/assets/82a38192-2f39-4a3a-9cc0-2f6475b73608" />  
Letakkan pengaturan otomatis di .bashrc (dengan pengecekan idempotent — see next). Buat /root/.bashrc yang menjalankan konfigurasi awal sekali (cek file flag /root/.eru_config_done). Setelah restart node, jalankan `ip addr show`, `cat /etc/resolv.conf`.

## NO.6 
Setelah semua Ainur terhubung ke internet, Melkor mencoba menyusup ke dalam komunikasi antara Manwe dan Eru. Jalankan file berikut (link file) lalu lakukan packet sniffing menggunakan Wireshark pada koneksi antara Manwe dan Eru, lalu terapkan display filter untuk menampilkan semua paket yang berasal dari atau menuju ke IP Address Manwe. Simpan hasil capture tersebut sebagai bukti.
<img width="1215" height="1016" alt="Screenshot 2025-09-30 011339" src="https://github.com/user-attachments/assets/380de2fc-65b6-4a1a-a387-e542b7842cdf" />
<img width="1219" height="1016" alt="Screenshot 2025-09-30 011355" src="https://github.com/user-attachments/assets/2d0e50b1-124a-498f-80f4-123e99f81011" />
<img width="1216" height="1012" alt="Screenshot 2025-09-30 011410" src="https://github.com/user-attachments/assets/9e0d439b-ea4e-4341-a206-5a3490c0ffbe" />
<img width="1221" height="1015" alt="Screenshot 2025-09-30 011558" src="https://github.com/user-attachments/assets/c33d6842-5d9a-49a5-a8dd-cf1370ebef2e" />
<img width="1217" height="1022" alt="Screenshot 2025-09-30 011643" src="https://github.com/user-attachments/assets/2602adfa-0cf8-4b2d-be91-a73ec90cd4c5" />
<img width="1218" height="1011" alt="Screenshot 2025-09-30 011702" src="https://github.com/user-attachments/assets/1bc424db-076c-4a2c-8903-fbf1b4fdf54b" />
Jalankan di node yang melihat trafik (biasanya Eru atau link capture di GNS3)

## NO.7  
Untuk meningkatkan keamanan, Eru memutuskan untuk membuat sebuah FTP Server di node miliknya. Lakukan konfigurasi FTP Server pada node Eru. Buat dua user baru: ainur dengan hak akses write&read dan melkor tanpa hak akses sama sekali ke direktori shared. Buktikan hasil tersebut dengan membuat file teks sederhana kemudian akses file tersebut menggunakan kedua user.
<img width="1745" height="561" alt="Screenshot 2025-09-30 014705" src="https://github.com/user-attachments/assets/22a2db5f-b6b5-4113-8710-8fbf98aec569" />
<img width="831" height="535" alt="Screenshot 2025-09-30 015725" src="https://github.com/user-attachments/assets/6569532e-cf09-4ce5-a5ca-298924a614e8" />
<img width="1656" height="523" alt="Screenshot 2025-09-30 021250" src="https://github.com/user-attachments/assets/7b1b58a0-e74d-473e-99e7-47a34098f2e7" />
<img width="1919" height="1079" alt="Screenshot 2025-09-30 021849" src="https://github.com/user-attachments/assets/bca6de8d-b815-45fb-9d82-b1666825066f" />
Di Node Eru, jalankan Install & config vsftpd (/root/setup_vsftpd.sh),

```
apt-get install -y vsftpd
# create users
useradd -m -s /bin/bash ainur
echo "ainur:ainurpass" | chpasswd
useradd -m -s /bin/bash melkor
echo "melkor:melkorpass" | chpasswd
# prepare directory
mkdir -p /home/ainur/ftp/shared
chown -R ainur:ainur /home/ainur/ftp
chmod 750 /home/ainur
chmod 770 /home/ainur/ftp/shared
# vsftpd.conf minimal -> restart
```
Manwe, 
```
ftp 10.93.1.1
# Login as ainur:
Name (10.93.1.1:root): ainur
331 Please specify the password.
Password: (enter)
230 Login successful.
ftp> ls
drwxr-x---    2 1001     1001         4096 Sep 29 18:11 shared
```

## NO.8  
Ulmo, sebagai penjaga perairan, perlu mengirimkan data ramalan cuaca ke node Eru. Lakukan koneksi sebagai client dari node Ulmo ke FTP Server Eru menggunakan user ainur. Upload sebuah file berikut (link file). Analisis proses ini menggunakan Wireshark dan identifikasi perintah FTP yang digunakan untuk proses upload.
<img width="661" height="456" alt="Screenshot 2025-09-30 023434" src="https://github.com/user-attachments/assets/cda2be6c-4b64-43fd-b1a8-3bbbbad5937c" />
<img width="1222" height="1011" alt="Screenshot 2025-09-30 023657" src="https://github.com/user-attachments/assets/5e23445d-d0a1-48a0-9352-958717298b83" />
<img width="1212" height="1013" alt="Screenshot 2025-09-30 023718" src="https://github.com/user-attachments/assets/6de31b8f-e4a0-424a-b9df-cf6a0cb24ac5" />
<img width="1215" height="994" alt="Screenshot 2025-09-30 023745" src="https://github.com/user-attachments/assets/ba54973c-c050-4fd9-966f-6597f1c6fca3" />
<img width="1214" height="997" alt="Screenshot 2025-09-30 023802" src="https://github.com/user-attachments/assets/170c5aa3-8ba5-471c-ac9d-fe1483d75bc1" />
Ulmo,

```
# contoh upload
ftp 10.93.1.1
Name: ainur
Password: ainurpass
cd shared
put /root/ramalan_cuaca.txt
quit

```
Wireshark analysis:
```
Filter: ftp atau ip.addr==10.93.1.1 && ftp
Control channel shows:
USER ainur
PASS *****
CWD shared
STOR ramalan_cuaca.txt ← command for upload
Data channel: actual file transfer (PORT or PASV details)
```
## NO.9  
Eru ingin membagikan "Kitab Penciptaan" di (link file) kepada Manwe. Dari FTP Server Eru, download file tersebut ke node Manwe. Karena Eru merasa Kitab tersebut sangat penting maka ia mengubah akses user ainur menjadi read-only. Gunakan Wireshark untuk memonitor koneksi, identifikasi perintah FTP yang digunakan, dan uji akses user ainur.  
<img width="1665" height="529" alt="Screenshot 2025-09-30 024612" src="https://github.com/user-attachments/assets/35cc4731-a753-4b50-aa1c-d9367716ea2d" />
<img width="1214" height="985" alt="Screenshot 2025-09-30 024710" src="https://github.com/user-attachments/assets/2f294c0b-a8fb-4685-a854-c1ebb9c9f35e" />
<img width="1211" height="987" alt="Screenshot 2025-09-30 024737" src="https://github.com/user-attachments/assets/79cf4ee2-8d25-4298-ba67-30a31df69942" />
<img width="1663" height="532" alt="Screenshot 2025-09-30 025226" src="https://github.com/user-attachments/assets/247e3761-79ac-4661-85a5-366c2ebc12b8" />
<img width="1655" height="526" alt="Screenshot 2025-09-30 025506" src="https://github.com/user-attachments/assets/572312e8-dda9-4473-8d47-925154e30d22" />
Letakkan file kitab_penciptaan.txt di /home/ainur/ftp/shared (Eru). Dari Manwe,

```
ftp 10.93.1.1
user ainur ainurpass
cd shared
get kitab_penciptaan.txt

```

## NO.10  
Melkor yang marah karena tidak diberi akses, mencoba melakukan serangan dengan mengirimkan banyak sekali request ke server Eru. Gunakan command ping dari node Melkor ke node Eru dengan jumlah paket yang tidak biasa (spam ping misalnya 100 paket). Amati hasilnya, apakah ada packet loss? Catat average round trip time untuk melihat apakah serangan tersebut mempengaruhi kinerja Eru.  
<img width="822" height="519" alt="Screenshot 2025-09-30 030512" src="https://github.com/user-attachments/assets/cdf980fb-7f4e-41aa-89e9-d2225cb612fc" />
<img width="1201" height="977" alt="Screenshot 2025-09-30 030633" src="https://github.com/user-attachments/assets/6d4268e4-898b-4e07-bc3c-e506a976eed6" />
Melkor : 

``ping -c 100 10.93.1.1 | tee /root/captures/melkor_spam_ping.txt``

## NO.11  
Sebelum era koneksi aman, Eru sering menyelinap masuk ke wilayah Melkor. Eru perlu masuk ke node tersebut untuk memeriksa konfigurasi, namun ia tahu Melkor mungkin sedang memantau jaringan. Buktikan kelemahan protokol Telnet dengan membuat akun dan password baru di node Melkor kemudian menangkap sesi login Eru ke node Melkor menggunakan Wireshark. Tunjukkan bagaimana username dan password dapat terlihat sebagai plain text.
<img width="1643" height="513" alt="Screenshot 2025-09-30 032730" src="https://github.com/user-attachments/assets/a2e6aeab-47e7-4be0-bdee-c7c1e10b2879" />
<img width="1297" height="1024" alt="Screenshot 2025-09-30 032621" src="https://github.com/user-attachments/assets/f3b49e21-ed06-4d4f-b787-7c9751ed1125" />
<img width="1335" height="1024" alt="image" src="https://github.com/user-attachments/assets/476626af-4559-4a0c-9df1-6cb7785b3aa0" />

## NO.12  
Eru mencurigai Melkor menjalankan beberapa layanan terlarang di node-nya. Lakukan pemindaian port sederhana dari node Eru ke node Melkor menggunakan Netcat (nc) untuk memeriksa port 21, 80, dalam keadaan terbuka dan port rahasia 666 dalam keadaan tertutup.  
<img width="818" height="516" alt="Screenshot 2025-09-30 033115" src="https://github.com/user-attachments/assets/6e378291-0242-4bd6-a21a-602a86f5e358" />
<img width="1650" height="523" alt="Screenshot 2025-09-30 033359" src="https://github.com/user-attachments/assets/1aee7631-507f-4212-bde0-23fe04ae51db" />

## NO.13  
Setelah insiden penyadapan Telnet, Eru memerintahkan semua koneksi administratif harus menggunakan SSH (Secure Shell) untuk mengamankan jaringan. Lakukan koneksi SSH dari node Varda ke Eru. Tangkap sesi tersebut menggunakan Wireshark. Analisis dan jelaskan mengapa username dan password tidak dapat dilihat seperti pada sesi Telnet. Tunjukkan paket-paket terenkripsi dalam hasil capture sebagai bukti keamanan SSH.
<img width="813" height="524" alt="Screenshot 2025-09-30 040131" src="https://github.com/user-attachments/assets/a5467308-520f-4f36-a0b8-458db956dbfe" />
<img width="1217" height="991" alt="Screenshot 2025-09-30 040052" src="https://github.com/user-attachments/assets/d1988fa4-4653-49ec-a9e4-8b96316fa2d1" />

## NO.14
Setelah gagal mengakses FTP, Melkor melancarkan serangan brute force terhadap  Manwe. Analisis file capture yang disediakan dan identifikasi upaya brute force Melkor. 
(https://drive.google.com/drive/folders/13rf0AlzUrkNhUWbBNt9tIVSimw3njKqd?usp=sharing) `nc 10.15.43.32 3401`
<img width="1919" height="1079" alt="Screenshot 2025-09-30 192308" src="https://github.com/user-attachments/assets/b6e28cd0-4540-4e62-8759-47bbf9fb9e04" />

## NO.15
Melkor menyusup ke ruang server dan memasang keyboard USB berbahaya pada node Manwe. Buka file capture dan identifikasi pesan atau ketikan (keystrokes) yang berhasil dicuri oleh Melkor untuk menemukan password rahasia.
(https://drive.google.com/drive/folders/1aHSRMoEgQBsA-4I2wWatFxAy3laumcgb?usp=sharing) `nc 10.15.43.32 3402`
<img width="1479" height="768" alt="Screenshot 2025-09-30 221443" src="https://github.com/user-attachments/assets/4782bcab-ce28-41ef-bc91-2a1dac3a55f8" />

## NO.16
Melkor semakin murka ia meletakkan file berbahaya di server milik Manwe. Dari file capture yang ada, identifikasi file apa yang diletakkan oleh Melkor.
(https://drive.google.com/drive/folders/1aJf_PQGXwr4fxd79df8nd7NzL7SsN6U9?usp=sharing) `nc 10.15.43.32 3403`
<img width="1919" height="1079" alt="Screenshot 2025-09-30 192308" src="https://github.com/user-attachments/assets/091ce92b-5381-44d6-86b0-7a5872041df6" />

## NO.17 
Manwe membuat halaman web di node-nya yang menampilkan gambar cincin agung. Melkor yang melihat web tersebut merasa iri sehingga ia meletakkan file berbahaya agar web tersebut dapat dianggap menyebarkan malware oleh Eru. Analisis file capture untuk menggagalkan rencana Melkor dan menyelamatkan web Manwe.
(https://drive.google.com/drive/folders/10UNx8BhvbyCDhHGHS7D7zmyvFbCf41ze?usp=sharing) `nc 10.15.43.32 3404`
<img width="1463" height="694" alt="Screenshot 2025-10-01 142929" src="https://github.com/user-attachments/assets/50bc27d0-8e4a-489e-b05c-0530c9719266" />
<img width="943" height="675" alt="Screenshot 2025-10-01 142939" src="https://github.com/user-attachments/assets/5cda9ea0-4a8f-4cdc-8ed1-548312f68026" />
<img width="1391" height="754" alt="Screenshot 2025-10-01 142949" src="https://github.com/user-attachments/assets/23aa5fba-6b58-419d-b1b2-381657b2933f" />

## NO.18
Karena rencana Melkor yang terus gagal, ia akhirnya berhenti sejenak untuk berpikir. Pada saat berpikir ia akhirnya memutuskan untuk membuat rencana jahat lainnya dengan meletakkan file berbahaya lagi tetapi dengan metode yang berbeda. Gagalkan lagi rencana Melkor dengan mengidentifikasi file capture yang disediakan agar dunia tetap aman.
(https://drive.google.com/drive/folders/1R4-D1WnsDVrT73UlkacjY0Ntag42AFUy?usp=sharing) `nc 10.15.43.32 3405`
<img width="952" height="1018" alt="Screenshot 2025-10-01 172912" src="https://github.com/user-attachments/assets/24d6d462-7267-4060-b519-eaa94130d67c" />
<img width="935" height="695" alt="Screenshot 2025-10-01 144916" src="https://github.com/user-attachments/assets/fe554f07-bf0a-4b80-9627-5aa9d527bfaf" />

## NO.19
Manwe mengirimkan email berisi surat cinta kepada Varda melalui koneksi yang tidak terenkripsi. Melihat hal itu Melkor sipaling jahat langsung melancarkan aksinya yaitu meneror Varda dengan email yang disamarkan. Analisis file capture jaringan dan gagalkan lagi rencana busuk Melkor.
(https://drive.google.com/drive/folders/1D6d8EYdIvE8UF_i4Ms0C7Yakd9j0GYBN?usp=sharing) `nc 10.15.43.32 3406`
<img width="914" height="436" alt="Screenshot 2025-10-01 173837" src="https://github.com/user-attachments/assets/3730b956-93cb-46d7-95eb-033d5c8c15ed" />
<img width="1007" height="767" alt="Screenshot 2025-10-01 173353" src="https://github.com/user-attachments/assets/7b99a7a2-cf13-46a5-a513-7f9328008879" />
<img width="934" height="1008" alt="Screenshot 2025-10-01 173711" src="https://github.com/user-attachments/assets/824233fc-18d4-4453-b436-f930274ff28b" />
<img width="546" height="178" alt="Screenshot 2025-10-01 173814" src="https://github.com/user-attachments/assets/4444317f-d761-4e88-85f1-fad0281559a2" />

## NO.20
Untuk yang terakhir kalinya, rencana besar Melkor yaitu menanamkan sebuah file berbahaya kemudian menyembunyikannya agar tidak terlihat oleh Eru. Tetapi Manwe yang sudah merasakan adanya niat jahat dari Melkor, ia menyisipkan bantuan untuk mengungkapkan rencana Melkor. Analisis file capture dan identifikasi kegunaan bantuan yang diberikan oleh Manwe untuk menggagalkan rencana jahat Melkor selamanya.
(https://drive.google.com/drive/folders/1wOe76_DgH087tAaHH_jxsHCinwFv9pmT?usp=sharing) `nc 10.15.43.32 3407`
<img width="948" height="534" alt="Screenshot 2025-10-01 174911" src="https://github.com/user-attachments/assets/092d114f-0652-49b2-8ff6-a863999ad538" />
<img width="1036" height="948" alt="Screenshot 2025-10-01 174151" src="https://github.com/user-attachments/assets/3d0652cf-9918-4d2d-8beb-45ea872cc116" />
<img width="1044" height="952" alt="Screenshot 2025-10-01 174209" src="https://github.com/user-attachments/assets/4560e5e6-0ab9-4485-92e6-a2f5826e7fc0" />
