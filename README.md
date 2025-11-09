# Tugas 7

## Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget?

Dalam Flutter, seluruh tampilan antarmuka pengguna dibangun menggunakan elemen yang disebut widget, yang tersusun secara hierarkis membentuk struktur bernama widget tree atau pohon widget. Setiap widget, mulai dari teks, tombol, hingga tata letak seperti Row dan Column, memiliki peran tertentu dalam membentuk tampilan aplikasi. Struktur pohon ini memungkinkan Flutter untuk mengatur dan menggambar ulang antarmuka dengan efisien, karena hanya bagian dari pohon yang berubah saja yang akan diperbarui saat terjadi interaksi atau perubahan data. Dengan pendekatan ini, Flutter mampu menampilkan UI yang halus, responsif, dan hemat sumber daya.

Hubungan antara widget dalam widget tree disebut hubungan parent–child (induk–anak). Widget induk berperan mengatur posisi, ukuran, dan gaya dari widget anak, sedangkan widget anak menampilkan konten atau fungsi spesifiknya. Misalnya, Center sebagai induk menempatkan Text sebagai anak tepat di tengah layar. Pola hubungan ini menciptakan sistem UI yang modular, mudah dikembangkan, dan terstruktur dengan baik. Dengan memahami bagaimana hubungan induk–anak bekerja, pengembang dapat membangun antarmuka Flutter yang rapi, efisien, dan mudah dikelola.

---

## Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.

Dalam proyek Flutter yang saya buat ini, saya menggunakan beberapa widget utama untuk membangun struktur dan tampilan aplikasi. Widget pertama yang saya gunakan adalah MaterialApp, yang berfungsi sebagai root widget dari seluruh aplikasi saya. Melalui MaterialApp, saya dapat mengatur tema warna, judul aplikasi, serta menentukan halaman awal yang akan ditampilkan ketika aplikasi dijalankan. Di dalamnya, saya menggunakan Scaffold sebagai kerangka dasar halaman. Widget ini membantu saya menambahkan AppBar di bagian atas, area body di tengah untuk konten utama, dan ruang untuk komponen tambahan seperti SnackBar atau FloatingActionButton. Dengan adanya Scaffold, tampilan halaman saya menjadi lebih teratur dan mengikuti standar Material Design yang digunakan Flutter.

Selain itu, saya menggunakan AppBar untuk menampilkan judul aplikasi di bagian atas layar agar pengguna dapat mengetahui konteks halaman yang sedang dibuka. Untuk mengatur tata letak elemen-elemen di halaman, saya memanfaatkan Column untuk menata widget secara vertikal dan Row untuk menyusun elemen secara horizontal, misalnya menampilkan data seperti NPM, nama, dan kelas saya. Widget Card saya gunakan untuk membungkus informasi tersebut agar tampak seperti kotak dengan bayangan lembut yang membuat tampilannya lebih menarik. Sementara itu, GridView.count saya pakai untuk menampilkan beberapa menu dalam bentuk grid tiga kolom sehingga tampil lebih rapi dan mudah dilihat. Setiap menu saya tampilkan dalam bentuk ItemCard, yang saya bungkus dengan Material dan InkWell agar dapat memberikan efek sentuhan serta menjalankan aksi ketika ditekan. Melalui kombinasi seluruh widget ini, saya berhasil membangun aplikasi yang terstruktur, responsif, dan memiliki tampilan antarmuka yang menarik serta mudah digunakan.

---

## Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.

Widget MaterialApp dalam Flutter berfungsi sebagai wadah utama yang menyediakan konfigurasi dasar dan struktur untuk aplikasi berbasis Material Design. Ia mengatur berbagai aspek penting seperti tema warna, navigasi antarhalaman (routes), judul aplikasi, font, hingga pengaturan locale dan debug banner. Dengan menggunakan MaterialApp, pengembang tidak perlu lagi menulis ulang elemen-elemen standar seperti efek animasi tombol, tampilan AppBar, atau gaya visual khas Android karena semuanya sudah disediakan oleh kerangka Material Design yang terintegrasi di dalamnya.

Widget ini hampir selalu digunakan sebagai widget root (paling atas) karena menjadi titik awal dari keseluruhan struktur antarmuka aplikasi. MaterialApp membungkus seluruh widget tree dan menyediakan konteks global yang memungkinkan widget lain di bawahnya mengakses tema, navigator, serta konfigurasi aplikasi. Tanpa MaterialApp, banyak widget seperti Scaffold, AppBar, atau SnackBar tidak dapat berfungsi dengan benar karena mereka membutuhkan konteks Material Design yang hanya disediakan oleh MaterialApp. Oleh karena itu, MaterialApp dianggap sebagai fondasi utama bagi aplikasi Flutter yang mengikuti prinsip desain modern dan konsisten di berbagai perangkat.

