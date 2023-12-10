import 'package:flutter/material.dart';
import 'package:human_genx/homepage.dart';
// ignore: depend_on_referenced_packages
import 'package:animated_splash_screen/animated_splash_screen.dart';
// import 'package:human_genx/intro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AnimatedSplashScreen(
          splash: const Icon(Icons.ac_unit_sharp),
          duration: 5000,
          nextScreen: const MyHomePage(
            title: "Human_genx",
          ),
          splashTransition: SplashTransition.scaleTransition,
          backgroundColor: Colors.blue),
    );
  }
}
