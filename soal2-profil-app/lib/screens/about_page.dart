import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Saya'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Text(
            'Keahlian & Hobi',
            style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          const Card(
            elevation: 1,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.code),
                  title: Text('Pemrograman Mobile (Flutter)'),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.design_services),
                  title: Text('Desain UI/UX'),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.sports_esports),
                  title: Text('Bermain Game & E-Sport'),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.music_note),
                  title: Text('Mendengarkan Musik'),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          Text(
            'Riwayat Pendidikan',
            style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          const Card(
            elevation: 1,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.school, color: Colors.blue),
                  title: Text('S1 Teknik Informatika'),
                  subtitle: Text('Global Institute'),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.school, color: Colors.grey),
                  title: Text('SMA / SMK'),
                  subtitle: Text('Sekolah Menengah Maria Mediatrix'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
