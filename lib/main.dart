import 'package:dhrumit/Screens/CardType.dart';
import 'package:dhrumit/Screens/HomeScreen.dart';
import 'package:dhrumit/Screens/PlayScreen.dart';
import 'package:dhrumit/theme/theme.dart';
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
      home: HomeScreen(),
    );
  }
}

