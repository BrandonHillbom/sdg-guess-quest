import 'package:flutter/material.dart';
import 'package:sdg_guess_quest/src/constants/image_strings.dart';
import 'package:sdg_guess_quest/src/constants/text_strings.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;
  @override
  Widget build(BuildContext context) {
    return (Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(image: AssetImage(loginScreenUndraw), height: size.height * 0.2),
        Text(loginTitle, style: Theme.of(context).textTheme.headlineLarge),
        Text(loginSubtitle, style: Theme.of(context).textTheme.bodyLarge),
      ],
    ));
  }
}
