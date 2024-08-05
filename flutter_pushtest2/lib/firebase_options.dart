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
    apiKey: 'AIzaSyB5eIj69XpK6iOJXtWEM2dnF7i2X5LmKSs',
    appId: '1:795552190005:web:c0c744a5406de130ce6b7c',
    messagingSenderId: '795552190005',
    projectId: 'flutterpush-89303',
    authDomain: 'flutterpush-89303.firebaseapp.com',
    storageBucket: 'flutterpush-89303.appspot.com',
    measurementId: 'G-GYRJ175NCJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD1Zb0nhxRK_OltnmT1ANHGeK-6CUpI_kM',
    appId: '1:795552190005:android:130e141f20bd33b8ce6b7c',
    messagingSenderId: '795552190005',
    projectId: 'flutterpush-89303',
    storageBucket: 'flutterpush-89303.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCRjPdx8By6FllagDnka5Yf87GljsQgOtY',
    appId: '1:795552190005:ios:32de5ca7f9e1b222ce6b7c',
    messagingSenderId: '795552190005',
    projectId: 'flutterpush-89303',
    storageBucket: 'flutterpush-89303.appspot.com',
    iosBundleId: 'com.example.flutterPushtest2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCRjPdx8By6FllagDnka5Yf87GljsQgOtY',
    appId: '1:795552190005:ios:32de5ca7f9e1b222ce6b7c',
    messagingSenderId: '795552190005',
    projectId: 'flutterpush-89303',
    storageBucket: 'flutterpush-89303.appspot.com',
    iosBundleId: 'com.example.flutterPushtest2',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB5eIj69XpK6iOJXtWEM2dnF7i2X5LmKSs',
    appId: '1:795552190005:web:e4de80fa08c666e7ce6b7c',
    messagingSenderId: '795552190005',
    projectId: 'flutterpush-89303',
    authDomain: 'flutterpush-89303.firebaseapp.com',
    storageBucket: 'flutterpush-89303.appspot.com',
    measurementId: 'G-VF04S2K4Q4',
  );
}
