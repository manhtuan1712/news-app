import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_app/core/helpers/enums.dart';

abstract class AuthenticationRemoteDataSource {
  Future<User> signUp(
    String email,
    String password,
    String confirmPassword,
  );

  Future<User> login(
    String email,
    String password,
  );
}

class AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  @override
  Future<User> signUp(
    String email,
    String password,
    String confirmPassword,
  ) async {
    try {
      if (confirmPassword != password) {
        throw FirebaseAuthException(
          code:
              FirebaseAuthErrorCode.passwordAndConfirmPasswordDoNotMatch.get(),
        );
      }
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException {
      rethrow;
    } catch (e) {
      debugPrint(e.toString());
      throw FirebaseAuthException(
        code: FirebaseAuthErrorCode.unknown.get(),
      );
    }
  }

  @override
  Future<User> login(
    String email,
    String password,
  ) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException {
      rethrow;
    } catch (e) {
      debugPrint(e.toString());
      throw FirebaseAuthException(
        code: FirebaseAuthErrorCode.unknown.get(),
      );
    }
  }
}
