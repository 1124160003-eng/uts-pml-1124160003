// lib/screens/profile_page.dart
import 'package:flutter/material.dart';
import '../models/profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // State ini menampung data profil yang bisa berubah
  late Profile _profile;

  @override
  void initState() {
    super.initState();
    // Mengambil data awal dari model profile.dart
    _profile = initialProfile;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        centerTitle: true,
      ),
      // Body dibuat bisa di-scroll agar aman dari overflow
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              
              // 1. Foto Profil menggunakan CircleAvatar
              CircleAvatar(
                radius: 50,
                // Membaca file gambar dari assets yang sudah didaftarkan di pubspec.yaml
                backgroundImage: const AssetImage('assets/images/foto_profile.jpeg'),
                // Fallback jika gambar gagal dimuat atau belum disiapkan
                onBackgroundImageError: (exception, stackTrace) {},
                child: null, 
              ),
              const SizedBox(height: 16),

              // 2. Nama, NIM, dan Prodi
              Text(
                _profile.nama,
                style: textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                '${_profile.nim} • ${_profile.prodi}',
                style: textTheme.bodyMedium?.copyWith(
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              
              // Kelas
              Chip(
                label: Text(_profile.kelas),
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              ),
              const SizedBox(height: 16),

              // 3. Bio Singkat
              Text(
                _profile.bio,
                style: textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),

              Card(
                elevation: 2,
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.email),
                      title: const Text('Email'),
                      subtitle: Text(_profile.email),
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(Icons.phone),
                      title: const Text('No. HP'),
                      subtitle: Text(_profile.hp),
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(Icons.code),
                      title: const Text('GitHub'),
                      subtitle: Text(_profile.github),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}