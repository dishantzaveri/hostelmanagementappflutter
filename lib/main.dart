// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:easydorm/screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: Colors.black),
        home: AnimatedSplashScreen(
          splash: Container(
            padding: EdgeInsets.only(bottom: 25),
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              "assets/google.png",
              height: 150,
              width: 150,
            ),
          ),
          splashIconSize: double.maxFinite,
          nextScreen: Login(),
          duration: 1,
          backgroundColor: Colors.white,
        ));
  }
}
