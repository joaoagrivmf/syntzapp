import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:syntzapp/config_util.dart';
import 'package:syntzapp/settings_screen.dart';
import 'package:syntzapp/monitoring_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _syntzId = '';
  String _status = '';

  @override
  void initState() {
    super.initState();
    _initHomeScreen();
  }

  Future<void> _initHomeScreen() async {
    // Attempt to get syntz ID from global variables
    _syntzId = ConfigUtil.objectId ?? '';

    // Check connection status
    for (int i = 0; i < 3; i++) {
      bool isConnected = await _checkConnection();
      if (isConnected) {
        setState(() {
          _status = 'CONNECTED';
        });
        return;
      }
    }
    setState(() {
      _status = 'NOT CONNECTED';
    });
  }

  Future<bool> _checkConnection() async {
    if (ConfigUtil.ssid != null && ConfigUtil.syntzIpAddress.isNotEmpty) {
      // Make an API call to the Syntz device's pint endpoint
      String url = 'http://${Config.syntzIpAddress}/pint';
      try {
        final response = await http.get(Uri.parse(url));
        return response.statusCode == 200;
      } catch (e) {
        print('Error checking connection: $e');
        return false;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Syntz ID: $_syntzId',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Text(
              'Status: $_status',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()),
                );
              },
              child: const Text('Settings'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MonitoringScreen()),
                );
              },
              child: const Text('Monitor'),
            ),
          ],
        ),
      ),
    );
  }
}
