import 'package:Flipzy/theme/font.dart';
import 'package:Flipzy/widgets/outlined_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Textwithicons extends StatelessWidget {

  final text;
  final icon;

  const Textwithicons({
    super.key,
   required this.text,
    required this.icon
 });

  @override
  Widget build(BuildContext context) {
   return Stack(
     children: [
       Container(
         height: 35,
         width: 90,
         decoration: BoxDecoration(
           color: Colors.black54,
           borderRadius: BorderRadiusGeometry.all(Radius.circular(8)),
         ),
         child: Padding(
           padding: const EdgeInsets.only(left: 4 ,right: 6),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               icon,
               Padding(
                 padding: const EdgeInsets.only(top: 3),
                 child: OutlinedText(
                   text: text ,
                   style: AppTextStyles.headingL,
                   enableStroke: true,
                 ),
               )
             ],
           ),
         ),
       )
     ],
   );
  }
}