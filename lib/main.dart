import 'package:Flipzy/Screens/HomeScreen.dart';
import 'package:Flipzy/Screens/SplaseScreen.dart';
import 'package:flutter/material.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      builder: (context, child) {
        return ColoredBox(
          color: const Color(0xFFab41e0), // PURPLE ROOT
          child: child!,
        );
      },

      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFab41e0),
      ),

      home:  Splasescreen(),
    );

  }
}

