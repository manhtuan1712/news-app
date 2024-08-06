import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/core/api/error/failures.dart';
import 'package:news_app/core/helpers/enums.dart';
import 'package:news_app/core/usecase/usecase.dart';
import 'package:news_app/features/authentication/domain/repository/authentication_repository.dart';
import 'package:news_app/features/authentication/domain/usecase/login.dart';

import 'login_usecase_test.mocks.dart';

@GenerateNiceMocks(
  [
    MockSpec<AuthenticationRepository>(
      as: #MockAuthenticationRepository,
    ),
    MockSpec<User>(
      as: #MockUser,
    ),
  ],
)
void main() {
  late MockAuthenticationRepository mockAuthenticationRepository;

  late Login login;

  late MockUser mockUser;

  setUp(
    () {
      mockAuthenticationRepository = MockAuthenticationRepository();
      login = Login(
        authenticationRepository: mockAuthenticationRepository,
      );
      mockUser = MockUser();
      when(mockUser.uid).thenReturn('fake_uid');
      when(mockUser.email).thenReturn('fakeuser@example.com');
    },
  );

  test(
    'login with wrong password should throw FirebaseAuthException',
    () async {
      when(
        mockAuthenticationRepository.login(
          any,
          any,
        ),
      ).thenAnswer(
        (_) async => Left(
          FirebaseAuthFailure(
            code: FirebaseAuthErrorCode.wrongPassword.get(),
          ),
        ),
      );
      final Either<FirebaseAuthFailure, User> response = await login.call(
        const LoginParams(
          email: 'abc@gmail.com',
          password: 'password123',
        ),
      );
      assert(response.isLeft());
    },
  );

  test(
    'login with disable email should throw FirebaseAuthException',
    () async {
      when(
        mockAuthenticationRepository.login(
          any,
          any,
        ),
      ).thenAnswer(
        (_) async => Left(
          FirebaseAuthFailure(
            code: FirebaseAuthErrorCode.userDisable.get(),
          ),
        ),
      );
      final Either<FirebaseAuthFailure, User> response = await login.call(
        const LoginParams(
          email: 'abc@gmail.com',
          password: 'password123',
        ),
      );
      assert(response.isLeft());
    },
  );

  test(
    'login with invalid user should throw FirebaseAuthException',
    () async {
      when(
        mockAuthenticationRepository.login(
          any,
          any,
        ),
      ).thenAnswer(
        (_) async => Left(
          FirebaseAuthFailure(
            code: FirebaseAuthErrorCode.userNotFound.get(),
          ),
        ),
      );
      final Either<FirebaseAuthFailure, User> response = await login.call(
        const LoginParams(
          email: 'abc@gmail.com',
          password: 'abc',
        ),
      );
      assert(response.isLeft());
    },
  );

  test(
    'login with unknown error should throw FirebaseAuthException',
    () async {
      when(
        mockAuthenticationRepository.login(
          any,
          any,
        ),
      ).thenAnswer(
        (_) async => Left(
          FirebaseAuthFailure(
            code: FirebaseAuthErrorCode.unknown.get(),
          ),
        ),
      );
      final Either<FirebaseAuthFailure, User> response = await login.call(
        const LoginParams(
          email: 'abc@gmail.com',
          password: 'abc@123',
        ),
      );
      assert(response.isLeft());
    },
  );

  test(
    'login successfully',
    () async {
      when(
        mockAuthenticationRepository.login(
          any,
          any,
        ),
      ).thenAnswer(
        (_) async => Right(
          mockUser,
        ),
      );
      final Either<FirebaseAuthFailure, User> response = await login.call(
        const LoginParams(
          email: 'abc@gmail.com',
          password: 'abc@123',
        ),
      );
      expect(
        response.toOption().toNullable(),
        mockUser,
      );
    },
  );
}
