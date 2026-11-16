// lib/screens/profile_page.dart
import 'package:flutter/material.dart';
import '../models/profile.dart';
import '../widgets/info_tile.dart'; 

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Profile _profile;

  @override
  void initState() {
    super.initState();
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              
              // 1. FOTO PROFIL
              CircleAvatar(
                radius: 60,
                backgroundImage: const AssetImage('assets/images/foto_profile.jpeg'),
                onBackgroundImageError: (exception, stackTrace) {},
              ),
              const SizedBox(height: 16),

              // 2. NAMA, NIM, PRODI
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
              
              // KELAS
              Chip(
                label: Text(_profile.kelas),
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              ),
              const SizedBox(height: 16),

              // 3. BIO SINGKAT
              Text(
                _profile.bio,
                style: textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),

              // 4. KARTU INFORMASI (Menggunakan InfoTile)
              Card(
                elevation: 2,
                child: Column(
                  children: [
                    InfoTile(
                      icon: Icons.email,
                      label: 'Email',
                      value: _profile.email,
                    ),
                    const Divider(height: 1),
                    InfoTile(
                      icon: Icons.phone,
                      label: 'No. HP',
                      value: _profile.hp,
                    ),
                    const Divider(height: 1),
                    InfoTile(
                      icon: Icons.school,
                      label: 'Kelas',
                      value: _profile.kelas,
                    ),
                    const Divider(height: 1),
                    InfoTile(
                      icon: Icons.code,
                      label: 'GitHub',
                      value: _profile.github,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}