import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/core/api/error/failures.dart';
import 'package:news_app/core/helpers/enums.dart';
import 'package:news_app/core/usecase/usecase.dart';
import 'package:news_app/features/authentication/domain/repository/authentication_repository.dart';
import 'package:news_app/features/authentication/domain/usecase/sign_up.dart';

import 'sign_up_usecase_test.mocks.dart';

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

  late SignUp signUp;

  late MockUser mockUser;

  setUp(
    () {
      mockAuthenticationRepository = MockAuthenticationRepository();
      signUp = SignUp(
        authenticationRepository: mockAuthenticationRepository,
      );
      mockUser = MockUser();
      when(mockUser.uid).thenReturn('fake_uid');
      when(mockUser.email).thenReturn('fakeuser@example.com');
    },
  );

  test(
    'signUp with password and confirm password not match should throw FirebaseAuthException',
    () async {
      when(
        mockAuthenticationRepository.signUp(
          any,
          any,
          any,
        ),
      ).thenAnswer(
        (_) async => Left(
          FirebaseAuthFailure(
            code: FirebaseAuthErrorCode.passwordAndConfirmPasswordDoNotMatch
                .get(),
          ),
        ),
      );
      final Either<FirebaseAuthFailure, User> response = await signUp.call(
        const SignUpParams(
          email: 'abc@gmail.com',
          password: 'password123',
          confirmPassword: 'confirmPassword123',
        ),
      );
      assert(response.isLeft());
    },
  );

  test(
    'signUp with exist email should throw FirebaseAuthException',
    () async {
      when(
        mockAuthenticationRepository.signUp(
          any,
          any,
          any,
        ),
      ).thenAnswer(
        (_) async => Left(
          FirebaseAuthFailure(
            code: FirebaseAuthErrorCode.emailAlreadyInUse.get(),
          ),
        ),
      );
      final Either<FirebaseAuthFailure, User> response = await signUp.call(
        const SignUpParams(
          email: 'abc@gmail.com',
          password: 'password123',
          confirmPassword: 'password123',
        ),
      );
      assert(response.isLeft());
    },
  );

  test(
    'signUp with weak password should throw FirebaseAuthException',
    () async {
      when(
        mockAuthenticationRepository.signUp(
          any,
          any,
          any,
        ),
      ).thenAnswer(
        (_) async => Left(
          FirebaseAuthFailure(
            code: FirebaseAuthErrorCode.weakPassword.get(),
          ),
        ),
      );
      final Either<FirebaseAuthFailure, User> response = await signUp.call(
        const SignUpParams(
          email: 'abc@gmail.com',
          password: 'abc',
          confirmPassword: 'abc',
        ),
      );
      assert(response.isLeft());
    },
  );

  test(
    'signUp with unknown error should throw FirebaseAuthException',
    () async {
      when(
        mockAuthenticationRepository.signUp(
          any,
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
      final Either<FirebaseAuthFailure, User> response = await signUp.call(
        const SignUpParams(
          email: 'abc@gmail.com',
          password: 'abc@123',
          confirmPassword: 'abc@123',
        ),
      );
      assert(response.isLeft());
    },
  );

  test(
    'signUp successfully',
    () async {
      when(
        mockAuthenticationRepository.signUp(
          any,
          any,
          any,
        ),
      ).thenAnswer(
        (_) async => Right(
          mockUser,
        ),
      );
      final Either<FirebaseAuthFailure, User> response = await signUp.call(
        const SignUpParams(
          email: 'abc@gmail.com',
          password: 'abc@123',
          confirmPassword: 'abc@123',
        ),
      );
      expect(
        response.toOption().toNullable(),
        mockUser,
      );
    },
  );
}
