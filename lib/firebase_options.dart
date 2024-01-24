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
    apiKey: 'AIzaSyAjd5g4jwuWftYkTVc5Hfe-JIbVicxApEM',
    appId: '1:767426331019:web:31fbaeb683db5a26caaf8e',
    messagingSenderId: '767426331019',
    projectId: 'tes-app-001',
    authDomain: 'tes-app-001.firebaseapp.com',
    storageBucket: 'tes-app-001.appspot.com',
    measurementId: 'G-J4GMZRW5CW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDMDG--bK1WBslCMR797LrXoayKB5kNWVM',
    appId: '1:767426331019:android:47db521608638f73caaf8e',
    messagingSenderId: '767426331019',
    projectId: 'tes-app-001',
    storageBucket: 'tes-app-001.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCl89RcfB6cxetNWCDt-dRTn8dokk31v1k',
    appId: '1:767426331019:ios:38c3d550893022e5caaf8e',
    messagingSenderId: '767426331019',
    projectId: 'tes-app-001',
    storageBucket: 'tes-app-001.appspot.com',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCl89RcfB6cxetNWCDt-dRTn8dokk31v1k',
    appId: '1:767426331019:ios:d4dab03f1dbb9c84caaf8e',
    messagingSenderId: '767426331019',
    projectId: 'tes-app-001',
    storageBucket: 'tes-app-001.appspot.com',
    iosBundleId: 'com.example.flutterApplication1.RunnerTests',
  );
}