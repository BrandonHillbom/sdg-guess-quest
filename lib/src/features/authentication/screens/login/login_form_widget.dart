import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sdg_guess_quest/src/constants/sizes.dart';
import 'package:sdg_guess_quest/src/constants/text_strings.dart';
import 'package:sdg_guess_quest/src/features/game/screens/game_screen.dart';
import 'package:sdg_guess_quest/src/features/game_menu/screens/start_screen.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: formHeight - 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                  decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline_outlined),
                labelText: username,
                hintText: username,
                border: OutlineInputBorder(),
              )),
              SizedBox(height: formHeight),
              TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.fingerprint),
                      labelText: password,
                      hintText: password,
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                          onPressed: null,
                          icon: Icon(Icons.remove_red_eye_sharp)))),
              const SizedBox(height: formHeight - 20),
              // Expanded(
              //   child: OutlinedButton(
              //     onPressed: () {},
              //     child: Text(login.toUpperCase()),
              //   ),
              // ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => Get.to(() => const GameScreen()),
                      child: Text(login.toUpperCase())))
            ],
          )),
    );
  }
}
