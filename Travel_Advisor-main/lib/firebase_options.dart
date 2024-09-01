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
    apiKey: 'AIzaSyD2nhirUhCM_An_hqK3Bi-bbSDp-C-1eLE',
    appId: '1:967346404331:web:3667a8e58b371be7d377ae',
    messagingSenderId: '967346404331',
    projectId: 'travel--advisor',
    authDomain: 'travel--advisor.firebaseapp.com',
    storageBucket: 'travel--advisor.appspot.com',
    measurementId: 'G-X20KRY9KTM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBNKegbWbaE1wyNNbiNZ7fpnmeyqV2TJng',
    appId: '1:967346404331:android:656f03e5abc0cf7ed377ae',
    messagingSenderId: '967346404331',
    projectId: 'travel--advisor',
    storageBucket: 'travel--advisor.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAq8zRN-PrRI1a3r14q1dymE2lWm5PZ_F0',
    appId: '1:967346404331:ios:04f2e2e18011d116d377ae',
    messagingSenderId: '967346404331',
    projectId: 'travel--advisor',
    storageBucket: 'travel--advisor.appspot.com',
    iosClientId: '967346404331-ki2la1grvfm6v85on8urcdcc11e5huhq.apps.googleusercontent.com',
    iosBundleId: 'com.example.travelAdvisor',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAq8zRN-PrRI1a3r14q1dymE2lWm5PZ_F0',
    appId: '1:967346404331:ios:04f2e2e18011d116d377ae',
    messagingSenderId: '967346404331',
    projectId: 'travel--advisor',
    storageBucket: 'travel--advisor.appspot.com',
    iosClientId: '967346404331-ki2la1grvfm6v85on8urcdcc11e5huhq.apps.googleusercontent.com',
    iosBundleId: 'com.example.travelAdvisor',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD2nhirUhCM_An_hqK3Bi-bbSDp-C-1eLE',
    appId: '1:967346404331:web:57ada6b18343b6b4d377ae',
    messagingSenderId: '967346404331',
    projectId: 'travel--advisor',
    authDomain: 'travel--advisor.firebaseapp.com',
    storageBucket: 'travel--advisor.appspot.com',
    measurementId: 'G-DFW82W2GW3',
  );
}
