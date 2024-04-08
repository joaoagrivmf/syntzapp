import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final Function() onLoginPressed;
  final Function() onPairingPressed;
  final Function() onHomePressed;
  final Function() onSettingsPressed;
  final Function() onMonitoringPressed;

  BottomNavBar({
    @required this.onLoginPressed,
    @required this.onPairingPressed,
    @required this.onHomePressed,
    @required this.onSettingsPressed,
    @required this.onMonitoringPressed,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Icon(Icons.login),
            onPressed: onLoginPressed,
          ),
          IconButton(
            icon: Icon(Icons.bluetooth),
            onPressed: onPairingPressed,
          ),
          IconButton(
            icon: Icon(Icons.home),
            onPressed: onHomePressed,
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: onSettingsPressed,
          ),
          IconButton(
            icon: Icon(Icons.monitor),
            onPressed: onMonitoringPressed,
          ),
        ],
      ),
    );
  }
}









import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final BuildContext context;

  BottomNavBar({@required this.context});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Icon(Icons.login),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.bluetooth),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PairingScreen()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              // Do nothing as we are already on the home screen
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.monitor),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MonitorScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
