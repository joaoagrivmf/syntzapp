import 'package:syntzapp/api_util.dart';
import 'package:flutter/material.dart';
import 'package:syntzapp/config_util.dart';

class LoginUtil {
  Future<void> login(BuildContext context) async {
    String username = ''; // Get username from text field
    String password = ''; // Get password from text field

    bool loginSuccess = await ApiUtil().callAPI(username, password);
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

    // Check if the token expiration is still valid after API call
    // Navigation logic...
  }

  Future<void> login2(BuildContext context) async {
    String username = ''; // Get username from text field
    String password = ''; // Get password from text field

    bool loginSuccess = await ApiUtil().callAPI(username, password);
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

    // Check if the token expiration is still valid after API call
    // Navigation logic...
  }
}
