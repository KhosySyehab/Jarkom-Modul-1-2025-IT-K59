# Jarkom-Modul-1-2025-IT-K59


## NO.1

## NO.2

## NO.3

## NO.4
<img width="1725" height="884" alt="Screenshot 2025-09-30 010243" src="https://github.com/user-attachments/assets/b5caaec6-d6ab-4a50-a9de-29e6f62520c6" />

## NO.5

## NO.6 
Setelah semua Ainur terhubung ke internet, Melkor mencoba menyusup ke dalam komunikasi antara Manwe dan Eru. Jalankan file berikut (link file) lalu lakukan packet sniffing menggunakan Wireshark pada koneksi antara Manwe dan Eru, lalu terapkan display filter untuk menampilkan semua paket yang berasal dari atau menuju ke IP Address Manwe. Simpan hasil capture tersebut sebagai bukti.
  
<img width="1215" height="1016" alt="Screenshot 2025-09-30 011339" src="https://github.com/user-attachments/assets/380de2fc-65b6-4a1a-a387-e542b7842cdf" />
<img width="1219" height="1016" alt="Screenshot 2025-09-30 011355" src="https://github.com/user-attachments/assets/2d0e50b1-124a-498f-80f4-123e99f81011" />
<img width="1216" height="1012" alt="Screenshot 2025-09-30 011410" src="https://github.com/user-attachments/assets/9e0d439b-ea4e-4341-a206-5a3490c0ffbe" />
<img width="1221" height="1015" alt="Screenshot 2025-09-30 011558" src="https://github.com/user-attachments/assets/c33d6842-5d9a-49a5-a8dd-cf1370ebef2e" />
<img width="1217" height="1022" alt="Screenshot 2025-09-30 011643" src="https://github.com/user-attachments/assets/2602adfa-0cf8-4b2d-be91-a73ec90cd4c5" />
<img width="1218" height="1011" alt="Screenshot 2025-09-30 011702" src="https://github.com/user-attachments/assets/1bc424db-076c-4a2c-8903-fbf1b4fdf54b" />

## NO.7  
Untuk meningkatkan keamanan, Eru memutuskan untuk membuat sebuah FTP Server di node miliknya. Lakukan konfigurasi FTP Server pada node Eru. Buat dua user baru: ainur dengan hak akses write&read dan melkor tanpa hak akses sama sekali ke direktori shared. Buktikan hasil tersebut dengan membuat file teks sederhana kemudian akses file tersebut menggunakan kedua user.  
  
<img width="1745" height="561" alt="Screenshot 2025-09-30 014705" src="https://github.com/user-attachments/assets/22a2db5f-b6b5-4113-8710-8fbf98aec569" />
<img width="831" height="535" alt="Screenshot 2025-09-30 015725" src="https://github.com/user-attachments/assets/6569532e-cf09-4ce5-a5ca-298924a614e8" />
<img width="1656" height="523" alt="Screenshot 2025-09-30 021250" src="https://github.com/user-attachments/assets/7b1b58a0-e74d-473e-99e7-47a34098f2e7" />
<img width="1919" height="1079" alt="Screenshot 2025-09-30 021849" src="https://github.com/user-attachments/assets/bca6de8d-b815-45fb-9d82-b1666825066f" />

## NO.8  
Ulmo, sebagai penjaga perairan, perlu mengirimkan data ramalan cuaca ke node Eru. Lakukan koneksi sebagai client dari node Ulmo ke FTP Server Eru menggunakan user ainur. Upload sebuah file berikut (link file). Analisis proses ini menggunakan Wireshark dan identifikasi perintah FTP yang digunakan untuk proses upload.  
  
