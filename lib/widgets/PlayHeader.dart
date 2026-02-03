import 'package:dhrumit/Screens/HomeScreen.dart';
import 'package:dhrumit/theme/font.dart';
import 'package:dhrumit/widgets/ButtonWithIcon.dart';
import 'package:dhrumit/widgets/TextWithIcons.dart';
import 'package:dhrumit/widgets/outlined_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Playheader  extends StatelessWidget{


  void showAppBottomSheet({
    required BuildContext context,
  }) {


    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Popup",
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.55,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.deepPurple, Colors.pink],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 10,
                  children: [
                    /// Title
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: OutlinedText(
                        text: "PAUSE",
                        enableStroke: true,
                        style: AppTextStyles.headingXL,
                      ),
                    ),

                    /// Controls row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OutlinedText(
                          text: "MUSIC",
                          enableStroke: true,
                          style: AppTextStyles.headingL,
                        ),
                        Buttonwithicon(
                          icon: const Icon(
                            FontAwesomeIcons.music,
                            color: Colors.white,
                            size: 18,
                          ),
                          action: () {},
                          size: "normal",

                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OutlinedText(
                          text: "SOUND FX",
                          enableStroke: true,
                          style: AppTextStyles.headingL,
                        ),
                        Buttonwithicon(
                          icon: const Icon(
                            FontAwesomeIcons.volumeHigh,
                            color: Colors.white,
                            size: 18,
                          ),
                          action: () {},
                          size: "normal",

                        ),
                      ],
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Buttonwithicon(
                          icon: const Icon(
                            FontAwesomeIcons.house,
                            color: Colors.white,
                          ),
                          action: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                            );
                          },
                          size: "big",

                        ),
                        Buttonwithicon(
                          icon: const Icon(
                            FontAwesomeIcons.play,
                            color: Colors.white,
                          ),
                          action: () {},
                          size: "big",

                        ),
                        Buttonwithicon(
                          icon: const Icon(
                            FontAwesomeIcons.rotateRight,
                            color: Colors.white,
                          ),
                          action: () {},
                          size: "big",

                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (_, animation, __, child) {
        return ScaleTransition(
          scale: CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutBack,
          ),
          child: child,
        );
      },
    );



  }




  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Container(
        height: 80,
        width:  MediaQuery.of(context).size.width * 0.95,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusGeometry.only(bottomLeft: Radius.circular(20) , bottomRight: Radius.circular(20)),
          gradient: LinearGradient(
              begin: AlignmentGeometry.topCenter,
              end: AlignmentGeometry.bottomCenter,
              colors: [Colors.red , Colors.redAccent ,  Colors.orangeAccent,]),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20 , right: 20 , bottom: 15),
          child: SizedBox(
            height: 35,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Buttonwithicon(icon: Icon(
                  FontAwesomeIcons.pause,
                  color: Colors.white,
                  size: 18,
                ),action: () => showAppBottomSheet(
                  context: context,
                ),
                  size: "normal",
                ) ,
                Row(
                  spacing: 10,
                  children: [
                    Textwithicons(
                      icon:  Icon(
                        FontAwesomeIcons.pause,
                        color: Colors.white,
                        size: 18,
                      ), text: "0",
                    ),
                    Textwithicons(
                      icon:  Icon(
                        FontAwesomeIcons.pause,
                        color: Colors.white,
                        size: 18,
                      ), text: "13:43",
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}