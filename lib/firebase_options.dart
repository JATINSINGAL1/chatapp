// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyBnB6AI1gZakbqAote4jlbOXy5sXG1My4U',
    appId: '1:265078603788:web:5063e4574cecd9c4b6ae29',
    messagingSenderId: '265078603788',
    projectId: 'fun-chat-e254f',
    authDomain: 'fun-chat-e254f.firebaseapp.com',
    storageBucket: 'fun-chat-e254f.appspot.com',
    measurementId: 'G-Q0L98KV6RK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBBu3O-nXettoUk2nvZIEmzVOnxsEH04lE',
    appId: '1:265078603788:android:7625c4049179389db6ae29',
    messagingSenderId: '265078603788',
    projectId: 'fun-chat-e254f',
    storageBucket: 'fun-chat-e254f.appspot.com',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBnB6AI1gZakbqAote4jlbOXy5sXG1My4U',
    appId: '1:265078603788:web:d05cca347ddd1325b6ae29',
    messagingSenderId: '265078603788',
    projectId: 'fun-chat-e254f',
    authDomain: 'fun-chat-e254f.firebaseapp.com',
    storageBucket: 'fun-chat-e254f.appspot.com',
    measurementId: 'G-H0T942S4EW',
  );
}
