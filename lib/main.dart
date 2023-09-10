// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:instagram_app/screens/main_screen.dart';
import 'package:instagram_app/screens/splash_screen.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(129.0, 46.0),
            backgroundColor: Color(0xffF35383),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            textStyle: TextStyle(
              color: Colors.white,
              fontFamily: 'GB',
              fontSize: 16.0,
            ),
          ),
        ),
        textTheme: TextTheme(
          headline4: TextStyle(
            color: Colors.white,
            fontFamily: 'GB',
            fontSize: 16.0,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
