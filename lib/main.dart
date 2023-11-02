import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sdg_guess_quest/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:sdg_guess_quest/src/utils/theme/theme.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SDG Guess Quest',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const WelcomeScreen(),
    );
  }
}

class AppHome extends StatefulWidget {
  const AppHome({Key? key}) : super(key: key);

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
//this is run whenever set state is called
    return Scaffold(
        appBar: AppBar(
          title: const Text("SDG Home"),
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add_shopping_cart), onPressed: () {}),
        body: const Center(child: Text("home page")));
  }
}
