import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class Config {
  static Map<String, Map<String, dynamic>> authUsers = {};
  static Map<String, dynamic> connection = {};

  static Future<void> loadAppConfig() async {
    try {
      // Load and parse JSON file
      String jsonString =
          await rootBundle.loadString('assets/syntzappconfig.json');
      Map<String, dynamic> config = json.decode(jsonString);

      // Extract configuration data
      authUsers = config['security']['auth_users'];
      connection = config['connection'];
    } catch (e) {
      print("Error loading app configuration: $e");
    }
  }
}








import 'dart:convert';
import 'package:http/http.dart' as http;

class Config {
  static Map<String, dynamic> authUsers = {};
  static Map<String, dynamic> connection = {};

  static Future<void> loadAppConfig() async {
    try {
      // Make a network request to fetch configuration data
      final response =
          await http.get(Uri.parse('https://example.com/syntzappconfig.json'));

      if (response.statusCode == 200) {
        // Parse JSON response and update configuration data
        Map<String, dynamic> config = json.decode(response.body);
        authUsers = config['security']['auth_users'];
        connection = config['connection'];
      } else {
        throw Exception('Failed to load configuration');
      }
    } catch (e) {
      print("Error loading app configuration: $e");
    }
  }

  static Future<void> updateAppConfig(Map<String, dynamic> newConfig) async {
    try {
      // Convert the new configuration data to JSON string
      String jsonString = json.encode(newConfig);

      // Make a network request to update configuration data
      final response = await http.post(
        Uri.parse('https://example.com/updateconfig'),
        body: jsonString,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Configuration updated successfully
        // Update local configuration data
        authUsers = newConfig['security']['auth_users'];
        connection = newConfig['connection'];
      } else {
        throw Exception('Failed to update configuration');
      }
    } catch (e) {
      print("Error updating app configuration: $e");
    }
  }
}








import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class Config {
  static Map<String, dynamic> authUsers = {};
  static Map<String, dynamic> connection = {};

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
      authUsers = config['security']['auth_users'];
      connection = config['connection'];
    } catch (e) {
      print("Error loading app configuration: $e");
    }
  }

  static Future<void> updateAppConfig(Map<String, dynamic> newConfig) async {
    try {
      // Get the directory where the app can store files
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;

      // Construct the file path
      String configFilePath = '$appDocPath/syntzappconfig.json';

      // Convert the new configuration data to JSON string
      String jsonString = json.encode(newConfig);

      // Write the updated JSON content to the file
      File configFile = File(configFilePath);
      await configFile.writeAsString(jsonString);

      // Update local configuration data
      authUsers = newConfig['security']['auth_users'];
      connection = newConfig['connection'];
    } catch (e) {
      print("Error updating app configuration: $e");
    }
  }
}












class Config {
  static String userEmail;
  static String userPassword;
  static int token;
  static int tokenExpiration;
  static int objectId;
  static String objectType;
  static String ssid;
  static String objectPassword;

  static void loadAppConfig() {
    // Load configuration data
    userEmail = 'operationshephaenergy@gmail.com';
    userPassword = '2773646';
    token = 9287373643;
    tokenExpiration = 1744033902;
    objectId = 1883747464;
    objectType = 'syntz';
    ssid = 'HSHSHSGGS';
    objectPassword = '77suueuu3773';
  }

  // You can add methods here to update the configuration if needed
}








class Config {
  static String userEmail;
  static String userPassword;
  static int token;
  static int tokenExpiration;
  static int objectId;
  static String objectType;
  static String ssid;
  static String objectPassword;

  static void setUserEmail(String email) {
    userEmail = email;
  }

  static void setUserPassword(String password) {
    userPassword = password;
  }

  static void setToken(int value) {
    token = value;
  }

  static void setTokenExpiration(int value) {
    tokenExpiration = value;
  }

  static void setObjectId(int id) {
    objectId = id;
  }

  static void setObjectType(String type) {
    objectType = type;
  }

  static void setSsid(String value) {
    ssid = value;
  }

  static void setObjectPassword(String password) {
    objectPassword = password;
  }
}









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

  static String get userEmail => _userEmail;
  static String get userPassword => _userPassword;
  static int get token => _token;
  static int get tokenExpiration => _tokenExpiration;
  static int get objectId => _objectId;
  static String get objectType => _objectType;
  static String get ssid => _ssid;
  static String get objectPassword => _objectPassword;

  static void setUserEmail(String email) {
    _userEmail = email;
  }

  static void setUserPassword(String password) {
    _userPassword = password;
  }

  static void setToken(int value) {
    _token = value;
  }

  static void setTokenExpiration(int value) {
    _tokenExpiration = value;
  }

  static void setObjectId(int id) {
    _objectId = id;
  }

  static void setObjectType(String type) {
    _objectType = type;
  }

  static void setSsid(String value) {
    _ssid = value;
  }

  static void setObjectPassword(String password) {
    _objectPassword = password;
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
      _userEmail = config['security']['auth_users']['operationshephaenergy@gmail.com']['email'];
      _userPassword = config['security']['auth_users']['operationshephaenergy@gmail.com']['password'];
      _token = config['security']['auth_users']['operationshephaenergy@gmail.com']['token'];
      _tokenExpiration = config['security']['auth_users']['operationshephaenergy@gmail.com']['token_expiration'];
      _objectId = config['connection']['id'];
      _objectType = config['connection']['object_type'];
      _ssid = config['connection']['ssid'];
      _objectPassword = config['connection']['password'];
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
    } catch (e) {
      print("Error updating app configuration: $e");
    }
  }
}








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
      _userEmail = config['security']['auth_users']['operationshephaenergy@gmail.com']['email'];
      _userPassword = config['security']['auth_users']['operationshephaenergy@gmail.com']['password'];
      _token = config['security']['auth_users']['operationshephaenergy@gmail.com']['token'];
      _tokenExpiration = config['security']['auth_users']['operationshephaenergy@gmail.com']['token_expiration'];
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
