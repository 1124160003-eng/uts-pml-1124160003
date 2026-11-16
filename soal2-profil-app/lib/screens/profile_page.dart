// lib/screens/profile_page.dart
import 'package:flutter/material.dart';
import '../models/profile.dart';
import '../widgets/info_tile.dart';
import 'edit_profile_page.dart';
import '../main.dart'; // Import main.dart untuk akses appThemeNotifier

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Profile _profile;
  int _selectedIndex = 0;

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
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

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

      // 1. DRAWER (Memenuhi syarat Scaffold)
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
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
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
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Tentang Saya'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/about');
              },
            ),
            const Divider(),
            
            // SWITCH DARK MODE
            SwitchListTile(
              secondary: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode),
              title: const Text('Mode Gelap'),
              value: isDarkMode,
              onChanged: (bool value) {
                appThemeNotifier.value =
                    value ? ThemeMode.dark : ThemeMode.light;
              },
            ),
          ],
        ),
      ),

      // 2. BOTTOM NAVIGATION (Memenuhi syarat Scaffold tambahan)
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
          if (index == 1) {
            Navigator.pushNamed(context, '/about').then((_) {
              setState(() {
                _selectedIndex = 0;
              });
            });
          }
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.person), label: 'Profil'),
          NavigationDestination(icon: Icon(Icons.info), label: 'Tentang'),
        ],
      ),

      // 3. FLOATING ACTION BUTTON (Memenuhi syarat Scaffold tambahan)
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('Terima kasih telah melihat profil saya!')),
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
              const SizedBox(height: 80), // Spasi bawah agar tidak tertutup FAB
            ],
          ),
        ),
      ),
    );
  }
}