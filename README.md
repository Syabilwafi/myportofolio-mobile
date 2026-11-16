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
