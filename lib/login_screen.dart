import 'package:flutter/material.dart';
import 'package:syntzapp/config_util.dart';
import 'package:syntzapp/home_screen.dart';
import 'package:syntzapp/pairing_screen.dart';

class LoginScreen extends StatelessWidget {
  Future<void> _login(BuildContext context) async {
    // If token expiration is null, empty, or expired, call the API to validate user and password
    if (ConfigUtil.tokenExpiration == null ||
        ConfigUtil.tokenExpiration < DateTime.now().millisecondsSinceEpoch) {
      // Simulate API call - replace with your actual API call
      await Future.delayed(
          const Duration(seconds: 2)); // Simulate 2 seconds delay
      // Mock response from API
      bool loginSuccess =
          true; // Replace with actual logic to validate user and password
      if (loginSuccess) {
        // If login is successful, set token and expiration date
        ConfigUtil.setTokenExpiration(DateTime.now().millisecondsSinceEpoch +
            3600 * 1000); // Example: 1 hour from now
      } else {
        // If login fails, show error message and return
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text('Invalid username or password.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
        return;
      }
    }

    // Check if the token expiration is still valid after API call
    if (ConfigUtil.tokenExpiration > DateTime.now().millisecondsSinceEpoch) {
      // If token expiration is valid, navigate to home screen
      if (ConfigUtil.objectId != null && ConfigUtil.objectId != 0) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => PairingScreen()),
        );
      }
    } else {
      // If token expiration is not valid after API call, show warning dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Warning'),
            content: const Text('Token expiration is not valid.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const TextField(
              maxLength: 50, // Limit username to 50 characters
              decoration: InputDecoration(
                labelText: 'Username',
                hintText: 'Enter your username',
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              maxLength: 50, // Limit password to 50 characters
              obscureText: true, // Show asterisks for password
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle cancel button pressed
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle login button pressed
                    _login(context);
                  },
                  child: const Text('Login'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
