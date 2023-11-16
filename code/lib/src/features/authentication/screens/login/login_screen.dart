import 'package:flutter/material.dart';
import 'package:sdg_guess_quest/src/constants/sizes.dart';
import 'package:sdg_guess_quest/src/features/authentication/screens/login/login_footer_widget.dart';
import 'package:sdg_guess_quest/src/features/authentication/screens/login/login_form_widget.dart';
import 'package:sdg_guess_quest/src/features/authentication/screens/login/login_header_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.all(defaultSize),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LoginHeaderWidget(size: size),
                      const LoginFormWidget(),
                      const LoginFooterWidget(),
                    ]))),
      ),
    );
  }
}
