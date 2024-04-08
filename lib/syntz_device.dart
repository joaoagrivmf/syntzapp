void _connectToDevice() async {
  // Make an API call to the Syntz device's pint endpoint
  String url = 'http://$_syntzIpAddress/pint';
  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      // Connection successful
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('Connected to Syntz device.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      // Connection failed
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to connect to Syntz device.'),
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
    }
  } catch (e) {
    // Error occurred during API call
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text('Failed to connect to Syntz device: $e'),
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
  }
}









import 'package:http/http.dart' as http;
import 'dart:convert';

class SyntzAPI {
  final String _syntzIpAddress;

  SyntzAPI(this._syntzIpAddress);

  Future<bool> _makeApiCall(String endpoint) async {
    String url = 'http://$_syntzIpAddress/$endpoint';
    try {
      final response = await http.get(Uri.parse(url));
      return response.statusCode == 200;
    } catch (e) {
      print('Error calling API: $e');
      return false;
    }
  }

  Future<bool> connect() async {
    return await _makeApiCall('connect');
  }

  Future<bool> disconnect() async {
    return await _makeApiCall('disconnect');
  }

  Future<bool> turnLightsOn() async {
    return await _makeApiCall('lights/on');
  }

  Future<bool> turnLightsOff() async {
    return await _makeApiCall('lights/off');
  }

  Future<bool> turnChargersOn() async {
    return await _makeApiCall('chargers/on');
  }

  Future<bool> turnChargersOff() async {
    return await _makeApiCall('chargers/off');
  }

  Future<bool> turnSoundOn() async {
    return await _makeApiCall('sound/on');
  }

  Future<bool> turnSoundOff() async {
    return await _makeApiCall('sound/off');
  }

  Future<bool> turnSoundBluetoothOn() async {
    return await _makeApiCall('sound/bluetooth/on');
  }

  Future<bool> turnSoundBluetoothOff() async {
    return await _makeApiCall('sound/bluetooth/off');
  }

  Future<bool> playSound(String soundName) async {
    return await _makeApiCall('sound/play/$soundName');
  }

  Future<bool> turnMonitorOn() async {
    return await _makeApiCall('monitor/on');
  }

  Future<bool> turnMonitorOff() async {
    return await _makeApiCall('monitor/off');
  }

  Future<int> getBatteryUsage() async {
    String url = 'http://$_syntzIpAddress/battery/usage';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return int.parse(response.body);
      } else {
        return -1; // Error occurred
      }
    } catch (e) {
      print('Error getting battery usage: $e');
      return -1;
    }
  }

  Future<int> getPowerUsage() async {
    String url = 'http://$_syntzIpAddress/power/usage';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return int.parse(response.body);
      } else {
        return -1; // Error occurred
      }
    } catch (e) {
      print('Error getting power usage: $e');
      return -1;
    }
  }

  Future<int> getChargeUsage() async {
    String url = 'http://$_syntzIpAddress/charge/usage';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return int.parse(response.body);
      } else {
        return -1; // Error occurred
      }
    } catch (e) {
      print('Error getting charge usage: $e');
      return -1;
    }
  }
}
