import 'package:flutter/material.dart';

class ParentScreen extends StatelessWidget {
  final Widget child;
  final String title;
  final String subtitle;
  final int selectedIndex;

  ParentScreen({
    required this.child,
    required this.title,
    required this.subtitle,
    this.selectedIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          // Menu bar implementation here
          // Set of 5 circles implementation here
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
          ),
          Expanded(child: child),
          // Navigation bar implementation here
          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: index == selectedIndex
                        ? Colors.green
                        : Colors.lightGreen,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
