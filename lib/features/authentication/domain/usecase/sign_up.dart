import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_app/core/api/error/failures.dart';
import 'package:news_app/core/usecase/usecase.dart';
import 'package:news_app/features/authentication/domain/repository/authentication_repository.dart';

class SignUp implements UseCase<User, SignUpParams> {
  final AuthenticationRepository authenticationRepository;

  SignUp({
    required this.authenticationRepository,
  });

  @override
  Future<Either<FirebaseAuthFailure, User>> call(
    SignUpParams params,
  ) async =>
      await authenticationRepository.signUp(
        params.email,
        params.password,
        params.confirmPassword,
      );
}
