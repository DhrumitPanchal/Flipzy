import 'package:Flipzy/Screens/HomeScreen.dart';
import 'package:Flipzy/data/card_categories.dart';
import 'package:Flipzy/data/cards_data.dart';
import 'package:Flipzy/widgets/ButtonWithIcon.dart';
import 'package:Flipzy/Screens/PlayScreen.dart';
import 'package:Flipzy/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';

final random = Random();

class Cardtype extends StatelessWidget {

 int getRandomCardNumber(categoryCards) {
   final maxUnique = categoryCards.length;

   final randomUniqueCards = random.nextInt(maxUnique - 1) + 2;
    return randomUniqueCards;
 }
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


          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 14,
                  children: [
                    SizedBox(
                        height: 140,
                        child: Image.asset("assets/images/Logo.png")),
                    Container(
                      height: 500,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius:  BorderRadiusGeometry.all(Radius.circular(12)),
                        color: Colors.black45,
                      )
                      ,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 14 , bottom: 14),
                        child: ListView.builder(

                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 20 , right: 20 , top: 4 , bottom: 6),
                                child:  Container(
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
                                          child: Image.asset(cardCategories[index].image),
                                        ),
                                      ) ,
                                      Button(
                                        text: cardCategories[index].title ,
                                        action: () {

                                          Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Playscreen(
                                              totalCards: getRandomCardNumber(getCardsByType(cardCategories[index].type)),
                                              selectedType:  cardCategories[index].type,
                                            ),
                                          ),
                                        );},
                                        beginColor: Colors.deepPurpleAccent,
                                        endColor: Colors.purpleAccent,
                                      )
                                    ]),
                                  ),

                              );
                            },
                            itemCount: cardCategories.length),
                      )
                      ),
                    Buttonwithicon(icon: Icon(
                      FontAwesomeIcons.house,
                      color: Colors.white,
                      size: 18,
                    ), action: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    }, size: "normal")
                  ],
                ),
              ),
              ),
            ),

        ],
      ),
    );
  }
}