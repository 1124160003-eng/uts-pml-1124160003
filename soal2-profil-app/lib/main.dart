import 'package:flutter/material.dart';
import 'models/profile.dart';
import 'screens/login_page.dart';
import 'screens/profile_page.dart';
import 'screens/about_page.dart';

void main() {
  runApp(const MyApp());
}

final ValueNotifier<ThemeMode> appThemeNotifier = ValueNotifier(ThemeMode.system);

Profile currentProfile = initialProfile;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: appThemeNotifier,
      builder: (context, currentMode, child) {
        return MaterialApp(
          title: 'Profil Mahasiswa',
          debugShowCheckedModeBanner: false,
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
          themeMode: currentMode,
          initialRoute: '/login',
          routes: {
            '/login': (context) => const LoginPage(),
            '/profile': (context) => const ProfilePage(),
            '/about': (context) => const AboutPage(),
          },
        );
      },
    );
  }
}