<img width="661" height="456" alt="Screenshot 2025-09-30 023434" src="https://github.com/user-attachments/assets/cda2be6c-4b64-43fd-b1a8-3bbbbad5937c" />
<img width="1222" height="1011" alt="Screenshot 2025-09-30 023657" src="https://github.com/user-attachments/assets/5e23445d-d0a1-48a0-9352-958717298b83" />
<img width="1212" height="1013" alt="Screenshot 2025-09-30 023718" src="https://github.com/user-attachments/assets/6de31b8f-e4a0-424a-b9df-cf6a0cb24ac5" />
<img width="1215" height="994" alt="Screenshot 2025-09-30 023745" src="https://github.com/user-attachments/assets/ba54973c-c050-4fd9-966f-6597f1c6fca3" />
<img width="1214" height="997" alt="Screenshot 2025-09-30 023802" src="https://github.com/user-attachments/assets/170c5aa3-8ba5-471c-ac9d-fe1483d75bc1" />

## NO.9  
Eru ingin membagikan "Kitab Penciptaan" di (link file) kepada Manwe. Dari FTP Server Eru, download file tersebut ke node Manwe. Karena Eru merasa Kitab tersebut sangat penting maka ia mengubah akses user ainur menjadi read-only. Gunakan Wireshark untuk memonitor koneksi, identifikasi perintah FTP yang digunakan, dan uji akses user ainur.  
  
<img width="1665" height="529" alt="Screenshot 2025-09-30 024612" src="https://github.com/user-attachments/assets/35cc4731-a753-4b50-aa1c-d9367716ea2d" />
<img width="1214" height="985" alt="Screenshot 2025-09-30 024710" src="https://github.com/user-attachments/assets/2f294c0b-a8fb-4685-a854-c1ebb9c9f35e" />
<img width="1211" height="987" alt="Screenshot 2025-09-30 024737" src="https://github.com/user-attachments/assets/79cf4ee2-8d25-4298-ba67-30a31df69942" />
<img width="1663" height="532" alt="Screenshot 2025-09-30 025226" src="https://github.com/user-attachments/assets/247e3761-79ac-4661-85a5-366c2ebc12b8" />
<img width="1655" height="526" alt="Screenshot 2025-09-30 025506" src="https://github.com/user-attachments/assets/572312e8-dda9-4473-8d47-925154e30d22" />

## NO.10  
Melkor yang marah karena tidak diberi akses, mencoba melakukan serangan dengan mengirimkan banyak sekali request ke server Eru. Gunakan command ping dari node Melkor ke node Eru dengan jumlah paket yang tidak biasa (spam ping misalnya 100 paket). Amati hasilnya, apakah ada packet loss? Catat average round trip time untuk melihat apakah serangan tersebut mempengaruhi kinerja Eru.  
  
<img width="822" height="519" alt="Screenshot 2025-09-30 030512" src="https://github.com/user-attachments/assets/cdf980fb-7f4e-41aa-89e9-d2225cb612fc" />
<img width="1201" height="977" alt="Screenshot 2025-09-30 030633" src="https://github.com/user-attachments/assets/6d4268e4-898b-4e07-bc3c-e506a976eed6" />

## NO.11  
Sebelum era koneksi aman, Eru sering menyelinap masuk ke wilayah Melkor. Eru perlu masuk ke node tersebut untuk memeriksa konfigurasi, namun ia tahu Melkor mungkin sedang memantau jaringan. Buktikan kelemahan protokol Telnet dengan membuat akun dan password baru di node Melkor kemudian menangkap sesi login Eru ke node Melkor menggunakan Wireshark. Tunjukkan bagaimana username dan password dapat terlihat sebagai plain text.
  
<img width="1643" height="513" alt="Screenshot 2025-09-30 032730" src="https://github.com/user-attachments/assets/a2e6aeab-47e7-4be0-bdee-c7c1e10b2879" />
<img width="1297" height="1024" alt="Screenshot 2025-09-30 032621" src="https://github.com/user-attachments/assets/f3b49e21-ed06-4d4f-b787-7c9751ed1125" />
<img width="1335" height="1024" alt="image" src="https://github.com/user-attachments/assets/476626af-4559-4a0c-9df1-6cb7785b3aa0" />

