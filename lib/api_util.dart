import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiUtil {
  Future<bool> simulateAPICall(String username, String password) async {
    // Simulate API call
    await Future.delayed(Duration(seconds: 2)); // Simulate 2 seconds delay

    // Replace this with your actual API call logic
    // For simulation purposes, let's assume username and password are valid if both are 'admin'
    bool isValid = username == 'admin' && password == 'admin';

    return isValid;
  }

  Future<bool> callAPI(String username, String password) async {
    const String apiUrl =
        'https://your-api-url/syntz_login'; // Replace with your actual API URL

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {
          'username': username,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        // If the API call is successful
        final responseData = json.decode(response.body);
        bool loginSuccess = responseData[
            'success']; // Assuming API response contains a 'success' field
        return loginSuccess;
      } else {
        // If the API call fails
        print('Failed to call API: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      // If an error occurs during the API call
      print('Error calling API: $e');
      return false;
    }
  }
}
