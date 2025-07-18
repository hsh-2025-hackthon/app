import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const OurGoApp());
}

class OurGoApp extends StatelessWidget {
  const OurGoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OurGO',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
    );
  }
}
