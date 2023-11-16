import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sdg_guess_quest/src/constants/colors.dart';
import 'package:sdg_guess_quest/src/constants/sizes.dart';
import 'package:sdg_guess_quest/src/constants/styles.dart';
import 'package:sdg_guess_quest/src/features/game/screens/game_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Container(
        padding: const EdgeInsets.all(defaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const GameScreen()), // Replace YourNewPage with the actual widget you want to push
                  );
                },
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10.0), // Adjust the value for rounded corners
                  ),
                  padding: EdgeInsets.symmetric(
                      vertical: 20.0,
                      horizontal: 30.0), // Adjust padding as needed
                  side: BorderSide(
                    color: Colors.white, // Adjust border color
                    width: 2.0, // Adjust border width
                  ),
                ),
                child: Text(
                  'Start a Game',
                  style: startButtonFontWhite,
                ),
              ),
            ),

            const SizedBox(height: 20), // Add spacing between buttons
            // ElevatedButton(
            //   onPressed: () {
            //     // Add code to join a game here
            //     () => Get.to(() => const GameScreen());
            //   },
            //   child: const Text('Join a Game'),
            // ),
          ],
        ),
      ),
    );
  }
}
