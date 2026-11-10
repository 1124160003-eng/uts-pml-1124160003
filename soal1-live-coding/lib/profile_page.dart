import 'package:flutter/material.dart';

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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
