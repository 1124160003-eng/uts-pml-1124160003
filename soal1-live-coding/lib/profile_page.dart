import 'package:flutter/material.dart';
import "info_tile.dart";

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 207, 105, 105),
        title: const Text("Profil Mahasiswa"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              size: 35,
              color: Color.fromARGB(255, 12, 12, 12),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsGeometry.all(16.0),
            child: Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 80,
                    child: Icon(Icons.person, size: 60),
                  ),

                  SizedBox(height: 15),
                  Text(
                    "Nama : Given Ezra Dominic Keo",
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 15),
                  Text(
                    "NIM : 1124160003",
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 15),
                  Text(
                    "Jurusan : Teknik Informatika",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),

                  const SizedBox(height: 24),
                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: EdgeInsetsGeometry.symmetric(vertical: 1),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(
                              left: 16,
                              top: 8,
                              bottom: 4,
                            ),
                            child: Text(
                              "KONTAK",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Divider(),
                          InfoTile(
                            icon: Icons.email,
                            label: "Email",
                            value: "1124160003@global.ac.id",
                          ),
                          InfoTile(
                            icon: Icons.phone,
                            label: "Kontak",
                            value: "+62 858-9040-7672",
                          ),
                          InfoTile(
                            icon: Icons.class_,
                            label: "Program Studi",
                            value: "Teknik Informatika",
                          ),
                          InfoTile(
                            icon: Icons.gite_sharp,
                            label: "Github",
                            value: "Given-keo",
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),
                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 1),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(
                              left: 16,
                              top: 8,
                              bottom: 4,
                            ),
                            child: Text(
                              "KEAHLIAN",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Divider(),
                          InfoTile(
                            icon: Icons.code,
                            label: "PHP",
                            value: "Pengembangan Backend & Sistem Web",
                          ),
                          InfoTile(
                            icon: Icons.web,
                            label: "HTML & CSS",
                            value: "Desain Web Responsif & Frontend",
                          ),
                          InfoTile(
                            icon: Icons.terminal,
                            label: "Python",
                            value: "Pemrograman Dasar & Data Analysis",
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Terima kasih telah melihat profil saya"),
            ),
          );
        },
        child: const Icon(Icons.info_outline),
      ),
    );
  }
}
