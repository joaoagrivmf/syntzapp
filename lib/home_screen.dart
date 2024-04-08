import 'package:flutter/material.dart';
import 'package:your_app_name/parent_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ParentScreen(
      title: 'Home',
      subtitle: 'Welcome to the Home Screen',
      selectedIndex: 2, // Example selected index
      child: Center(
        child: Text('Home Screen Content'),
      ),
    );
  }
}
