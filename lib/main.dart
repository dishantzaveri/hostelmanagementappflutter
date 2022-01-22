// ignore_for_file: prefer_const_constructors

import 'package:easydorm/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

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
            alignment: Alignment.center,
            child: Image.asset(
              "assets/easydorms.png",
              height: 200,
              width: 200,
            ),
          ),
          splashIconSize: double.maxFinite,
          nextScreen: HomePage(),
          duration: 100,
          backgroundColor: Colors.white,
        ));
  }
}
