class FirebaseAuthErrorCode {
  final String _value;

  const FirebaseAuthErrorCode._internal(this._value);

  String get() => _value;

  static const unknown = FirebaseAuthErrorCode._internal('unknown');
  static const weakPassword = FirebaseAuthErrorCode._internal('weak-password');
  static const emailAlreadyInUse =
      FirebaseAuthErrorCode._internal('email-already-in-use');
  static const passwordAndConfirmPasswordDoNotMatch =
      FirebaseAuthErrorCode._internal(
          'password-and-confirm-password-do-not-match');
  static const invalidEmail = FirebaseAuthErrorCode._internal('invalid-email');
  static const operationNotAllowed =
      FirebaseAuthErrorCode._internal('operation-not-allowed');
  static const tooManyRequests =
      FirebaseAuthErrorCode._internal('too-many-requests');
  static const userTokenExpired =
      FirebaseAuthErrorCode._internal('user-token-expired');
  static const netWorkRequestFailed =
      FirebaseAuthErrorCode._internal('network-request-failed');
  static const userDisable = FirebaseAuthErrorCode._internal('user-disabled');
  static const userNotFound = FirebaseAuthErrorCode._internal('user-not-found');
  static const wrongPassword =
      FirebaseAuthErrorCode._internal('wrong-password');
  static const invalidCredential =
      FirebaseAuthErrorCode._internal('invalid-credential');
}
