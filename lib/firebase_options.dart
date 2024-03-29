// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDnQJPvQEpS-v9S4j_8evKZKuHDcx3xc-o',
    appId: '1:391038666866:web:cf387dcdee2f4881941aeb',
    messagingSenderId: '391038666866',
    projectId: 'humangenx',
    authDomain: 'humangenx.firebaseapp.com',
    storageBucket: 'humangenx.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyChYUHRXbX8pErZWK4VZm8dk30P57IVwdU',
    appId: '1:391038666866:android:b6087ad1ed1d42b7941aeb',
    messagingSenderId: '391038666866',
    projectId: 'humangenx',
    storageBucket: 'humangenx.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD6IBzVPxpQJr6Ew7MELePLeqfjqAF0JNg',
    appId: '1:391038666866:ios:65b8fdd63d2d5e65941aeb',
    messagingSenderId: '391038666866',
    projectId: 'humangenx',
    storageBucket: 'humangenx.appspot.com',
    iosBundleId: 'com.example.humanGenx',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD6IBzVPxpQJr6Ew7MELePLeqfjqAF0JNg',
    appId: '1:391038666866:ios:65b8fdd63d2d5e65941aeb',
    messagingSenderId: '391038666866',
    projectId: 'humangenx',
    storageBucket: 'humangenx.appspot.com',
    iosBundleId: 'com.example.humanGenx',
  );
}
