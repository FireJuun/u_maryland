import 'package:flutter/material.dart';

import 'src/src.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'U Maryland',
      theme: appTheme(),
      home: const HomeView(),
    );
  }
}
