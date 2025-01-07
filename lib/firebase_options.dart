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
        return ios;
      case TargetPlatform.macOS:
        return macos;
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
    apiKey: 'AIzaSyBbMroBX3J78aMKATHEkqE3uYg5qACtToI',
    appId: '1:627904978037:web:02b2ebf10f60bc712f2c3c',
    messagingSenderId: '627904978037',
    projectId: 'culinary-map-sao',
    authDomain: 'culinary-map-sao.firebaseapp.com',
    storageBucket: 'culinary-map-sao.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBCz3A_3fKitTDInDQqk4wWCJjNNVIN4bY',
    appId: '1:627904978037:android:b4a180601bc8e4602f2c3c',
    messagingSenderId: '627904978037',
    projectId: 'culinary-map-sao',
    storageBucket: 'culinary-map-sao.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAgAK8gfQrAAC0W6H8gWVRh3n46kq55WgU',
    appId: '1:627904978037:ios:eff373f3cb9b90872f2c3c',
    messagingSenderId: '627904978037',
    projectId: 'culinary-map-sao',
    storageBucket: 'culinary-map-sao.firebasestorage.app',
    iosBundleId: 'com.example.culinaryMapApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAgAK8gfQrAAC0W6H8gWVRh3n46kq55WgU',
    appId: '1:627904978037:ios:eff373f3cb9b90872f2c3c',
    messagingSenderId: '627904978037',
    projectId: 'culinary-map-sao',
    storageBucket: 'culinary-map-sao.firebasestorage.app',
    iosBundleId: 'com.example.culinaryMapApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBbMroBX3J78aMKATHEkqE3uYg5qACtToI',
    appId: '1:627904978037:web:21119e5a6da565ff2f2c3c',
    messagingSenderId: '627904978037',
    projectId: 'culinary-map-sao',
    authDomain: 'culinary-map-sao.firebaseapp.com',
    storageBucket: 'culinary-map-sao.firebasestorage.app',
  );

}