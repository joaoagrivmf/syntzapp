import 'package:flutter/material.dart';

class PairingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pairing Screen"),
      ),
      body: Center(
        child: Text("Pairing Screen Content"),
      ),
    );
  }
}









import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PairingScreen extends StatefulWidget {
  @override
  _PairingScreenState createState() => _PairingScreenState();
}

class _PairingScreenState extends State<PairingScreen> {
  QRViewController _controller;
  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');
  String _syntzId = '';
  String _syntzIpAddress = '';
  String _syntzSsid = '';
  String _syntzPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pairing'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: QRView(
              key: _qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                'Syntz ID: $_syntzId',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Cancel button
                  },
                  child: Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _connectToDevice(); // Connect button
                  },
                  child: Text('Connect'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this._controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        _parseQRCodeData(scanData.code);
      });
    });
  }

  void _parseQRCodeData(String data) {
    // Parse the QR code data to extract Syntz information
    // Example format: syntz_id=12345&ip_address=192.168.0.1&ssid=myssid&password=mypassword
    Map<String, String> info = {};
    List<String> parts = data.split('&');
    for (String part in parts) {
      List<String> pair = part.split('=');
      info[pair[0]] = pair[1];
    }
    setState(() {
      _syntzId = info['syntz_id'];
      _syntzIpAddress = info['ip_address'];
      _syntzSsid = info['ssid'];
      _syntzPassword = info['password'];
    });
  }

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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
