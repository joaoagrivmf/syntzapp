import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: Center(
        child: Text("Home Screen Content"),
      ),
    );
  }
}







import 'package:flutter/material.dart';
import 'package:your_app_name/config.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Accessing configuration data
    String userEmail = Config.authUsers.keys.first;
    String userPassword = Config.authUsers[userEmail]['password'];
    int token = Config.authUsers[userEmail]['token'];
    int tokenExpiration = Config.authUsers[userEmail]['token_expiration'];

    int objectId = Config.connection['id'];
    String objectType = Config.connection['object_type'];
    String ssid = Config.connection['ssid'];
    String objectPassword = Config.connection['password'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('User Email: $userEmail'),
            Text('User Password: $userPassword'),
            Text('Token: $token'),
            Text('Token Expiration: $tokenExpiration'),
            SizedBox(height: 20),
            Text('Object Type: $objectType'),
            Text('Object ID: $objectId'),
            Text('SSID: $ssid'),
            Text('Object Password: $objectPassword'),
          ],
        ),
      ),
    );
  }
}








import 'package:flutter/material.dart';
import 'package:your_app_name/config.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Authentication Users:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Loop through each authentication user
            for (var userEntry in Config.authUsers.entries)
              Column(
                children: [
                  Text('User Email: ${userEntry.key}'),
                  Text('User Password: ${userEntry.value['password']}'),
                  Text('Token: ${userEntry.value['token']}'),
                  Text('Token Expiration: ${userEntry.value['token_expiration']}'),
                  SizedBox(height: 20),
                ],
              ),
          ],
        ),
      ),
    );
  }
}









import 'package:flutter/material.dart';
import 'package:your_app_name/config.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('User Email: ${Config.userEmail}'),
            Text('User Password: ${Config.userPassword}'),
            Text('Token: ${Config.token}'),
            Text('Token Expiration: ${Config.tokenExpiration}'),
            Text('Object Type: ${Config.objectType}'),
            Text('Object ID: ${Config.objectId}'),
            Text('SSID: ${Config.ssid}'),
            Text('Object Password: ${Config.objectPassword}'),
          ],
        ),
      ),
    );
  }
}








import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:your_app_name/config.dart';
import 'package:your_app_name/settings_screen.dart';
import 'package:your_app_name/monitor_screen.dart';

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
    _syntzId = Config.syntzId ?? '';

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
    if (Config.syntzIpAddress != null && Config.syntzIpAddress.isNotEmpty) {
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
        title: Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Syntz ID: $_syntzId',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Status: $_status',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()),
                );
              },
              child: Text('Settings'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MonitorScreen()),
                );
              },
              child: Text('Monitor'),
            ),
          ],
        ),
      ),
    );
  }
}









import 'package:flutter/material.dart';
import 'package:your_app_name/bottom_nav_bar.dart';
import 'package:your_app_name/login_screen.dart';
import 'package:your_app_name/pairing_screen.dart';
import 'package:your_app_name/settings_screen.dart';
import 'package:your_app_name/monitor_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Text('Home Screen Content'),
      ),
      bottomNavigationBar: BottomNavBar(
        onLoginPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        },
        onPairingPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PairingScreen()),
          );
        },
        onHomePressed: () {
          // Do nothing as we are already on the home screen
        },
        onSettingsPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SettingsScreen()),
          );
        },
        onMonitoringPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MonitorScreen()),
          );
        },
      ),
    );
  }
}










import 'package:flutter/material.dart';
import 'package:your_app_name/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Text('Home Screen Content'),
      ),
      bottomNavigationBar: BottomNavBar(context: context),
    );
  }
}









import 'package:flutter/material.dart';
import 'package:your_app_name/parent_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ParentScreen(
      title: 'Home',
      subtitle: 'Welcome to the Home Screen',
      child: Center(
        child: Text('Home Screen Content'),
      ),
    );
  }
}









import 'package:flutter/material.dart';
import 'package:your_app_name/parent_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ParentScreen(
      title: 'Home',
      subtitle: 'Welcome to the Home Screen',
      selectedIndex: 2, // Example selected index
      child: Center(
        child: Text('Home Screen Content'),
      ),
    );
  }
}
