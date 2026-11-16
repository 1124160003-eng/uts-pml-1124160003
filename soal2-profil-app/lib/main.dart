// lib/main.dart
import 'package:flutter/material.dart';
import 'models/profile.dart';
import 'screens/login_page.dart';

void main() {
  runApp(const MyApp());
}

ThemeMode _appThemeMode = ThemeMode.system;


Profile _currentProfile = initialProfile;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profil Mahasiswa',
      debugShowCheckedModeBanner: false,
      
      // --- TEMA TERANG ---
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.light,
        ),
      ),
      

      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.dark,
        ),
      ),
      
  
      themeMode: _appThemeMode,
      

      initialRoute: '/login',
     
      routes: {
        '/login': (context) => const LoginPage(),
      },
    );
  }
}