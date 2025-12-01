import 'package:flutter/material.dart';
import 'pages/welcome.dart';

void main() {
  runApp(const Voyago());
}

class Voyago extends StatelessWidget {
  const Voyago({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Voyago",
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
      theme: ThemeData(
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
          fontFamily: 'PlayfairDisplay'
      ),
    );
  }
}
