import 'package:flutter/material.dart';
import 'package:syntzapp/splash_screen.dart';
import 'package:syntzapp/login_screen.dart';
import 'package:syntzapp/pairing_screen.dart';
import 'package:syntzapp/home_screen.dart';
import 'package:syntzapp/settings_screen.dart';
import 'package:syntzapp/monitoring_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hephaenergy Syntz App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SplashScreen(),
      routes: {
        '/login': (context) => LoginScreen(),
        '/pairing': (context) => PairingScreen(),
        '/home': (context) => HomeScreen(),
        '/settings': (context) => SettingsScreen(),
        '/monitoring': (context) => MonitoringScreen(),
      },
    );
  }
}
