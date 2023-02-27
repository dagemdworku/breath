import 'package:breath/breath.dart';
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: Env.apiKey,
    appId: Env.appIdWeb,
    messagingSenderId: Env.messagingSenderId,
    projectId: Env.projectId,
    authDomain: Env.authDomain,
    storageBucket: Env.storageBucket,
    measurementId: Env.measurementId,
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: Env.apiKey,
    appId: Env.appIdAndroid,
    messagingSenderId: Env.messagingSenderId,
    projectId: Env.projectId,
    storageBucket: Env.storageBucket,
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: Env.apiKey,
    appId: Env.appIdIos,
    messagingSenderId: Env.messagingSenderId,
    projectId: Env.projectId,
    storageBucket: Env.storageBucket,
    iosClientId: Env.iosClientId,
    iosBundleId: Env.iosBundleId,
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: Env.apiKey,
    appId: Env.appIdIos,
    messagingSenderId: Env.messagingSenderId,
    projectId: Env.projectId,
    storageBucket: Env.storageBucket,
    iosClientId: Env.iosClientId,
    iosBundleId: Env.iosBundleId,
  );
}
