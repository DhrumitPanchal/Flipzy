import 'package:dhrumit/theme/font.dart';
import 'package:dhrumit/widgets/outlined_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {

  final String text;
  final  action;
  final  beginColor;
  final  endColor;



  const Button({
    super.key,
    required this.text,
    required this.action,
    required this.beginColor,
    required this.endColor
 });


  static const List<Shadow> _shadow = [
    Shadow(
      offset: Offset(-3, 3),
      blurRadius: 2,
      color: Color(0xFF000000),
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
        height: 50,
        decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: AlignmentGeometry.topCenter,
            end: AlignmentGeometry.bottomCenter,
            colors: [beginColor, endColor]),
        borderRadius:  BorderRadiusGeometry.all(Radius.circular(12)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x99000000), // 20% black
            offset: Offset(0, 4),
            blurRadius: 1,
          ),
        ],
      ),
      child:  OutlinedText(
      text: text ,
      style: AppTextStyles.headingL,
      enableShadow: true ,
      enableStroke: true,
    )

    );
  }
}