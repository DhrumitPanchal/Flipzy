import 'package:dhrumit/theme/font.dart';
import 'package:dhrumit/widgets/ButtonWithIcon.dart';
import 'package:dhrumit/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:dhrumit/widgets/button.dart';
import 'package:dhrumit/widgets/outlined_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Cardtype extends StatelessWidget {

  final entries = <String>['A', 'B', 'C','A', 'B', 'C','A', 'B', 'C'];
  final   titles = <String>["Animals", "Animals", "Animals" ,"Animals","Animals","Animals","Animals" ,"Animals", "Animals" ,"Animals","Animals","Animals"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🔹 SVG Background
          Container(
            height: double.infinity,
            child: Positioned.fill(
              child: Image.asset(
                'assets/images/subtle-prism.png',
                fit: BoxFit.cover,
              ),
            ),
          ),

          // 🔹 Content
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 500,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius:  BorderRadiusGeometry.all(Radius.circular(12)),
                      color: Colors.black,
                    )
                    ,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 14 , bottom: 14),
                      child: ListView.builder(

                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 20 , right: 20 , top: 4 , bottom: 6),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadiusGeometry.all(Radius.circular(6))
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(6),
                                    child: Image.asset('assets/images/animals/lion.png'),
                                  ),
                                ) ,
                                Button(
                                  text: titles[index] ,
                                  action: () {},
                                  beginColor: Colors.deepPurpleAccent,
                                  endColor: Colors.purpleAccent,
                                )
                              ]),
                            );
                          },
                          itemCount: titles.length),
                    )
                    ),
                  Buttonwithicon(icon: Icon(
                    FontAwesomeIcons.music,
                    color: Colors.white,
                    size: 18,
                  ), action: () {}, size: "normal")
                ],
              ),
              ),
            ),

        ],
      ),
    );
  }
}