import 'package:Flipzy/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';

class Splasescreen extends StatefulWidget {
  @override
  State<Splasescreen> createState() => _SplasescreenState();
}

class _SplasescreenState extends State<Splasescreen> {
  double opacity = 0;

  @override
  void initState() {
    super.initState();

    // Fade in
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        opacity = 1;
      });
    });

    // Navigate after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/subtle-prism.png',
            fit: BoxFit.cover,
          ),

          Center(
            child: AnimatedOpacity(
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              opacity: opacity,
              child: SizedBox(
                height: 240,
                child: Image.asset(
                  'assets/forground.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
