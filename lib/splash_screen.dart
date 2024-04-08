import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Splash Screen"),
      ),
      body: Center(
        child: Text("Splash Screen Content"),
      ),
    );
  }
}






import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Centered Logo
            Image.asset(
              'assets/logo.png', // Change this to your logo's path
              width: 100, // Adjust width as needed
              height: 100, // Adjust height as needed
            ),
            SizedBox(height: 20), // Add spacing between logo and loading text
            // Loading Text
            Text(
              "Loading...",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20), // Add spacing between loading text and website text
            // Website Text
            Text(
              "hephaenergy.com.br",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 20), // Add spacing between website text and copyright text
            // Copyright Text
            Text(
              "© HephaEnergy",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}









import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Delay navigation to home screen by 4 seconds
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Centered Logo
            Image.asset(
              'assets/logo.png', // Change this to your logo's path
              width: 100, // Adjust width as needed
              height: 100, // Adjust height as needed
            ),
            SizedBox(height: 20), // Add spacing between logo and loading text
            // Loading Text
            Text(
              "Loading...",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20), // Add spacing between loading text and website text
            // Website Text
            Text(
              "hephaenergy.com.br",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 20), // Add spacing between website text and copyright text
            // Copyright Text
            Text(
              "© HephaEnergy",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}








import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Map<String, dynamic> _appConfig;

  @override
  void initState() {
    super.initState();
    // Load configuration file
    _loadAppConfig().then((value) {
      setState(() {
        _appConfig = value;
      });
      // Delay navigation to home screen by 4 seconds
      Future.delayed(Duration(seconds: 4), () {
        // Navigate to home screen
        Navigator.pushReplacementNamed(context, '/home');
      });
    });
  }

  Future<Map<String, dynamic>> _loadAppConfig() async {
    // Load and parse JSON file
    String jsonString = await rootBundle.loadString('assets/syntzappconfig.json');
    return json.decode(jsonString);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Centered Logo
            Image.asset(
              'assets/logo.png', // Change this to your logo's path
              width: 100, // Adjust width as needed
              height: 100, // Adjust height as needed
            ),
            SizedBox(height: 20), // Add spacing between logo and loading text
            // Loading Text
            Text(
              "Loading...",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20), // Add spacing between loading text and website text
            // Website Text
            Text(
              "hephaenergy.com.br",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 20), // Add spacing between website text and copyright text
            // Copyright Text
            Text(
              "© HephaEnergy",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}









import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Load configuration file
    Config.loadAppConfig().then((_) {
      // Delay navigation to home screen by 4 seconds
      Future.delayed(Duration(seconds: 4), () {
        // Navigate to home screen
        Navigator.pushReplacementNamed(context, '/home');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Centered Logo
            Image.asset(
              'assets/logo.png', // Change this to your logo's path
              width: 100, // Adjust width as needed
              height: 100, // Adjust height as needed
            ),
            SizedBox(height: 20), // Add spacing between logo and loading text
            // Loading Text
            Text(
              "Loading...",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(
                height:
                    20), // Add spacing between loading text and website text
            // Website Text
            Text(
              "hephaenergy.com.br",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(
                height:
                    20), // Add spacing between website text and copyright text
            // Copyright Text
            Text(
              "© HephaEnergy",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

class Config {
  static String token;
  static int tokenDueTo;
  static String loggedUser;
  static String password;
  static int pairedSyntz;

  static Future<void> loadAppConfig() async {
    try {
      // Load and parse JSON file
      String jsonString =
          await rootBundle.loadString('assets/syntzappconfig.json');
      Map<String, dynamic> config = json.decode(jsonString);

      // Assign values to global variables
      token = config['token'];
      tokenDueTo = config['token_due_to'];
      loggedUser = config['logged_user'];
      password = config['password'];
      pairedSyntz = config['paired_syntz'];
    } catch (e) {
      print("Error loading app configuration: $e");
    }
  }
}