## NO.12  
Eru mencurigai Melkor menjalankan beberapa layanan terlarang di node-nya. Lakukan pemindaian port sederhana dari node Eru ke node Melkor menggunakan Netcat (nc) untuk memeriksa port 21, 80, dalam keadaan terbuka dan port rahasia 666 dalam keadaan tertutup.  
  
<img width="818" height="516" alt="Screenshot 2025-09-30 033115" src="https://github.com/user-attachments/assets/6e378291-0242-4bd6-a21a-602a86f5e358" />
<img width="1650" height="523" alt="Screenshot 2025-09-30 033359" src="https://github.com/user-attachments/assets/1aee7631-507f-4212-bde0-23fe04ae51db" />

NO.13  
Setelah insiden penyadapan Telnet, Eru memerintahkan semua koneksi administratif harus menggunakan SSH (Secure Shell) untuk mengamankan jaringan. Lakukan koneksi SSH dari node Varda ke Eru. Tangkap sesi tersebut menggunakan Wireshark. Analisis dan jelaskan mengapa username dan password tidak dapat dilihat seperti pada sesi Telnet. Tunjukkan paket-paket terenkripsi dalam hasil capture sebagai bukti keamanan SSH.  
  
<img width="813" height="524" alt="Screenshot 2025-09-30 040131" src="https://github.com/user-attachments/assets/a5467308-520f-4f36-a0b8-458db956dbfe" />
<img width="1217" height="991" alt="Screenshot 2025-09-30 040052" src="https://github.com/user-attachments/assets/d1988fa4-4653-49ec-a9e4-8b96316fa2d1" />

## NO.17 
<img width="1463" height="694" alt="Screenshot 2025-10-01 142929" src="https://github.com/user-attachments/assets/50bc27d0-8e4a-489e-b05c-0530c9719266" />
<img width="943" height="675" alt="Screenshot 2025-10-01 142939" src="https://github.com/user-attachments/assets/5cda9ea0-4a8f-4cdc-8ed1-548312f68026" />
<img width="1391" height="754" alt="Screenshot 2025-10-01 142949" src="https://github.com/user-attachments/assets/23aa5fba-6b58-419d-b1b2-381657b2933f" />

## NO.18
<img width="952" height="1018" alt="Screenshot 2025-10-01 172912" src="https://github.com/user-attachments/assets/24d6d462-7267-4060-b519-eaa94130d67c" />
<img width="935" height="695" alt="Screenshot 2025-10-01 144916" src="https://github.com/user-attachments/assets/fe554f07-bf0a-4b80-9627-5aa9d527bfaf" />

## NO.19
<img width="914" height="436" alt="Screenshot 2025-10-01 173837" src="https://github.com/user-attachments/assets/3730b956-93cb-46d7-95eb-033d5c8c15ed" />
<img width="1007" height="767" alt="Screenshot 2025-10-01 173353" src="https://github.com/user-attachments/assets/7b99a7a2-cf13-46a5-a513-7f9328008879" />
<img width="934" height="1008" alt="Screenshot 2025-10-01 173711" src="https://github.com/user-attachments/assets/824233fc-18d4-4453-b436-f930274ff28b" />
<img width="546" height="178" alt="Screenshot 2025-10-01 173814" src="https://github.com/user-attachments/assets/4444317f-d761-4e88-85f1-fad0281559a2" />
## NO.20
<img width="948" height="534" alt="Screenshot 2025-10-01 174911" src="https://github.com/user-attachments/assets/092d114f-0652-49b2-8ff6-a863999ad538" />
<img width="1036" height="948" alt="Screenshot 2025-10-01 174151" src="https://github.com/user-attachments/assets/3d0652cf-9918-4d2d-8beb-45ea872cc116" />
<img width="1044" height="952" alt="Screenshot 2025-10-01 174209" src="https://github.com/user-attachments/assets/4560e5e6-0ab9-4485-92e6-a2f5826e7fc0" />

