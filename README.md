# SOAL 1

1. Sketsa Layout

Halaman utama aplikasi dirancang menggunakan struktur widget Flutter yang sederhana dan mudah dipahami.

Susunan layout yang digunakan adalah:

Scaffold sebagai kerangka utama halaman
AppBar sebagai judul aplikasi
ListView.builder untuk menampilkan daftar workshop secara dinamis
Setiap item workshop ditampilkan menggunakan Card
Di dalam Card digunakan Column untuk menyusun informasi secara vertikal, yaitu:
Judul workshop
Tanggal
Lokasi
Kuota (dengan progress indicator)
Tombol daftar

2. Alasan Pemilihan Widget

Pemilihan widget dilakukan untuk menyesuaikan kebutuhan tampilan yang bersifat list dan dinamis. ListView.builder digunakan karena data workshop dapat bertambah dan membutuhkan rendering yang efisien. Card dipilih agar setiap data workshop memiliki pemisah visual yang jelas sehingga tidak terlihat penuh atau menumpuk. Column digunakan untuk menyusun informasi secara vertikal agar lebih mudah dibaca, sedangkan Text digunakan untuk menampilkan informasi utama. ElevatedButton digunakan sebagai aksi utama untuk pendaftaran, dan LinearProgressIndicator digunakan untuk memberikan visualisasi kuota agar lebih mudah dipahami oleh pengguna.

3. 2 Kesalahan UI yang Dihindari

Tampilan terlalu padat tanpa pemisah

Hal ini dihindari dengan penggunaan Card dan spacing agar setiap workshop terlihat terpisah dengan jelas.

Tidak adanya hirarki informasi

Tanpa perbedaan ukuran dan penekanan teks, pengguna akan kesulitan membedakan informasi utama dan pendukung. Oleh karena itu, judul dibuat lebih menonjol dibandingkan detail lainnya.

4. Penjelasan UX (User Experience)

Desain aplikasi dibuat agar pengguna dapat dengan mudah memahami informasi tanpa perlu membaca terlalu lama. Penggunaan Card membantu memisahkan setiap workshop sehingga tampilan tidak terasa penuh. Selain itu, penggunaan padding dan margin memberikan ruang antar elemen agar lebih nyaman dilihat. Progress bar digunakan untuk memberikan gambaran kuota secara visual, sehingga pengguna dapat langsung mengetahui ketersediaan tanpa harus membaca angka secara detail. Secara keseluruhan, desain dibuat sederhana, bersih, dan mudah dipindai agar pengalaman pengguna lebih nyaman.