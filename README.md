# Personal Portfolio App

A personal portfolio mobile application built with **Flutter** to showcase my profile, projects, and experiences, and achievements in one place.

## Getting Started

### Prerequisites

Make sure you have installed:

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- [Dart SDK](https://dart.dev/get-dart)
- Android Studio or Visual Studio Code
- An Android emulator or physical device

### Installation

1. Clone this repository:

```bash
git clone https://github.com/yourusername/personal-portfolio-app.git
```

2. Navigate to the project directory:

```bash
cd personal-portfolio-app
```

3. Install dependencies:

```bash
flutter pub get
```

4. Run the application:

```bash
flutter run
```

## Tugas Individual

### Tugas 7

1. Widget tree adalah struktur hierarki berbentuk pohon yang merepresentasikan seluruh UI dalam aplikasi Flutter. Hubungan antara induk dan anak menentukan bagaimana widget ditampilkan, disusun, dan berinteraksi dengan widget lainnya.

2. MaterialApp untuk konfigurasi aplikasi, Scaffold dan AppBar untuk struktur halaman, Text dan TextStyle untuk menampilkan serta mengatur teks, Column dan Row untuk mengatur tata letak, Center untuk memposisikan konten, Padding dan SizedBox untuk mengatur jarak, GridView.count untuk menampilkan menu berbentuk grid, Card dan Container untuk membentuk tampilan kartu, Material untuk memberikan warna dan desain, InkWell untuk interaksi sentuhan, Icon untuk menampilkan ikon, serta SnackBar untuk menampilkan pesan sementara. Selain itu, terdapat dua custom widget, yaitu InfoCard untuk menampilkan informasi pengguna serta ItemCard untuk menampilkan menu utama aplikasi.

3. MaterialApp berfungsi sebagai dasar utama aplikasi Flutter yang mengatur konfigurasi seperti tema, judul, navigasi, dan halaman utama. Widget ini biasanya diletakkan paling atas sebagai root widget karena menjadi induk dari widget-widget lainnya.

4. StatelessWidget adalah widget yang tampilannya tidak mengalami perubahan berdasarkan state internal, sehingga cocok digunakan untuk komponen yang sifatnya tetap. Sementara itu, StatefulWidget digunakan untuk widget yang memiliki state dan dapat berubah ketika terjadi interaksi atau perubahan data. Kita sebaiknya menggunakan StatelessWidget jika tampilan tidak membutuhkan perubahan state, sedangkan StatefulWidget digunakan jika tampilan perlu diperbarui, misalnya ketika pengguna menekan tombol, mengisi form, atau mengubah suatu nilai.

5. BuildContext adalah objek yang menunjukkan posisi suatu widget di dalam widget tree. BuildContext penting karena memungkinkan widget mengakses informasi atau konfigurasi dari widget lain yang berada di atasnya, seperti tema, ukuran layar, dan navigasi. Di dalam metode build, BuildContext digunakan untuk mengakses informasi tersebut dan membantu Flutter menentukan bagaimana widget harus ditampilkan.

6. Hot reload adalah fitur Flutter yang memungkinkan perubahan kode langsung diterapkan tanpa harus menjalankan ulang aplikasi dari awal, sehingga state aplikasi tetap dipertahankan. Sementara itu, hot restart menjalankan ulang aplikasi dari awal dan menghapus state yang sedang berjalan, tetapi tidak membangun ulang seluruh proses aplikasi. Adapun full restart menghentikan dan menjalankan kembali aplikasi beserta proses build-nya. Hot reload biasanya cukup untuk perubahan tampilan atau logika sederhana.

### Tugas 8

1. Navigator.push() menambahkan route atau halaman baru ke bagian paling atas tumpukan (stack) navigasi tanpa menghapus halaman sebelumnya, sehingga pengguna masih dapat kembali ke halaman sebelumnya menggunakan tombol kembali bawaan perangkat atau Navigator.pop(). Pada aplikasi ini, Navigator.push() digunakan pada kartu aksi di halaman utama (ItemCard) saat membuka halaman formulir agar pengguna dapat langsung kembali ke halaman menu. Sementara itu, Navigator.pushReplacement() menggantikan route yang sedang aktif di puncak stack dengan route baru sehingga halaman sebelumnya dihapus dari tumpukan dan tidak dapat dikembali dengan tombol back. Method ini digunakan pada drawer menu (LeftDrawer) agar perpindahan antarhalaman tidak menumpuk stack navigasi secara terus-menerus.

2. Pada halaman formulir, Scaffold digunakan sebagai kerangka dasar halaman yang menyatukan bagian atas, konten utama, dan menu samping, sedangkan AppBar menampilkan judul halaman dengan tema yang selaras dengan halaman utama sekaligus menyediakan akses untuk membuka drawer atau kembali. LeftDrawer digunakan sebagai menu navigasi samping yang konsisten di setiap halaman untuk berpindah antara Home, Add Project, dan Add Education. Di bagian body, Form bersama GlobalKey<FormState> berfungsi mengelola status serta validasi seluruh input di dalamnya, sementara SingleChildScrollView membungkus Column agar seluruh kolom input dan tombol Simpan tetap dapat digulir dan dijangkau pada layar berukuran sempit maupun saat papan ketik muncul.

3. Pada aplikasi ini, validasi input diterapkan menggunakan properti validator pada setiap TextFormField dan FormField untuk menolak isian wajib yang kosong atau hanya berisi spasi, memeriksa batas panjang karakter, memastikan format dan rentang nilai IPK valid, serta memastikan tanggal selesai tidak mendahului tanggal mulai. Ketika tombol Simpan ditekan, FormState.validate() dijalankan untuk memeriksa seluruh kolom; jika ada input yang tidak memenuhi aturan, pesan kesalahan akan langsung muncul di bawah kolom terkait. Apabila seluruh input lolos validasi, fungsi showDialog() akan menampilkan AlertDialog berisi ringkasan seluruh isian formulir, dan tombol OK di dalamnya akan menutup dialog serta mereset kembali kondisi formulir.

4. Dalam pengerjaan tugas ini, AI digunakan sebagai alat bantu untuk memberikan referensi struktur kode halaman formulir baru (EducationFormPage) beserta penggunaan FormField dengan showDatePicker(), meninjau kesesuaian logika validasi input, serta membantu menyusun draf jawaban reflektif pada README.md. Seluruh kode yang digunakan telah disesuaikan dengan kebutuhan proyek, diuji secara mandiri menggunakan flutter analyze, dan dijalankan untuk memastikan seluruh fitur berjalan dengan baik.

## AI Disclosure

Dalam pengerjaan Tugas 8, Gemini digunakan sebagai asisten pemrograman untuk membantu melengkapi potongan kode yang masih memiliki error, menyusun halaman formulir baru, melakukan, serta menyusun draf jawaban reflektif pada `README.md`. Seluruh kode yang dihasilkan telah ditinjau, disesuaikan dengan kebutuhan aplikasi serta dijalankan untuk memastikan fungsionalitasnya berjalan dengan baik.