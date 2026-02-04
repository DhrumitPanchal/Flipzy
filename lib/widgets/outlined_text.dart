import 'package:flutter/material.dart';
import 'package:Flipzy/theme/colors.dart';

class OutlinedText extends StatelessWidget {
  final String text;
  final TextStyle style;

  // ONLY runtime toggles
  final bool enableStroke;
  final bool enableShadow;

  const OutlinedText({
    super.key,
    required this.text,
    required this.style,
    this.enableStroke = false,
    this.enableShadow = false,
  });

  // ---- STATIC CONFIG (design system) ----

  static const double _strokeWidth = 1.5;
  static const Color _strokeColor = Colors.black;

  static const List<Shadow> _shadow = [
    Shadow(
      offset: Offset(-3, 3),

      blurRadius: 2,
      color: Color(0xFF000000),

    ),
  ];

  @override
  Widget build(BuildContext context) {
    final TextStyle fillStyle =
    enableShadow ? style.copyWith(shadows: _shadow) : style;

    // No stroke → single Text (best performance)
    if (!enableStroke) {
      return Text(text, style: fillStyle);
    }

    // Stroke + fill
    return Stack(
      alignment: Alignment.center,
      children: [
        // Stroke layer
        Text(
          text,
          style: style.copyWith(
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = _strokeWidth
              ..color = _strokeColor,
          ),
        ),

        // Fill layer (+ optional shadow)
        Text(
          text,
          style: fillStyle,
        ),
      ],
    );
  }
}
