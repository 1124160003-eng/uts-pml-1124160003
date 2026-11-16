// lib/screens/profile_page.dart
import 'package:flutter/material.dart';
import '../models/profile.dart';
import '../widgets/info_tile.dart';
import 'edit_profile_page.dart';

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

  Future<void> _goToEditProfile() async {
    final Profile? hasil = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfilePage(currentProfile: _profile),
      ),
    );

    if (hasil != null) {
      setState(() {
        _profile = hasil;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: _goToEditProfile,
            tooltip: 'Edit Profil',
          ),
        ],
      ),

      // 1. KOMPONEN TAMBAHAN: DRAWER (Menu Samping)
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(Icons.person, size: 50, color: Colors.white),
                  const SizedBox(height: 8),
                  Text(
                    _profile.nama,
                    style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    _profile.nim,
                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Halaman Profil'),
              onTap: () {
                Navigator.pop(context); // Tutup drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Tentang Saya'),
              onTap: () {
                Navigator.pop(context); // Tutup drawer dulu
                Navigator.pushNamed(context, '/about'); // Buka halaman about
              },
            ),
          ],
        ),
      ),

      // 2. KOMPONEN TAMBAHAN: FLOATING ACTION BUTTON
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Terima kasih telah melihat profil saya!')),
          );
        },
        child: const Icon(Icons.message),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              
              CircleAvatar(
                radius: 60,
                backgroundImage: const AssetImage('assets/images/foto_profil.jpg'),
                onBackgroundImageError: (exception, stackTrace) {},
              ),
              const SizedBox(height: 16),

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
              
              Chip(
                label: Text(_profile.kelas),
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              ),
              const SizedBox(height: 16),

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