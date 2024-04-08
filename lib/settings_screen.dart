import 'package:flutter/material.dart';
import 'package:your_app_name/parent_screen.dart';

class SettingsScreen extends StatelessWidget {
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
                  // Handle lights button press
                },
                child: Text('Lights'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle lights button press
                },
                child: Text('Lights'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle lights button press
                },
                child: Text('Lights'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle lights button press
                },
                child: Text('Lights'),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Handle chargers button press
                },
                child: Text('Chargers'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle chargers button press
                },
                child: Text('Chargers'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle chargers button press
                },
                child: Text('Chargers'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle chargers button press
                },
                child: Text('Chargers'),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Handle sound button press
                },
                child: Text('Sound'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle sound button press
                },
                child: Text('Sound'),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Handle monitor button press
                },
                child: Text('Monitor'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}









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

  // Method to toggle lights buttons
  void toggleLightsButtons() {
    setState(() {
      // If the fourth button is ON, set all lights buttons to its status
      if (lightsButton4On) {
        lightsButton1On = lightsButton2On = lightsButton3On = lightsButton4On;
      } else {
        // Otherwise, only toggle the pressed button
        lightsButton1On = !lightsButton1On;
      }
    });
  }

  // Method to toggle chargers buttons
  void toggleChargersButtons() {
    setState(() {
      // If the fourth button is ON, set all chargers buttons to its status
      if (chargersButton4On) {
        chargersButton1On = chargersButton2On =
            chargersButton3On = chargersButton4On;
      } else {
        // Otherwise, only toggle the pressed button
        chargersButton1On = !chargersButton1On;
      }
    });
  }

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
                style: lightsButton1On ? null : ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                ),
                child: Text('Lights 1'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    // Toggle lights button 2
                    lightsButton2On = !lightsButton2On;
                  });
                },
                style: lightsButton2On ? null : ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                ),
                child: Text('Lights 2'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    // Toggle lights button 3
                    lightsButton3On = !lightsButton3On;
                  });
                },
                style: lightsButton3On ? null : ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                ),
                child: Text('Lights 3'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    // Toggle lights button 4 and all other lights buttons
                    lightsButton4On = !lightsButton4On;
                    lightsButton1On = lightsButton2On = lightsButton3On = lightsButton4On;
                  });
                },
                style: lightsButton4On ? null : ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                ),
                child: Text('All Lights'),
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
                    // Toggle chargers button 1
                    chargersButton1On = !chargersButton1On;
                  });
                },
                style: chargersButton1On ? null : ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                ),
                child: Text('Chargers 1'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    // Toggle chargers button 2
                    chargersButton2On = !chargersButton2On;
                  });
                },
                style: chargersButton2On ? null : ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                ),
                child: Text('Chargers 2'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    // Toggle chargers button 3
                    chargersButton3On = !chargersButton3On;
                  });
                },
                style: chargersButton3On ? null : ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                ),
                child: Text('Chargers 3'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    // Toggle chargers button 4 and all other chargers buttons
                    chargersButton4On = !chargersButton4On;
                    chargersButton1On = chargersButton2On = chargersButton3On = chargersButton4On;
                  });
                },
                style: chargersButton4On ? null : ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                ),
                child: Text('All Chargers'),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Handle sound button press
                },
                child: Text('Sound'),
              ),
             










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
