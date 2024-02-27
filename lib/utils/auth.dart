import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:human_genx/pages/homepage.dart';
import 'package:human_genx/pages/login.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.hasData) {
            return const MyHomePage(
              title: 'HumanGenx',
            );
          } else {
            return const Login();
          }
        },
      ),
    );
  }
}
