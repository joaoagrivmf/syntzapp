import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class Config {
  static String _userEmail;
  static String _userPassword;
  static int _token;
  static int _tokenExpiration;
  static int _objectId;
  static String _objectType;
  static String _ssid;
  static String _objectPassword;

  static bool _isDirty = false;

  static String get userEmail => _userEmail;
  static String get userPassword => _userPassword;
  static int get token => _token;
  static int get tokenExpiration => _tokenExpiration;
  static int get objectId => _objectId;
  static String get objectType => _objectType;
  static String get ssid => _ssid;
  static String get objectPassword => _objectPassword;
  static bool get isDirty => _isDirty;

  static void setUserEmail(String email) {
    _userEmail = email;
    _isDirty = true;
  }

  static void setUserPassword(String password) {
    _userPassword = password;
    _isDirty = true;
  }

  static void setToken(int value) {
    _token = value;
    _isDirty = true;
  }

  static void setTokenExpiration(int value) {
    _tokenExpiration = value;
    _isDirty = true;
  }

  static void setObjectId(int id) {
    _objectId = id;
    _isDirty = true;
  }

  static void setObjectType(String type) {
    _objectType = type;
    _isDirty = true;
  }

  static void setSsid(String value) {
    _ssid = value;
    _isDirty = true;
  }

  static void setObjectPassword(String password) {
    _objectPassword = password;
    _isDirty = true;
  }

  static Future<void> loadAppConfig() async {
    try {
      // Get the directory where the app can store files
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;

      // Construct the file path
      String configFilePath = '$appDocPath/syntzappconfig.json';

      // Read the JSON file
      File configFile = File(configFilePath);
      String jsonString = await configFile.readAsString();

      // Parse JSON content
      Map<String, dynamic> config = json.decode(jsonString);

      // Update configuration data
      _userEmail = config['security']['auth_users']
          ['operationshephaenergy@gmail.com']['email'];
      _userPassword = config['security']['auth_users']
          ['operationshephaenergy@gmail.com']['password'];
      _token = config['security']['auth_users']
          ['operationshephaenergy@gmail.com']['token'];
      _tokenExpiration = config['security']['auth_users']
          ['operationshephaenergy@gmail.com']['token_expiration'];
      _objectId = config['connection']['id'];
      _objectType = config['connection']['object_type'];
      _ssid = config['connection']['ssid'];
      _objectPassword = config['connection']['password'];

      // Reset dirty flag
      _isDirty = false;
    } catch (e) {
      print("Error loading app configuration: $e");
    }
  }

  static Future<void> updateAppConfig() async {
    try {
      // Get the directory where the app can store files
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;

      // Construct the file path
      String configFilePath = '$appDocPath/syntzappconfig.json';

      // Create a JSON object with updated configuration data
      Map<String, dynamic> config = {
        'security': {
          'auth_users': {
            'operationshephaenergy@gmail.com': {
              'email': _userEmail,
              'password': _userPassword,
              'token': _token,
              'token_expiration': _tokenExpiration,
            },
          },
        },
        'connection': {
          'object_type': _objectType,
          'id': _objectId,
          'ssid': _ssid,
          'password': _objectPassword,
        },
      };

      // Convert the updated configuration to JSON string
      String jsonString = json.encode(config);

      // Write the updated JSON content to the file
      File configFile = File(configFilePath);
      await configFile.writeAsString(jsonString);

      // Reset dirty flag
      _isDirty = false;
    } catch (e) {
      print("Error updating app configuration: $e");
    }
  }
}
