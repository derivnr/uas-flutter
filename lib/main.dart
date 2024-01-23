import 'package:flutter/material.dart';
// import 'package:uts_flutter/screens/welcome_screen.dart';
import 'package:uts_flutter/screens/splash_screen.dart';
// import 'package:uts_flutter/screens/bottom_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
