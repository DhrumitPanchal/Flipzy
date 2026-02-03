import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Buttonwithicon extends StatelessWidget {

  final icon;
  final action;
  final  size;

  const Buttonwithicon({
    super.key,
    required this.icon,
    required this.action,
    required this.size
});


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: action,
      child: Stack(
        children: [
          Container(
            height: size == "normal" ? 35 : 45,
            width: size == "normal" ? 35 : 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadiusGeometry.all(Radius.circular(10)),
                border: Border.all(width: 2.5 , color: Colors.white70),
                gradient: LinearGradient(
                begin: AlignmentGeometry.topCenter,
                end: AlignmentGeometry.bottomCenter,
                colors: [Colors.orangeAccent, Colors.redAccent , Colors.red]),
            ),
      
          ),
         SizedBox(
           height: size == "normal" ? 35 : 45,
           width: size == "normal" ? 35 : 45,
           child: icon
         ),
      
        ]
      ),
    );
  }
}


