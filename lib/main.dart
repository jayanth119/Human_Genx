import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:human_genx/intro.dart';
import 'package:human_genx/utils/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
// );
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "apikey",
        authDomain: "humangenx.firebaseapp.com",
        projectId: "humangenx",
        storageBucket: "humangenx.appspot.com",
        messagingSenderId: "0000",
        appId: "0000"),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HumanGenx',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AnimatedSplashScreen(
          splash: const Splash_screen(),
          duration: 2000,
          nextScreen: const Auth(),
          splashTransition: SplashTransition.scaleTransition,
          backgroundColor: Colors.black),
    );
  }
}


