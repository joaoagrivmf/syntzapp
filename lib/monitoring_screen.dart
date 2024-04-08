import 'package:flutter/material.dart';
import 'package:your_app_name/parent_screen.dart';

class MonitoringScreen extends StatefulWidget {
  @override
  _MonitoringScreenState createState() => _MonitoringScreenState();
}

class _MonitoringScreenState extends State<MonitoringScreen> {
  bool nowButtonOn = false;
  bool todayButtonOn = false;
  bool allButtonOn = false;

  @override
  Widget build(BuildContext context) {
    return ParentScreen(
      title: 'Monitoring',
      subtitle: 'Monitor Syntz Status',
      child: Column(
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    nowButtonOn = !nowButtonOn;
                  });
                },
                style: nowButtonOn ? null : ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                ),
                child: Text('Now'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    todayButtonOn = !todayButtonOn;
                  });
                },
                style: todayButtonOn ? null : ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                ),
                child: Text('Today'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    allButtonOn = !allButtonOn;
                  });
                },
                style: allButtonOn ? null : ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                ),
                child: Text('All'),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Battery:'),
              Text('AMPs'),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Power:'),
              Text('KWH'),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Usage:'),
              Text('KWH'),
            ],
          ),
        ],
      ),
    );
  }
}










import 'package:flutter/material.dart';
import 'package:your_app_name/parent_screen.dart';
import 'package:your_app_name/syntz.dart'; // Assuming the Syntz class is defined in this file

class MonitoringScreen extends StatefulWidget {
  @override
  _MonitoringScreenState createState() => _MonitoringScreenState();
}

class _MonitoringScreenState extends State<MonitoringScreen> {
  bool nowButtonOn = false;
  bool todayButtonOn = false;
  bool allButtonOn = false;

  double batteryValue;
  double powerValue;
  double usageValue;

  @override
  Widget build(BuildContext context) {
    return ParentScreen(
      title: 'Monitoring',
      subtitle: 'Monitor Syntz Status',
      child: Column(
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    nowButtonOn = !nowButtonOn;
                    updateMonitoringValues();
                  });
                },
                style: nowButtonOn ? null : ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                ),
                child: Text('Now'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    todayButtonOn = !todayButtonOn;
                    updateMonitoringValues();
                  });
                },
                style: todayButtonOn ? null : ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                ),
                child: Text('Today'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    allButtonOn = !allButtonOn;
                    updateMonitoringValues();
                  });
                },
                style: allButtonOn ? null : ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                ),
                child: Text('All'),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Battery:'),
              Text('$batteryValue AMPs'),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Power:'),
              Text('$powerValue KWH'),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Usage:'),
              Text('$usageValue KWH'),
            ],
          ),
        ],
      ),
    );
  }

  void updateMonitoringValues() {
    if (nowButtonOn) {
      batteryValue = Syntz.getBatteryNow();
      powerValue = Syntz.getPowerNow();
      usageValue = Syntz.getUsageNow();
    } else if (todayButtonOn) {
      batteryValue = Syntz.getBatteryToday();
      powerValue = Syntz.getPowerToday();
      usageValue = Syntz.getUsageToday();
    } else if (allButtonOn) {
      batteryValue = Syntz.getBatteryAll();
      powerValue = Syntz.getPowerAll();
      usageValue = Syntz.getUsageAll();
    }
  }
}
