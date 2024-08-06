import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_app/core/api/error/failures.dart';
import 'package:news_app/features/authentication/data/datasources/authetication_remote_data_source.dart';
import 'package:news_app/features/authentication/domain/repository/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDataSource authenticationRemoteDataSource;

  AuthenticationRepositoryImpl({
    required this.authenticationRemoteDataSource,
  });

  @override
  Future<Either<FirebaseAuthFailure, User>> signUp(
    String email,
    String password,
    String confirmPassword,
  ) async {
    try {
      final user = await authenticationRemoteDataSource.signUp(
        email,
        password,
        confirmPassword,
      );
      return Right(
        user,
      );
    } on FirebaseAuthException catch (e) {
      return Left(
        FirebaseAuthFailure(
          code: e.code,
        ),
      );
    }
  }

  @override
  Future<Either<FirebaseAuthFailure, User>> login(
    String email,
    String password,
  ) async {
    try {
      final user = await authenticationRemoteDataSource.login(
        email,
        password,
      );
      return Right(
        user,
      );
    } on FirebaseAuthException catch (e) {
      return Left(
        FirebaseAuthFailure(
          code: e.code,
        ),
      );
    }
  }
}
