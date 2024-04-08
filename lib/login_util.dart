Future<void> _login(BuildContext context) async {
  String username = ''; // Get username from text field
  String password = ''; // Get password from text field

  bool loginSuccess = await simulateAPICall(username, password);
  if (loginSuccess) {
    // If login is successful, set token and expiration date
    Config.setTokenExpiration(DateTime.now().millisecondsSinceEpoch +
        3600 * 1000); // Example: 1 hour from now
  } else {
    // If login fails, show error message and return
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text('Invalid username or password.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
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

Future<void> _login(BuildContext context) async {
  String username = ''; // Get username from text field
  String password = ''; // Get password from text field

  bool loginSuccess = await simulateAPICall(username, password);
  if (loginSuccess) {
    // If login is successful, set token and expiration date
    Config.setTokenExpiration(DateTime.now().millisecondsSinceEpoch +
        3600 * 1000); // Example: 1 hour from now
  } else {
    // If login fails, show error message and return
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text('Invalid username or password.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
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
