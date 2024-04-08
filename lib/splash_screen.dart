import 'package:flutter/material.dart';
import 'package:syntzapp/config_util.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Load configuration file
    ConfigUtil.loadAppConfig().then((_) {
      // Delay navigation to home screen by 4 seconds
      Future.delayed(const Duration(seconds: 4), () {
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
            const SizedBox(
                height: 20), // Add spacing between logo and loading text
            // Loading Text
            const Text(
              "Loading...",
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(
                height:
                    20), // Add spacing between loading text and website text
            // Website Text
            const Text(
              "hephaenergy.com.br",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(
                height:
                    20), // Add spacing between website text and copyright text
            // Copyright Text
            const Text(
              "© HephaEnergy",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

/*

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

*/
