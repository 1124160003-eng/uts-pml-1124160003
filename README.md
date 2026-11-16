# UTS Pemrograman Aplikasi Mobile — Aplikasi Profil Mahasiswa



## Identitas Mahasiswa

| Field | Keterangan |
|---|---|
| **Nama** | Given Ezra Dominic Keo |
| **NIM** | 1124160003 |
| **Kelas** | TI 24 P SE 2 |
| **Program Studi** | Teknik Informatika |
| **Institusi** | Institut Teknologi & Bisnis Bina Sarana Global |

---

## Video Presentasi & Demo

🔗 **Link YouTube:** [Tonton Video Presentasi UTS PML](https://youtu.be/JvK10WzBr-I)

---

## Fitur Utama Aplikasi (`soal2-profil-app`)

### 1. Halaman Login (`LoginPage`)
- Validasi input menggunakan `Form` dan `GlobalKey<FormState>` (kolom wajib diisi, format email mengandung `@`, dan password minimal 6 karakter).
- Indikator loading saat proses autentikasi berlangsung.
- Navigasi ke halaman profil menggunakan `Navigator.pushReplacementNamed` disertai notifikasi `SnackBar`.

### 2. Halaman Profil (`ProfilePage`)
- Menampilkan foto profil (`CircleAvatar`), nama lengkap, NIM, program studi, dan kelas.
- Kartu informasi **Bio Singkat** dan **Kontak** (Email, Nomor HP, Akun GitHub) menggunakan widget kustom `InfoTile`.
- Tombol **Switch** pada `AppBar` untuk mengganti tema terang dan gelap secara dinamis, serta tombol logout.
- `FloatingActionButton` untuk membuka halaman edit profil.
- `BottomNavigationBar` untuk berpindah ke halaman **Tentang Saya**.

### 3. Halaman Edit Profil (`EditProfilePage`)
- Form praisi (*pre-filled*) menggunakan `TextEditingController` yang diinisialisasi pada `initState()`.
- Validasi input nama, email, dan nomor HP (10–13 digit angka).
- Pengiriman data pembaruan kembali ke `ProfilePage` menggunakan `Navigator.pop(context, dataBaru)` yang memicu `setState()` dan notifikasi `SnackBar`.

### 4. Halaman Tentang Saya (`AboutPage`)
- Menampilkan daftar **Riwayat Pendidikan** dan **Keahlian & Hobi** menggunakan `ListView` dan `Card`.
- Navigasi `BottomNavigationBar` yang konsisten dengan halaman profil.

---

## Screenshot Aplikasi

| Halaman Login | Halaman Profil | Halaman Edit Profil |
|:---:|:---:|:---:|
| ![Login](assets/images/loginPage.jpeg) | ![Profil](assets/images/ProfilePage.jpeg) | ![Edit Profil](assets/images/EditProfilePage.jpeg) |

---

## Cara Menjalankan Aplikasi

### 1. Clone repository
```bash
git clone https://github.com/1124160003-eng/uts-pml-1124160003.git
cd uts-pml-1124160003/soal2-profil-app
