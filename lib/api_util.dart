import 'dart:async';

class ApiUtil {
  Future<bool> simulateAPICall(String username, String password) async {
    // Simulate API call
    await Future.delayed(Duration(seconds: 2)); // Simulate 2 seconds delay

    // Replace this with your actual API call logic
    // For simulation purposes, let's assume username and password are valid if both are 'admin'
    bool isValid = username == 'admin' && password == 'admin';

    return isValid;
  }
}
