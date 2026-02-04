import 'package:Flipzy/Screens/HomeScreen.dart';
import 'package:Flipzy/Screens/SplaseScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: AppTheme.Theme,
      home: Splasescreen(),
    );
  }
}

