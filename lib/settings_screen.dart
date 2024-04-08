import 'package:flutter/material.dart';
import 'package:your_app_name/parent_screen.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // States for the lights buttons
  bool lightsButton1On = false;
  bool lightsButton2On = false;
  bool lightsButton3On = false;
  bool lightsButton4On = false;

  // States for the chargers buttons
  bool chargersButton1On = false;
  bool chargersButton2On = false;
  bool chargersButton3On = false;
  bool chargersButton4On = false;

  // States for the sound buttons
  bool soundButton1On = false;
  bool soundButton2On = false;

  // State for the monitor button
  bool monitorButtonOn = false;

  @override
  Widget build(BuildContext context) {
    return ParentScreen(
      title: 'Settings',
      subtitle: 'Configure Syntz Settings',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    // Toggle lights button 1
                    lightsButton1On = !lightsButton1On;
                  });
                },
                style: lightsButton1On
                    ? null
                    : ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.grey),
                      ),
                child: Text('Lights 1'),
              ),
              // Add the rest of the lights buttons similarly
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    // Toggle chargers button 1
                    chargersButton1On = !chargersButton1On;
                  });
                },
                style: chargersButton1On
                    ? null
                    : ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.grey),
                      ),
                child: Text('Chargers 1'),
              ),
              // Add the rest of the chargers buttons similarly
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    // Toggle sound button 1
                    soundButton1On = !soundButton1On;
                  });
                },
                style: soundButton1On
                    ? null
                    : ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.grey),
                      ),
                child: Text('Sound 1'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    // Toggle sound button 2
                    soundButton2On = !soundButton2On;
                  });
                },
                style: soundButton2On
                    ? null
                    : ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.grey),
                      ),
                child: Text('Sound 2'),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    // Toggle monitor button
                    monitorButtonOn = !monitorButtonOn;
                  });
                },
                style: monitorButtonOn
                    ? null
                    : ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.grey),
                      ),
                child: Text('Monitor'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
