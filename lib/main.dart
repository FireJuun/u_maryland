import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'U Maryland',
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFFE21833),
      ),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('text'),
          ),
          body: const Center(
              child: Text(
            'barebones',
            style: TextStyle(fontSize: 64),
          ))),
    );
  }
}
