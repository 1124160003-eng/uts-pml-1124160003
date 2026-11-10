import 'package:flutter/material.dart';
import "profile_page.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profil Given Ezra Dominic Keo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: .fromSeed(
          seedColor: const Color.fromARGB(255, 248, 15, 15),
        ),
        useMaterial3: true,
      ),

      darkTheme: ThemeData.dark(useMaterial3: true),

      themeMode: ThemeMode.system,
      home: const ProfilePage(),
    );
  }
}
