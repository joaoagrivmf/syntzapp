import 'package:flutter/material.dart';
import 'package:syntzapp/login_screen.dart';
import 'package:syntzapp/pairing_screen.dart';
import 'package:syntzapp/home_screen.dart';
import 'package:syntzapp/settings_screen.dart';
import 'package:syntzapp/monitoring_screen.dart';

class BottomNavBar extends StatelessWidget {
  final BuildContext context;
  BottomNavBar({required this.context});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: const Icon(Icons.login),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.bluetooth),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PairingScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.monitor),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MonitoringScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
