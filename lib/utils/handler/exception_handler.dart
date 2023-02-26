/// Thrown from a FirestoreApi class and provides a detailed actionable message
class FirestoreApiException implements Exception {
  final String message;
  final String devDetails;
  final String prettyDetails;

  FirestoreApiException({
    required this.message,
    required this.devDetails,
    required this.prettyDetails,
  });

  @override
  String toString() {
    return '''FirestoreApiException | $message 
    Dev Details: $devDetails
    Pretty Details: $prettyDetails''';
  }
}

class FirebaseAuthErrorMessage {
  final String code;
  final String message;

  FirebaseAuthErrorMessage(this.code, this.message);
}

class FirebaseAuthExceptionHandler {
  static List<FirebaseAuthErrorMessage> exceptions = [
    FirebaseAuthErrorMessage(
      'wildcard',
      'Something went wrong. Please try again later.',
    ),
    FirebaseAuthErrorMessage(
      'network-request-failed',
      'Your network is not stable, please make sure if you are connected to an internet.',
    ),
    FirebaseAuthErrorMessage(
      'user-not-found',
      'No account exists for the email you\'re trying to use. Sign up instead.',
    ),
    FirebaseAuthErrorMessage(
      'email-already-in-use',
      'An account already exists for the email you\'re trying to use. Sign in instead.',
    ),
    FirebaseAuthErrorMessage(
      'invalid-email',
      'The email you\'re using is invalid. Please use a valid email.',
    ),
    FirebaseAuthErrorMessage(
      'account-not-created',
      'We could not create your account at this time. Please try again',
    ),
    FirebaseAuthErrorMessage(
      'operation-not-allowed',
      'The authentication is not enabled on Firebase. Please enable the Authentication type on Firebase.',
    ),
    FirebaseAuthErrorMessage(
      'weak-password',
      'Your password is too weak. Please use a stronger password.',
    ),
    FirebaseAuthErrorMessage(
      'wrong-password',
      'You seemed to have entered the wrong password. Double check it and try again.',
    ),
  ];

  static String getMessage(String code) {
    for (var exception in exceptions) {
      if (exception.code == code) return exception.message.toLowerCase();
    }
    return 'Something went wrong. Please try again later.'.toLowerCase();
  }
}
