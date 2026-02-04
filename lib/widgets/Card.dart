import 'package:Flipzy/models/game_card.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final GameCard data;
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
            // FRONT IMAGE
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Image.asset(
                  data.image,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            // BACK OVERLAY
            AnimatedOpacity(
              opacity: data.isFlipped || data.isMatched ? 0 : 1,
              duration: const Duration(milliseconds: 250),
              child: Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white, width: 4),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/wavey-fingerprint.png',
                    fit: BoxFit.cover,
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
