import 'dart:async';

import 'package:breath/breath.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;

class AuthenticationService {
  final log = getLogger('AuthenticationService');

  final firebase.FirebaseAuth firebaseAuth = firebase.FirebaseAuth.instance;

  /// Returns the current logged in Firebase User
  firebase.User? get currentUser => firebaseAuth.currentUser;

  /// Returns true when a user has logged in or signed on this device
  bool get hasUser => firebaseAuth.currentUser != null;

  Future<FirebaseAuthenticationResult> loginWithEmail(
      String email, String password) async {
    try {
      final result = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      log.d('Sign in with email result: ${result.credential} ${result.user}');

      return FirebaseAuthenticationResult(user: result.user);
    } on firebase.FirebaseAuthException catch (e) {
      log.e('A firebase exception has occurred. $e');
      return FirebaseAuthenticationResult.error(
          exceptionCode: e.code.toLowerCase(),
          errorMessage: FirebaseAuthExceptionHandler.getMessage(
            e.code.toLowerCase(),
          ));
    } on Exception catch (e) {
      log.e('A general exception has occurred. $e');
      return FirebaseAuthenticationResult.error(
        errorMessage:
            'We could not log into your account at this time. Please try again.',
      );
    }
  }

  Future<FirebaseAuthenticationResult> createAccountWithEmail(
      String email, String password, String fullName) async {
    log.d('email:$email');

    try {
      final result = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      log.d(
        'Create user with email result: ${result.credential} ${result.user}',
      );

      FirebaseAuthenticationResult firebaseAuthenticationResult =
          FirebaseAuthenticationResult(
        user: result.user,
      );

      await firebaseAuth.currentUser?.updateDisplayName(
        fullName,
      );

      return firebaseAuthenticationResult;
    } on firebase.FirebaseAuthException catch (e) {
      log.e('A firebase exception has occurred. $e');
      return FirebaseAuthenticationResult.error(
          exceptionCode: e.code.toLowerCase(),
          errorMessage: FirebaseAuthExceptionHandler.getMessage(
            e.code.toLowerCase(),
          ));
    } on Exception catch (e) {
      log.e('A general exception has occurred. $e');
      return FirebaseAuthenticationResult.error(
          errorMessage: FirebaseAuthExceptionHandler.getMessage(
        'account-not-created',
      ));
    }
  }

  /// When a [User] decides to logout then should
  /// dispose the current state of this class
  Future<void> logout() async {
    log.i('');
    try {
      await firebaseAuth.signOut();
    } catch (e) {
      log.e('Could not sign out. $e');
    }
  }
}

class FirebaseAuthenticationResult {
  /// Firebase user
  final firebase.User? user;
  final String? displayName;

  /// Contains the error message for the request
  final String? errorMessage;
  final String? exceptionCode;

  FirebaseAuthenticationResult({this.user, this.displayName})
      : errorMessage = null,
        exceptionCode = null;

  FirebaseAuthenticationResult.error({this.errorMessage, this.exceptionCode})
      : user = null,
        displayName = null;

  /// Returns true if the response has an error associated with it
  bool get hasError => errorMessage != null && errorMessage!.isNotEmpty;
}
