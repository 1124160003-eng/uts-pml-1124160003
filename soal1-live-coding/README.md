# UTS Pemrograman Aplikasi Mobile — Soal 1: Live Coding Profil Mahasiswa

Aplikasi Flutter sederhana untuk menampilkan **halaman profil mahasiswa** menggunakan widget dasar Flutter. Project ini merupakan jawaban **Soal 1 (Live Coding)** pada UTS Pemrograman Aplikasi Mobile.

> Aplikasi utama dengan fitur login, edit profil, dan halaman tentang saya berada di folder [`soal2-profil-app`](../soal2-profil-app).

---

## Identitas Mahasiswa

| Field | Keterangan |
|---|---|
| **Nama** | Given Ezra Dominic Keo |
| **NIM** | 1124160003 |
| **Kelas** | TI 24 P SE 2 |
| **Program Studi** | Teknik Informatika |
| **Institusi** | Institut Teknologi & Bisnis Bina Sarana Global |

---


## Deskripsi Soal

Membuat satu halaman profil mahasiswa dari nol (*live coding*) dengan ketentuan:

1. Menggunakan `MaterialApp` dengan tema `Material 3`.
2. Menampilkan `Scaffold` dengan `AppBar` berjudul **Profil Mahasiswa**.
3. Menampilkan foto profil menggunakan `CircleAvatar`.
4. Menampilkan data diri: **Nama**, **NIM**, dan **Jurusan**.
5. Menampilkan informasi **Kontak** dan **Keahlian** di dalam `Card`.
6. Membuat widget kustom `InfoTile` yang dapat digunakan berulang (*reusable*).
7. Menampilkan `SnackBar` melalui `FloatingActionButton`.

---

## Fitur Aplikasi

### 1. Tema Aplikasi (`main.dart`)
- `MaterialApp` dengan `useMaterial3: true`.
- Warna tema dibuat dari `ColorScheme.fromSeed` dengan *seed color* merah.
- Mendukung **mode terang dan gelap** mengikuti pengaturan sistem (`ThemeMode.system`).
- Halaman awal langsung menuju `ProfilePage`.

### 2. Halaman Profil (`ProfilePage`)
- `AppBar` dengan judul **Profil Mahasiswa**, ikon menu, dan warna kustom.
- Foto profil berbentuk lingkaran menggunakan `CircleAvatar` berisi ikon `person`.
- Menampilkan **Nama**, **NIM**, dan **Jurusan** dengan `Text` serta `Theme.of(context).textTheme` agar ukuran font konsisten.
- Layout menggunakan `SafeArea` → `SingleChildScrollView` → `Padding` → `Column`, sehingga halaman tetap rapi dan bisa di-*scroll* pada layar kecil.

### 3. Kartu Kontak
Berisi daftar kontak menggunakan widget `InfoTile`:
- Email: `1124160003@global.ac.id`
- Kontak: `+62 858-9040-7672`
- Program Studi: Teknik Informatika
- GitHub: `Given-keo`

### 4. Kartu Keahlian
Berisi daftar keahlian menggunakan widget `InfoTile`:
- PHP — Pengembangan Backend & Sistem Web
- HTML & CSS — Desain Web Responsif & Frontend
- Python — Pemrograman Dasar & Data Analysis

### 5. Widget Kustom (`InfoTile`)
Widget *reusable* berbasis `ListTile` dengan tiga parameter wajib:

| Parameter | Tipe | Keterangan |
|---|---|---|
| `icon` | `IconData` | Ikon di sisi kiri |
| `label` | `String` | Judul informasi |
| `value` | `String` | Keterangan / isi informasi |

### 6. Interaksi `FloatingActionButton`
Menekan tombol info akan menampilkan `SnackBar`:

> "Terima kasih telah melihat profil saya"

---

## Struktur Folder

```
soal1-live-coding/
├── lib/
│   ├── main.dart          # Entry point, MaterialApp, dan konfigurasi tema
│   ├── profile_page.dart  # Halaman profil mahasiswa
│   └── info_tile.dart     # Widget kustom untuk baris informasi
├── test/
│   └── widget_test.dart   # Widget test bawaan Flutter
├── android/ ios/ web/ ... # Platform target Flutter
├── analysis_options.yaml
└── pubspec.yaml
```

---

## Widget yang Digunakan

| Widget | Fungsi |
|---|---|
| `MaterialApp` | Membungkus aplikasi dan mengatur tema |
| `Scaffold` | Kerangka halaman (AppBar, body, FAB) |
| `AppBar` | Judul halaman dan tombol menu |
| `SafeArea` | Menghindari area *notch*/status bar |
| `SingleChildScrollView` | Membuat isi halaman dapat di-*scroll* |
| `Column` | Menyusun elemen secara vertikal |
| `CircleAvatar` | Menampilkan foto/ikon profil |
| `Card` + `Divider` | Mengelompokkan informasi dalam kartu |
| `ListTile` | Baris informasi ikon + teks (di dalam `InfoTile`) |
| `FloatingActionButton` | Tombol aksi menampilkan `SnackBar` |
| `SnackBar` | Notifikasi singkat di bagian bawah layar |

---

## Cara Menjalankan Aplikasi

### 1. Prasyarat
- Flutter SDK terbaru (Dart SDK **3.12.2** atau lebih baru, sesuai `environment` pada `pubspec.yaml`)
- Android Studio / VS Code dengan ekstensi Flutter
- Emulator atau perangkat fisik

### 2. Clone repository
```bash
git clone https://github.com/1124160003-eng/uts-pml-1124160003.git
cd uts-pml-1124160003/soal1-live-coding
```

### 3. Install dependency
```bash
flutter pub get
```

### 4. Jalankan aplikasi
```bash
flutter run
```

### 5. (Opsional) Cek kualitas kode
```bash
flutter analyze
```

---

## Catatan

- Soal 1 berfokus pada **satu halaman profil statis** dan penggunaan widget dasar Flutter.
- Seluruh data profil ditulis langsung di dalam kode (*hardcoded*), belum menggunakan state management atau penyimpanan data.
- Widget test bawaan (`test/widget_test.dart`) masih menggunakan template *counter test* dari Flutter dan belum disesuaikan dengan halaman profil.
