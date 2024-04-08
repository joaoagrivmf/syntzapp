import 'dart:async';

Future<bool> simulateAPICall(String username, String password) async {
  // Simulate API call
  await Future.delayed(Duration(seconds: 2)); // Simulate 2 seconds delay

  // Replace this with your actual API call logic
  // For simulation purposes, let's assume username and password are valid if both are 'admin'
  bool isValid = username == 'admin' && password == 'admin';
  
  return isValid;
}








import 'dart:async';

// Simulate an API call to a login endpoint
Future<bool> simulateAPICall(String username, String password) async {
  // Simulate API call with a delay of 2 seconds
  await Future.delayed(Duration(seconds: 2));

  // Replace this with actual API call to your backend
  // Here, we're simulating a successful login if username and password are 'admin'
  if (username == 'admin' && password == 'admin') {
    return true; // Login successful
  } else {
    return false; // Login failed
  }
}
