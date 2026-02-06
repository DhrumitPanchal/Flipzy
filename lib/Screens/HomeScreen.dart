import 'package:Flipzy/widgets/button.dart';
import 'package:Flipzy/Screens/CardType.dart';
import 'package:Flipzy/theme/font.dart';
import 'package:Flipzy/widgets/ButtonWithIcon.dart';
import 'package:Flipzy/widgets/button.dart';
import 'package:Flipzy/widgets/outlined_text.dart';
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
                    children:  [
                      SizedBox(height: 18),
                      Button(
                        text: "QUICK GAME",
                        beginColor: Colors.lightBlue,
                        endColor: Colors.blue,
                        action: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Cardtype(),
                            ),
                          );
                        }
                        ),
                      SizedBox(height: 18),
                      Opacity(
                        opacity: 0.6,
                        child: Button(text: "QUEST", action: null , beginColor: Colors.greenAccent, endColor: Colors.green,),
                      ),SizedBox(height: 18),
                      Opacity(
                          opacity: 0.6,
                          child: Button(text: "2 PLAYERS", action: null , beginColor: Colors.deepPurpleAccent, endColor: Colors.deepPurple,)),
                      ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      Buttonwithicon(icon: Icon(
                        FontAwesomeIcons.gear,
                        color: Colors.white,
                        size: 18,
                      ), action: (){}, size: "normal")
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
