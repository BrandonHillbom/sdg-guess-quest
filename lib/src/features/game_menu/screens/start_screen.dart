import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sdg_guess_quest/src/constants/colors.dart';
import 'package:sdg_guess_quest/src/constants/sizes.dart';
import 'package:sdg_guess_quest/src/features/game/screens/game_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDarkMode ? secondaryColor : primaryColor,
      body: Container(
        padding: const EdgeInsets.all(defaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                () => Get.to(() => const GameScreen());
              },
              child: const Text('Start a Game'),
            ),
            const SizedBox(height: 20), // Add spacing between buttons
            ElevatedButton(
              onPressed: () {
                // Add code to join a game here
                () => Get.to(() => const GameScreen());
              },
              child: const Text('Join a Game'),
            ),
          ],
        ),
      ),
    );
  }
}
