import 'package:Flipzy/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';

class Splasescreen extends StatefulWidget {
  @override
  State<Splasescreen> createState() => _SplasescreenState();
}

class _SplasescreenState extends State<Splasescreen>
    with SingleTickerProviderStateMixin {
  double opacity = 0;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..forward();

    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() => opacity = 1);
    });

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomeScreen()),
      );
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          /// BACKGROUND IMAGE
          Image.asset(
            'assets/images/subtle-prism.png', // your background
            fit: BoxFit.cover,
          ),

          /// DARK OVERLAY (optional – remove if not needed)
          Container(color: Colors.black.withOpacity(0.2)),

          /// CONTENT
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedOpacity(
                    opacity: opacity,
                    duration: const Duration(seconds: 1),
                    child: Image.asset(
                      'assets/forground.png', // logo image
                      height: 200,
                    ),
                  ),

                  const SizedBox(height: 40),

                  SizedBox(
                    width: 200,
                    child: AnimatedBuilder(
                      animation: controller,
                      builder: (_, __) {
                        return LinearProgressIndicator(
                          value: controller.value,
                          minHeight: 8,
                          backgroundColor: Colors.white30,
                          valueColor:
                          const AlwaysStoppedAnimation(Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        );
                      },
                    ),
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
