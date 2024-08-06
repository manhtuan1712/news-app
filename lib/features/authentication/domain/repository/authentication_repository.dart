import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_app/core/api/error/failures.dart';

abstract class AuthenticationRepository {
  Future<Either<FirebaseAuthFailure, User>> signUp(
    String email,
    String password,
    String confirmPassword,
  );

  Future<Either<FirebaseAuthFailure, User>> login(
    String email,
    String password,
  );
}
