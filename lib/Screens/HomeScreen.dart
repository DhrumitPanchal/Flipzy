import 'package:dhrumit/theme/font.dart';
import 'package:dhrumit/widgets/button.dart';
import 'package:dhrumit/widgets/outlined_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🔹 SVG Background
          Positioned.fill(
            child: Image.asset(
              'assets/images/subtle-prism.png',
              fit: BoxFit.cover,
            ),
          ),

          // 🔹 Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Title
                  SizedBox(
                      height: 140,
                      child: Image.asset("assets/images/Logo.png")),
                  // Buttons
                  Column(
                    children: const [
                      SizedBox(height: 18),
                      Button(text: "QUICK GAME", action: null , beginColor: Colors.lightBlue, endColor: Colors.blue,),
                      SizedBox(height: 18),
                      Button(text: "QUEST", action: null , beginColor: Colors.greenAccent, endColor: Colors.green,),
                      SizedBox(height: 18),
                      Button(text: "2 PLAYERS", action: null , beginColor: Colors.deepPurpleAccent, endColor: Colors.deepPurple,),
                      SizedBox(height: 18),
                      Button(text: "SHOP", action: null , beginColor: Colors.orangeAccent, endColor: Colors.deepOrange,),
                    ],
                  ),

                  // Settings
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Icon(
                        FontAwesomeIcons.gear,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
