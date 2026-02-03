
import 'package:dhrumit/widgets/Card.dart';
import 'package:dhrumit/widgets/PlayHeader.dart';

import 'package:flutter/cupertino.dart';


import 'package:flutter/material.dart';

class CardData {
  final String imagePath;
  bool showOverlay;

  CardData({
    required this.imagePath,
    this.showOverlay = true,
  });
}

class Playscreen extends StatefulWidget {
  @override
  State<Playscreen> createState() => _PlayscreenState();
}

class _PlayscreenState extends State<Playscreen> {
  final CardData cardData = CardData(
    imagePath: 'assets/images/animals/lion.png',
  );

  void _toggleOverlay() {
    setState(() {
      cardData.showOverlay = !cardData.showOverlay;
    });
  }

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
          Column(
              crossAxisAlignment:  CrossAxisAlignment.end,
              children: [
                Playheader(),
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: Container(
                    height:  MediaQuery.of(context).size.height * 0.80,
                    width:  MediaQuery.of(context).size.width * 0.95,
                    decoration: BoxDecoration(

                      borderRadius: BorderRadiusGeometry.all(Radius.circular(8)),
                    ),
                    child: GridView.count( primary: false,
                        padding: const EdgeInsets.all(20),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2,

                    children: [
                      CardWidget(
                        data: cardData,
                        onTap: _toggleOverlay,
                      ),
                      CardWidget(
                        data: cardData,
                        onTap: _toggleOverlay,
                      ),
                      CardWidget(
                        data: cardData,
                        onTap: _toggleOverlay,
                      ),
                      CardWidget(
                        data: cardData,
                        onTap: _toggleOverlay,
                      ),
                      
                    ],),
                ),

                )
              ],
            )


        ],
      ),
    );
  }
}