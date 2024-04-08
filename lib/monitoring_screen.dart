import 'package:flutter/material.dart';
import 'package:syntzapp/parent_screen.dart';
//import 'package:syntzapp/syntz_device.dart'; // Assuming the Syntz class is defined in this file

class MonitoringScreen extends StatefulWidget {
  @override
  _MonitoringScreenState createState() => _MonitoringScreenState();
}

class _MonitoringScreenState extends State<MonitoringScreen> {
  bool nowButtonOn = false;
  bool todayButtonOn = false;
  bool allButtonOn = false;

  double batteryValue = 0;
  double powerValue = 0;
  double usageValue = 0;

  @override
  Widget build(BuildContext context) {
    return ParentScreen(
      title: 'Monitoring',
      subtitle: 'Monitor Syntz Status',
      child: Column(
        children: [
          const SizedBox(height: 20),
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
                style: nowButtonOn
                    ? null
                    : ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.grey),
                      ),
                child: const Text('Now'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    todayButtonOn = !todayButtonOn;
                    updateMonitoringValues();
                  });
                },
                style: todayButtonOn
                    ? null
                    : ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.grey),
                      ),
                child: const Text('Today'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    allButtonOn = !allButtonOn;
                    updateMonitoringValues();
                  });
                },
                style: allButtonOn
                    ? null
                    : ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.grey),
                      ),
                child: const Text('All'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('Battery:'),
              Text('$batteryValue AMPs'),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('Power:'),
              Text('$powerValue KWH'),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('Usage:'),
              Text('$usageValue KWH'),
            ],
          ),
        ],
      ),
    );
  }

  void updateMonitoringValues() {
    if (nowButtonOn) {
      print('todo');
      // batteryValue = SyntzAPI.getBatteryUsage();
      // powerValue = Syntz.getPowerNow();
      // usageValue = Syntz.getUsageNow();
    } else if (todayButtonOn) {
      print('todo');
      // batteryValue = Syntz.getBatteryToday();
      // powerValue = Syntz.getPowerToday();
      // usageValue = Syntz.getUsageToday();
    } else if (allButtonOn) {
      print('todo');
      // batteryValue = Syntz.getBatteryAll();
      // powerValue = Syntz.getPowerAll();
      // usageValue = Syntz.getUsageAll();
    }
  }
}
