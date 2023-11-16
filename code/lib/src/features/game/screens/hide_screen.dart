import 'package:flutter/material.dart';
import 'package:sdg_guess_quest/src/constants/colors.dart';
import 'package:sdg_guess_quest/src/constants/styles.dart';

class HideScreen extends StatefulWidget {
  const HideScreen({Key? key, this.playerTurn}) : super(key: key);

  final String? playerTurn;

  @override
  HideScreenState createState() => HideScreenState();
}

class HideScreenState extends State<HideScreen> {
  int clicks = 0;

  void registerClick() {
    int newClicks = ++clicks;
    if (newClicks >= 2) {
      Navigator.pop(context);
    } else {
      setState(() {
        clicks = newClicks;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: GestureDetector(
        onTap: () => registerClick(),
        child: Center(
          child: Text(
            'If you are ${widget.playerTurn}, double tap the screen to play.',
            style: primaryFontWhite,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
