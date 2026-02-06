
import 'dart:async';
import 'dart:math';

import 'package:Flipzy/Screens/HomeScreen.dart';
import 'package:Flipzy/data/cards_data.dart';
import 'package:Flipzy/models/game_card.dart';
import 'package:Flipzy/services/audio_service.dart';
import 'package:Flipzy/theme/font.dart';
import 'package:Flipzy/widgets/ButtonWithIcon.dart';
import 'package:Flipzy/widgets/Card.dart';
import 'package:Flipzy/widgets/PlayHeader.dart';
import 'package:Flipzy/widgets/outlined_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

  final CardType selectedType;
  final int totalCards;

  const Playscreen({
    super.key,
    required this.selectedType,
    required this.totalCards,
  });


  @override
  State<Playscreen> createState() => _PlayscreenState();
}

class _PlayscreenState extends State<Playscreen>  with WidgetsBindingObserver {

  late List<GameCard> cards;
  int? firstIndex;
  bool lockBoard = false;
  int matchedPairs = 0;

  int score = 0;
  int timeLeft = 60;

  Timer? gameTimer;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);

    generateCards();
    startTimer();
    AudioService.playBackground();
  }



  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.detached ||
        state == AppLifecycleState.inactive) {
      AudioService.stopBackground(); // app minimized / killed
    }

    if (state == AppLifecycleState.resumed) {
      if (AudioService.musicEnabled) {
        AudioService.playBackground(); // app reopened
      }
    }
  }


  void checkGameComplete() {
    if (cards.every((c) => c.isMatched)) {
      gameTimer?.cancel();

      showGameResultDialog(
        context: context,
        isWin: true,
        onRestart: restartGame,
        score: calculateFinalScore(),
        onHome: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => HomeScreen()),
                (_) => false,
          );
        },
      );
    }
  }


  int getCrossAxisCount(int length) {
    if (length <= 4) return 2;
    if (length <= 6) return 2;
    if (length <= 12) return 3;
    return 4;
  }

  final CardData cardData = CardData(
    imagePath: 'assets/images/animals/lion.png',
  );

  void _toggleOverlay() {
    setState(() {
      cardData.showOverlay = !cardData.showOverlay;
    });
  }

  void onCardTap(int index) {
    if (lockBoard) return;
    if (cards[index].isFlipped || cards[index].isMatched) return;
    AudioService.playFlip();

    setState(() {
      cards[index].isFlipped = true;
    });

    if (firstIndex == null) {
      firstIndex = index;
      return;
    }

    final first = cards[firstIndex!];
    final second = cards[index];

    if (first.image == second.image) {
      setState(() {
        first.isMatched = true;
        second.isMatched = true;
        firstIndex = null;

        score += 1;
        timeLeft = (timeLeft + 10).clamp(0, 60);

        matchedPairs++;
      });
      final totalPairs = cards.length ~/ 2;

      if (matchedPairs == totalPairs) {
        gameTimer?.cancel();

        Future.delayed(const Duration(milliseconds: 300), () {
          showGameResultDialog(
            context: context,
            isWin: true,
            score: calculateFinalScore(),
            onRestart: restartGame,
            onHome: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => HomeScreen()),
                    (_) => false,
              );
            },
          );
        });
      }
    }

    else {
      // NO MATCH
      lockBoard = true;

      Future.delayed(const Duration(milliseconds: 800), () {
        setState(() {
          first.isFlipped = false;
          second.isFlipped = false;
          firstIndex = null;
          lockBoard = false;
        });
      });
    }
  }
  void pauseGame() {
    gameTimer?.cancel();
  }
  void resumeGame() {
    startTimer();
  }

  void restartGame() {
    gameTimer?.cancel();
    matchedPairs = 0;

    setState(() {
      score = 0;
      timeLeft = 60;

      for (var card in cards) {
        card.isFlipped = false;
        card.isMatched = false;
      }

      cards.shuffle();
      generateCards(); // 🔥 rebuild cards with new random count

    });

    startTimer();
  }
  void startTimer() {
    gameTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeLeft <= 0) {
        timer.cancel();

        showGameResultDialog(
          context: context,
          isWin: false,
          score: calculateFinalScore(),
          onRestart: restartGame,
          onHome: () {
            Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => HomeScreen()),
                (_) => false,
          );
          },
        );
      } else {
        setState(() {
          timeLeft--;
        });
      }
     });
    }


  double calculateFinalScore() {
    const maxTime = 60;

    // Match score (70%)
    final matchRatio = score / widget.totalCards;
    final matchScore = matchRatio * 70;

    // Time bonus (30%)
    final timeRatio = timeLeft / maxTime;
    final timeScore = timeRatio * 30;

    return (matchScore + timeScore).clamp(0, 100);
  }

  void generateCards() {
    final original =
    getCardsByType(widget.selectedType);

    // Deep copy cards
    final baseCards = original
        .map((c) => GameCard(id: c.id, image: c.image, type: c.type))
        .toList()
      ..shuffle();

    final maxUnique = baseCards.length;

    final random = Random();
    int uniqueCount = random.nextInt(maxUnique ~/ 2) * 2;

    if (uniqueCount < 2) uniqueCount = 2;

    final selected = baseCards.take(uniqueCount).toList();

    cards = [
      ...selected,
      ...selected.map(
            (c) => GameCard(id: c.id, image: c.image, type: c.type),
      ),
    ]..shuffle();

    matchedPairs = 0;
    firstIndex = null;
    lockBoard = false;
  }



  void showGameResultDialog({
    required BuildContext context,
    required bool isWin,
    required double score,
    required VoidCallback onRestart,
    required VoidCallback onHome,
  }) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.deepPurple, Colors.pink],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  OutlinedText(
                    text: isWin ? "YOU WIN!" : "GAME OVER",
                    enableStroke: true,
                    style: AppTextStyles.headingXL,
                  ),

                  const SizedBox(height: 16),

                  OutlinedText(
                    text: "Score : $score",
                    enableStroke: true,
                    style: AppTextStyles.headingL,
                  ),

                  const SizedBox(height: 25),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Buttonwithicon(
                        icon: const Icon(FontAwesomeIcons.house,
                            color: Colors.white),
                        size: "big",
                        action: onHome,
                      ),

                      Buttonwithicon(
                        icon: const Icon(FontAwesomeIcons.rotateRight,
                            color: Colors.white),
                        size: "big",
                        action: () {
                          Navigator.pop(context);
                          onRestart();
                        },
                      ),
                    ],
                  ),
                ],
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
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    AudioService.stopBackground();
    gameTimer?.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
       children: [  Positioned.fill(
              child: Image.asset(
                'assets/images/subtle-prism.png',
                fit: BoxFit.cover,
              ),
            ),
          Column(
              crossAxisAlignment:  CrossAxisAlignment.end,
              children: [
                Playheader(
                  timeLeft: timeLeft,
                  score: score,
                  onPause: pauseGame,
                  onResume: resumeGame,
                  onRestart: restartGame,
                  onHome: () {
                    restartGame();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => HomeScreen()),
                          (_) => false,
                    );
                  },
                ),


                SizedBox(
                  height: 40,
                ),
                Expanded(
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(20),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: getCrossAxisCount(cards.length),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: cards.length,
                    itemBuilder: (_, index) {
                      return CardWidget(
                        data: cards[index],
                        onTap: () => onCardTap(index),
                      );
                    },
                  ),
                ),

              ],
            )


        ],
      ),
    );
  }
}