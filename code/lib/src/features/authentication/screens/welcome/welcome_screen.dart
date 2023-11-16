import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sdg_guess_quest/src/constants/colors.dart';
import 'package:sdg_guess_quest/src/constants/image_strings.dart';
import 'package:sdg_guess_quest/src/constants/sizes.dart';
import 'package:sdg_guess_quest/src/constants/text_strings.dart';
import 'package:sdg_guess_quest/src/features/authentication/screens/login/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    return Scaffold(
        backgroundColor: isDarkMode ? secondaryColor : primaryColor,
        body: Container(
            padding: const EdgeInsets.all(defaultSize),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(
                    image: const AssetImage(welcomeScreenUndraw),
                    height: height * 0.4),
                Column(
                  children: [
                    Text(welcomeTitle,
                        style: Theme.of(context).textTheme.displaySmall),
                    Text(welcomeSubtitle,
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.center),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Get.to(() => const LoginScreen()),
                        child: Text(login.toUpperCase()),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {},
                      child: Text(signup.toUpperCase()),
                    )),
                  ],
                )
              ],
            )));
  }
}
