import 'package:Flipzy/Screens/HomeScreen.dart';
import 'package:Flipzy/services/audio_service.dart';
import 'package:Flipzy/theme/font.dart';
import 'package:Flipzy/widgets/ButtonWithIcon.dart';
import 'package:Flipzy/widgets/TextWithIcons.dart';
import 'package:Flipzy/widgets/outlined_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Playheader  extends StatelessWidget{
  final int timeLeft;
  final int score;

  final VoidCallback onPause;
  final VoidCallback onResume;
  final VoidCallback onRestart;
  final VoidCallback onHome;

  const Playheader({
    super.key,
    required this.timeLeft,
    required this.score,
    required this.onPause,
    required this.onResume,
    required this.onRestart,
    required this.onHome,
  });



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
        return StatefulBuilder(builder: (context , setState) {
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
                            icon: Icon(
                              AudioService.musicEnabled
                                  ? FontAwesomeIcons.music
                                  : FontAwesomeIcons.volumeXmark,
                              color: Colors.white,
                              size: 18,
                            ),
                            action: () {
                              AudioService.toggleMusic();
                              setState(() {}); // 👈 rebuild dialog instantly

                              (context as Element).markNeedsBuild();
                            },
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
                            icon: Icon(
                              AudioService.sfxEnabled
                                  ? FontAwesomeIcons.volumeHigh
                                  : FontAwesomeIcons.volumeXmark,
                              color: Colors.white,
                              size: 18,
                            ),
                            action: () {
                              AudioService.toggleSfx();
                              setState(() {}); // 👈 rebuild dialog instantly

                              (context as Element).markNeedsBuild();
                            },
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
                            action:() => onHome(),
                            size: "big",

                          ),
                          Buttonwithicon(
                            icon: const Icon(
                              FontAwesomeIcons.play,
                              color: Colors.white,
                            ),
                            action: () {
                              onResume();
                              Navigator.pop(context);
                            },
                            size: "big",

                          ),
                          Buttonwithicon(
                            icon: const Icon(
                              FontAwesomeIcons.rotateRight,
                              color: Colors.white,
                            ),
                            action: () {
                              onRestart();
                              Navigator.pop(context);
                            },
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
        });
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
        height: 90,
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
                ),action: () {
                 onPause();
                showAppBottomSheet(context: context);
                },
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
                      ), text: "${score}",
                    ),
                    Textwithicons(
                      icon:  Icon(
                        FontAwesomeIcons.pause,
                        color: Colors.white,
                        size: 18,
                      ), text: "${timeLeft}",
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