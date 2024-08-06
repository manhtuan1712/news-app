import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/core/api/error/failures.dart';
import 'package:news_app/core/helpers/enums.dart';
import 'package:news_app/features/authentication/data/datasources/authetication_remote_data_source.dart';
import 'package:news_app/features/authentication/data/repository/authentication_repository_impl.dart';

import 'authentication_repository_test.mocks.dart';

@GenerateNiceMocks(
  [
    MockSpec<AuthenticationRemoteDataSource>(
      as: #MockAuthenticationRemoteDataSource,
    ),
    MockSpec<User>(
      as: #MockUser,
    ),
  ],
)
void main() {
  late MockAuthenticationRemoteDataSource mockAuthenticationRemoteDataSource;

  late AuthenticationRepositoryImpl authenticationRepositoryImpl;

  late MockUser mockUser;

  setUp(
    () {
      mockAuthenticationRemoteDataSource = MockAuthenticationRemoteDataSource();
      authenticationRepositoryImpl = AuthenticationRepositoryImpl(
        authenticationRemoteDataSource: mockAuthenticationRemoteDataSource,
      );
      mockUser = MockUser();
      when(mockUser.uid).thenReturn('fake_uid');
      when(mockUser.email).thenReturn('fakeuser@example.com');
    },
  );

  // ---------- Sign up ---------- //
  test(
    'signUp with password and confirm password not match should throw FirebaseAuthException',
    () async {
      when(
        mockAuthenticationRemoteDataSource.signUp(
          any,
          any,
          any,
        ),
      ).thenThrow(
        FirebaseAuthException(
          code:
              FirebaseAuthErrorCode.passwordAndConfirmPasswordDoNotMatch.get(),
        ),
      );
      final Either<FirebaseAuthFailure, User> response =
          await authenticationRepositoryImpl.signUp(
        'abc@gmail.com',
        'password123',
        'confirmPassword123',
      );
      assert(response.isLeft());
    },
  );

  test(
    'signUp with exist email should throw FirebaseAuthException',
    () async {
      when(
        mockAuthenticationRemoteDataSource.signUp(
          any,
          any,
          any,
        ),
      ).thenThrow(
        FirebaseAuthException(
          code: FirebaseAuthErrorCode.emailAlreadyInUse.get(),
        ),
      );
      final Either<FirebaseAuthFailure, User> response =
          await authenticationRepositoryImpl.signUp(
        'abc@gmail.com',
        'password123',
        'password123',
      );
      assert(response.isLeft());
    },
  );

  test(
    'signUp with weak password should throw FirebaseAuthException',
    () async {
      when(
        mockAuthenticationRemoteDataSource.signUp(
          any,
          any,
          any,
        ),
      ).thenThrow(
        FirebaseAuthException(
          code: FirebaseAuthErrorCode.weakPassword.get(),
        ),
      );
      final Either<FirebaseAuthFailure, User> response =
          await authenticationRepositoryImpl.signUp(
        'abc@gmail.com',
        'abc',
        'abc',
      );
      assert(response.isLeft());
    },
  );

  test(
    'signUp with unknown error should throw FirebaseAuthException',
    () async {
      when(
        mockAuthenticationRemoteDataSource.signUp(
          any,
          any,
          any,
        ),
      ).thenThrow(
        FirebaseAuthException(
          code: FirebaseAuthErrorCode.unknown.get(),
        ),
      );
      final Either<FirebaseAuthFailure, User> response =
          await authenticationRepositoryImpl.signUp(
        'abc@gmail.com',
        'abc@123',
        'abc@123',
      );
      assert(response.isLeft());
    },
  );

  test(
    'signUp successfully',
    () async {
      when(
        mockAuthenticationRemoteDataSource.signUp(
          any,
          any,
          any,
        ),
      ).thenAnswer(
        (_) async => mockUser,
      );
      final Either<FirebaseAuthFailure, User> response =
          await authenticationRepositoryImpl.signUp(
        'abc@gmail.com',
        'abc@123',
        'abc@123',
      );
      expect(
        response.toOption().toNullable(),
        mockUser,
      );
    },
  );

  // ---------- Login ---------- //
  test(
    'login with wrong password should throw FirebaseAuthException',
    () async {
      when(
        mockAuthenticationRemoteDataSource.login(
          any,
          any,
        ),
      ).thenThrow(
        FirebaseAuthException(
          code: FirebaseAuthErrorCode.wrongPassword.get(),
        ),
      );
      final Either<FirebaseAuthFailure, User> response =
          await authenticationRepositoryImpl.login(
        'abc@gmail.com',
        'password123',
      );
      assert(response.isLeft());
    },
  );

  test(
    'login with disable email should throw FirebaseAuthException',
    () async {
      when(
        mockAuthenticationRemoteDataSource.login(
          any,
          any,
        ),
      ).thenThrow(
        FirebaseAuthException(
          code: FirebaseAuthErrorCode.userDisable.get(),
        ),
      );
      final Either<FirebaseAuthFailure, User> response =
          await authenticationRepositoryImpl.login(
        'abc@gmail.com',
        'password123',
      );
      assert(response.isLeft());
    },
  );

  test(
    'login with invalid user should throw FirebaseAuthException',
    () async {
      when(
        mockAuthenticationRemoteDataSource.login(
          any,
          any,
        ),
      ).thenThrow(
        FirebaseAuthException(
          code: FirebaseAuthErrorCode.userNotFound.get(),
        ),
      );
      final Either<FirebaseAuthFailure, User> response =
          await authenticationRepositoryImpl.login(
        'abc@gmail.com',
        'abc',
      );
      assert(response.isLeft());
    },
  );

  test(
    'login with unknown error should throw FirebaseAuthException',
    () async {
      when(
        mockAuthenticationRemoteDataSource.login(
          any,
          any,
        ),
      ).thenThrow(
        FirebaseAuthException(
          code: FirebaseAuthErrorCode.unknown.get(),
        ),
      );
      final Either<FirebaseAuthFailure, User> response =
          await authenticationRepositoryImpl.login(
        'abc@gmail.com',
        'abc@123',
      );
      assert(response.isLeft());
    },
  );

  test(
    'login successfully',
    () async {
      when(
        mockAuthenticationRemoteDataSource.login(
          any,
          any,
        ),
      ).thenAnswer(
        (_) async => mockUser,
      );
      final Either<FirebaseAuthFailure, User> response =
          await authenticationRepositoryImpl.login(
        'abc@gmail.com',
        'abc@123',
      );
      expect(
        response.toOption().toNullable(),
        mockUser,
      );
    },
  );
}
