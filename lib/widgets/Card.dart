import 'package:dhrumit/Screens/PlayScreen.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final CardData data;
  final VoidCallback onTap;

  const CardWidget({
    super.key,
    required this.data,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Stack(
          children: [
            /// 🔹 Background image (from parent)
            Padding(
              padding: const EdgeInsets.all(30),
              child: Positioned.fill(
                child: Image.asset(
                  data.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            /// 🔹 Overlay (controlled by parent)
            Positioned.fill(
              child: AnimatedOpacity(
                opacity: data.showOverlay ? 1 : 0,
                duration: const Duration(milliseconds: 250),
                child: IgnorePointer(
                  ignoring: !data.showOverlay,
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 4),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Image.asset(
                      'assets/images/wavey-fingerprint.png',
                      repeat: ImageRepeat.repeatY,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
