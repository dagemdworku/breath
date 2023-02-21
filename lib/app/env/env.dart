import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'API_KEY')
  static const apiKey = _Env.apiKey;

  @EnviedField(varName: 'APP_ID')
  static const appId = _Env.appId;

  @EnviedField(varName: 'MESSAGING_SENDER_ID')
  static const messagingSenderId = _Env.messagingSenderId;

  @EnviedField(varName: 'PROJECT_ID')
  static const projectId = _Env.projectId;

  @EnviedField(varName: 'AUTH_DOMAIN')
  static const authDomain = _Env.authDomain;

  @EnviedField(varName: 'STORAGE_BUCKET')
  static const storageBucket = _Env.storageBucket;

  @EnviedField(varName: 'MEASUREMENT_ID')
  static const measurementId = _Env.measurementId;

  @EnviedField(varName: 'IOS_CLIENT_ID')
  static const iosClientId = _Env.iosClientId;

  @EnviedField(varName: 'IOS_BUNDLE_ID')
  static const iosBundleId = _Env.iosBundleId;
}
