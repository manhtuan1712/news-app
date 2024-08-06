import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_app/core/api/error/failures.dart';
import 'package:news_app/core/usecase/usecase.dart';
import 'package:news_app/features/authentication/domain/repository/authentication_repository.dart';

class Login implements UseCase<User, LoginParams> {
  final AuthenticationRepository authenticationRepository;

  Login({
    required this.authenticationRepository,
  });

  @override
  Future<Either<FirebaseAuthFailure, User>> call(
    LoginParams params,
  ) async =>
      await authenticationRepository.login(
        params.email,
        params.password,
      );
}
