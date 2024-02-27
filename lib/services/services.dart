import 'package:firebase_auth/firebase_auth.dart';

class Services {
  void logout() {
    FirebaseAuth.instance.signOut();
  }
}
