import 'package:flutter/material.dart';
import 'package:sdg_guess_quest/src/constants/sizes.dart';
import 'package:sdg_guess_quest/src/constants/text_strings.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: formHeight - 20),
        TextButton(
            onPressed: () {},
            child: Text.rich(TextSpan(
                text: dontHaveAccount,
                style: Theme.of(context).textTheme.bodyLarge,
                children: const [
                  TextSpan(text: signup, style: TextStyle(color: Colors.blue))
                ])))
      ],
    );
  }
}