---

## Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?

Perbedaan utama antara StatelessWidget dan StatefulWidget terletak pada kemampuan keduanya dalam menangani perubahan data atau keadaan (state) selama aplikasi berjalan. StatelessWidget adalah widget yang bersifat statis, artinya tampilan dan datanya tidak akan berubah setelah pertama kali dibangun. Widget ini hanya menampilkan data yang sudah tetap, dan jika ada perubahan, maka seluruh widget harus diganti atau dibangun ulang dari luar. Contoh penggunaannya adalah elemen seperti teks, ikon, atau tombol yang tidak berubah-ubah tampilannya, misalnya Text('Hello World') atau Icon(Icons.home).

Sebaliknya, StatefulWidget digunakan ketika tampilan atau data pada widget dapat berubah seiring waktu atau akibat interaksi pengguna. Widget ini memiliki objek state yang menyimpan data yang dapat diperbarui tanpa harus membangun ulang seluruh struktur widget. Ketika data dalam state berubah, Flutter akan memanggil ulang fungsi build() untuk memperbarui tampilan. Contoh penerapannya adalah pada form input, penghitung angka (counter), atau tampilan yang berubah karena aksi pengguna seperti menekan tombol atau memuat data dari internet.

Secara sederhana, StatelessWidget digunakan ketika tampilan bersifat tetap, sedangkan StatefulWidget dipilih ketika aplikasi membutuhkan pembaruan dinamis. Memilih di antara keduanya bergantung pada apakah data yang ditampilkan dapat berubah selama aplikasi berjalan.

---

## Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?

BuildContext adalah objek penting dalam Flutter yang berfungsi untuk menghubungkan sebuah widget dengan posisi dan lingkungan tempatnya berada di dalam widget tree. Melalui BuildContext, widget dapat mengakses informasi yang disediakan oleh widget lain di atasnya, seperti tema aplikasi, ukuran layar, atau sistem navigasi. Setiap widget memiliki konteksnya sendiri, dan konteks tersebut memungkinkan interaksi yang efisien antarwidget tanpa harus saling mengetahui detail implementasinya. Dengan kata lain, BuildContext membantu Flutter memahami “di mana” sebuah widget berada dan bagaimana ia seharusnya ditampilkan dalam keseluruhan struktur aplikasi.

Dalam metode build(), BuildContext digunakan untuk membangun tampilan yang sesuai dengan kondisi atau tema aplikasi saat ini. Misalnya, dengan Theme.of(context) widget dapat mengambil gaya warna yang digunakan aplikasi, atau dengan Navigator.of(context) dapat berpindah ke halaman lain. Tanpa BuildContext, widget tidak akan mampu berkomunikasi dengan sistem di atasnya dan kehilangan kemampuan untuk menyesuaikan diri dengan perubahan lingkungan. Oleh karena itu, BuildContext menjadi elemen krusial dalam proses rendering dan interaksi antarkomponen di Flutter.

---

## Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".

Konsep hot reload dalam Flutter adalah fitur yang memungkinkan pengembang melihat hasil perubahan kode secara langsung tanpa perlu menghentikan dan menjalankan ulang seluruh aplikasi. Ketika pengembang menyimpan perubahan pada file Dart, Flutter hanya memperbarui bagian kode yang diubah dan menyuntikkannya ke dalam aplikasi yang sedang berjalan. Dengan demikian, tampilan antarmuka (UI) dapat berubah secara instan tanpa kehilangan state atau kondisi terakhir aplikasi. Fitur ini sangat membantu dalam proses pengembangan karena mempercepat iterasi, terutama saat menyempurnakan desain tampilan, memperbaiki bug kecil, atau menyesuaikan logika antarmuka pengguna.

Berbeda dengan hot reload, fitur hot restart akan memulai ulang seluruh aplikasi dari awal, menghapus seluruh state yang sedang aktif. Artinya, semua data atau posisi terakhir yang disimpan dalam StatefulWidget akan hilang, dan aplikasi akan kembali ke kondisi awal seperti saat pertama kali dijalankan. Meskipun prosesnya tetap lebih cepat dibandingkan menjalankan ulang aplikasi sepenuhnya (full restart), hot restart digunakan ketika perubahan kode memengaruhi struktur utama aplikasi, seperti pada inisialisasi variabel global, konfigurasi awal, atau perubahan pada fungsi utama (main function). Dengan kata lain, hot reload mempertahankan keadaan aplikasi untuk efisiensi pengembangan antarmuka, sedangkan hot restart digunakan ketika perubahan yang dilakukan membutuhkan pemuatan ulang total agar berjalan dengan benar.


