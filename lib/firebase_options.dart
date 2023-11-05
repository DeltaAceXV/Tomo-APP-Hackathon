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
      apiKey: "AIzaSyDR06CeT-UMni1LC9datHKjnohMb2T33L0",
      authDomain: "tomoacc-dbb41.firebaseapp.com",
      projectId: "tomoacc-dbb41",
      storageBucket: "tomoacc-dbb41.appspot.com",
      messagingSenderId: "693044768885",
      appId: "1:693044768885:web:33e849a04bf4fffe9a083c");

  static const FirebaseOptions android = FirebaseOptions(
      apiKey: 'AIzaSyDR06CeT-UMni1LC9datHKjnohMb2T33L0',
      appId: "1:693044768885:web:33e849a04bf4fffe9a083c",
      messagingSenderId: "693044768885",
      databaseURL: 'https://tomoacc-dbb41.firebaseapp.com',
      projectId: "tomoacc-dbb41",
      storageBucket: "tomoacc-dbb41.appspot.com");

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAK3urCAYCOynE947LYcC1dbNPfI-qxi9E',
    appId: '1:924285328807:ios:0c0de00acddcef369caa82',
    messagingSenderId: '924285328807',
    projectId: 'learning-base-21c34',
    databaseURL: 'https://learning-base-21c34.firebaseio.com',
    storageBucket: 'learning-base-21c34.appspot.com',
    iosClientId:
        '924285328807-9gbjq0maqad0mck2h9li3a9fltr5rfkm.apps.googleusercontent.com',
    iosBundleId: 'com.example.tracklocation',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAK3urCAYCOynE947LYcC1dbNPfI-qxi9E',
    appId: '1:924285328807:ios:0c0de00acddcef369caa82',
    messagingSenderId: '924285328807',
    projectId: 'learning-base-21c34',
    databaseURL: 'https://learning-base-21c34.firebaseio.com',
    storageBucket: 'learning-base-21c34.appspot.com',
    iosClientId:
        '924285328807-9gbjq0maqad0mck2h9li3a9fltr5rfkm.apps.googleusercontent.com',
    iosBundleId: 'com.example.tracklocation',
  );
}
