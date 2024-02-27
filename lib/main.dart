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
        apiKey: "AIzaSyDnQJPvQEpS-v9S4j_8evKZKuHDcx3xc-o",
        authDomain: "humangenx.firebaseapp.com",
        projectId: "humangenx",
        storageBucket: "humangenx.appspot.com",
        messagingSenderId: "391038666866",
        appId: "1:391038666866:web:cf387dcdee2f4881941aeb"),
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



// Platform  Firebase App Id
// web       1:391038666866:web:cf387dcdee2f4881941aeb
// android   1:391038666866:android:b6087ad1ed1d42b7941aeb
// ios       1:391038666866:ios:65b8fdd63d2d5e65941aeb
// macos     1:391038666866:ios:65b8fdd63d2d5e65941aeb

// Learn more about using this file and next steps from the documentation:
//  > https://firebase.google.com/docs/flutter/setup