---
# Tugas 8

## Perbedaan antara Navigator.push() dan Navigator.pushReplacement()

Navigator.push() dan Navigator.pushReplacement() sama-sama digunakan untuk berpindah antarhalaman, tetapi berbeda dalam cara mengelola stack halaman. Navigator.push() menambahkan halaman baru di atas halaman saat ini tanpa menghapus halaman sebelumnya. Dengan begitu, pengguna masih bisa kembali ke halaman sebelumnya menggunakan tombol “back”. Sebaliknya, Navigator.pushReplacement() menggantikan halaman saat ini dengan halaman baru, sehingga halaman sebelumnya dihapus dari stack dan tidak bisa dikembalikan lagi.

Dalam aplikasi Football Shop, Navigator.push() digunakan ketika pengguna menekan tombol “Add Product” dari halaman utama atau dari menu drawer. Hal ini memungkinkan pengguna untuk kembali ke halaman utama setelah selesai menambahkan produk. Sedangkan Navigator.pushReplacement() digunakan saat pengguna memilih menu “Home” di Drawer. Tujuannya agar halaman utama menggantikan halaman lain di stack dan navigasi tidak menumpuk, menjaga alur aplikasi tetap bersih dan efisien.

---

## Pemanfaatan hierarchy widget seperti Scaffold, AppBar, dan Drawer

Aplikasi Football Shop memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk menciptakan struktur halaman yang konsisten di seluruh aplikasi. Scaffold menjadi kerangka utama setiap halaman, menyediakan area khusus untuk app bar, body, dan drawer. Dengan pola ini, setiap halaman seperti MyHomePage dan ProductFormPage memiliki tata letak yang rapi dan seragam.

AppBar digunakan untuk menampilkan judul halaman dan warna tema utama, seperti “Af Classico”, yang memberikan identitas visual yang konsisten di bagian atas layar. Sedangkan Drawer berfungsi sebagai navigasi samping dengan dua menu utama “Home” dan “Add Product”. Dengan struktur ini, pengguna dapat berpindah antarhalaman dengan mudah tanpa kehilangan konteks, sekaligus menjaga pengalaman pengguna yang familiar dan intuitif di seluruh aplikasi.

--

## Kelebihan menggunakan Padding, SingleChildScrollView, dan ListView

Widget seperti Padding, SingleChildScrollView, dan ListView sangat membantu dalam mengatur tata letak form agar tetap nyaman digunakan di berbagai ukuran layar. Padding digunakan untuk memberi jarak antar-elemen input seperti nama produk, harga, dan deskripsi sehingga tampilan lebih rapi dan tidak menempel satu sama lain. Sementara itu, SingleChildScrollView memungkinkan pengguna menggulir seluruh halaman form ketika tinggi layar tidak cukup, sehingga tidak ada bagian form yang tersembunyi di balik keyboard.

Pada file productlist_form.dart, kombinasi antara Form, Column, dan SingleChildScrollView digunakan untuk menampilkan seluruh elemen input dengan tata letak vertikal yang fleksibel. Pendekatan ini membuat tampilan form tetap proporsional dan responsif di berbagai perangkat. ListView juga bisa digunakan untuk menampung daftar produk secara dinamis, memastikan elemen-elemen dapat ditampilkan dengan scrolling yang lancar dan efisien.

---

## Penyesuaian warna tema agar konsisten dengan brand

Penyesuaian warna tema pada aplikasi Football Shop dilakukan dengan memanfaatkan ThemeData dan ColorScheme di file main.dart. Warna biru dijadikan warna utama (primary color) dan diterapkan secara konsisten pada elemen penting seperti AppBar, tombol Save, dan ikon utama. Selain itu, digunakan juga ColorScheme.fromSeed(seedColor: Colors.blue) untuk menghasilkan palet warna turunan yang tetap harmonis di seluruh komponen aplikasi.

Konsistensi warna ini membantu memperkuat identitas visual brand Football Shop yang modern dan sporty. Dengan tema warna yang sama di seluruh halaman — mulai dari halaman utama hingga halaman form tambah produk - pengguna mendapatkan pengalaman visual yang seragam dan profesional. Pendekatan ini tidak hanya meningkatkan estetika aplikasi, tetapi juga memperkuat pengenalan merek melalui warna khas yang mudah diingat.
