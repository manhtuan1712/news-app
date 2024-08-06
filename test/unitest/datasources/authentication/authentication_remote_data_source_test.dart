import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/core/helpers/enums.dart';
import 'package:news_app/features/authentication/data/datasources/authetication_remote_data_source.dart';

import 'authentication_remote_data_source_test.mocks.dart';

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
  late MockAuthenticationRemoteDataSource authenticationRemoteDataSourceImpl;

  late MockUser mockUser;

  setUp(
    () {
      authenticationRemoteDataSourceImpl = MockAuthenticationRemoteDataSource();
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
        authenticationRemoteDataSourceImpl.signUp(
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
      expect(
        () => authenticationRemoteDataSourceImpl.signUp(
          'abc@gmail.com',
          'password123',
          'confirmPassword123',
        ),
        throwsA(
          isA<FirebaseAuthException>().having(
            (e) => e.code,
            'code',
            FirebaseAuthErrorCode.passwordAndConfirmPasswordDoNotMatch.get(),
          ),
        ),
      );
    },
  );

  test(
    'signUp with exist email should throw FirebaseAuthException',
    () async {
      when(
        authenticationRemoteDataSourceImpl.signUp(
          any,
          any,
          any,
        ),
      ).thenThrow(
        FirebaseAuthException(
          code: FirebaseAuthErrorCode.emailAlreadyInUse.get(),
        ),
      );
      expect(
        () => authenticationRemoteDataSourceImpl.signUp(
          'abc@gmail.com',
          'password123',
          'password123',
        ),
        throwsA(
          isA<FirebaseAuthException>().having(
            (e) => e.code,
            'code',
            FirebaseAuthErrorCode.emailAlreadyInUse.get(),
          ),
        ),
      );
    },
  );

  test(
    'signUp with weak password should throw FirebaseAuthException',
    () async {
      when(
        authenticationRemoteDataSourceImpl.signUp(
          any,
          any,
          any,
        ),
      ).thenThrow(
        FirebaseAuthException(
          code: FirebaseAuthErrorCode.weakPassword.get(),
        ),
      );
      expect(
        () => authenticationRemoteDataSourceImpl.signUp(
          'abc@gmail.com',
          'abc',
          'abc',
        ),
        throwsA(
          isA<FirebaseAuthException>().having(
            (e) => e.code,
            'code',
            FirebaseAuthErrorCode.weakPassword.get(),
          ),
        ),
      );
    },
  );

  test(
    'signUp with unknown error should throw FirebaseAuthException',
    () async {
      when(
        authenticationRemoteDataSourceImpl.signUp(
          any,
          any,
          any,
        ),
      ).thenThrow(
        FirebaseAuthException(
          code: FirebaseAuthErrorCode.unknown.get(),
        ),
      );
      expect(
        () => authenticationRemoteDataSourceImpl.signUp(
          'abc@gmail.com',
          'abc@123',
          'abc@123',
        ),
        throwsA(
          isA<FirebaseAuthException>().having(
            (e) => e.code,
            'code',
            FirebaseAuthErrorCode.unknown.get(),
          ),
        ),
      );
    },
  );

  test(
    'signUp successfully',
    () async {
      when(
        authenticationRemoteDataSourceImpl.signUp(
          any,
          any,
          any,
        ),
      ).thenAnswer(
        (_) async => mockUser,
      );
      final user = await authenticationRemoteDataSourceImpl.signUp(
        'abc@gmail.com',
        'abc@123',
        'abc@123',
      );
      expect(
        user,
        mockUser,
      );
    },
  );

  // ---------- Login ---------- //
  test(
    'login with wrong password should throw FirebaseAuthException',
    () async {
      when(
        authenticationRemoteDataSourceImpl.login(
          any,
          any,
        ),
      ).thenThrow(
        FirebaseAuthException(
          code: FirebaseAuthErrorCode.wrongPassword.get(),
        ),
      );
      expect(
        () => authenticationRemoteDataSourceImpl.login(
          'abc@gmail.com',
          'abc@123',
        ),
        throwsA(
          isA<FirebaseAuthException>().having(
            (e) => e.code,
            'code',
            FirebaseAuthErrorCode.wrongPassword.get(),
          ),
        ),
      );
    },
  );

  test(
    'login with disable email should throw FirebaseAuthException',
    () async {
      when(
        authenticationRemoteDataSourceImpl.login(
          any,
          any,
        ),
      ).thenThrow(
        FirebaseAuthException(
          code: FirebaseAuthErrorCode.userDisable.get(),
        ),
      );
      expect(
        () => authenticationRemoteDataSourceImpl.login(
          'abc@gmail.com',
          'abc@123',
        ),
        throwsA(
          isA<FirebaseAuthException>().having(
            (e) => e.code,
            'code',
            FirebaseAuthErrorCode.userDisable.get(),
          ),
        ),
      );
    },
  );

  test(
    'login with invalid user should throw FirebaseAuthException',
    () async {
      when(
        authenticationRemoteDataSourceImpl.login(
          any,
          any,
        ),
      ).thenThrow(
        FirebaseAuthException(
          code: FirebaseAuthErrorCode.userNotFound.get(),
        ),
      );
      expect(
        () => authenticationRemoteDataSourceImpl.login(
          'abc@gmail.com',
          'abc@123',
        ),
        throwsA(
          isA<FirebaseAuthException>().having(
            (e) => e.code,
            'code',
            FirebaseAuthErrorCode.userNotFound.get(),
          ),
        ),
      );
    },
  );

  test(
    'login with unknown error should throw FirebaseAuthException',
    () async {
      when(
        authenticationRemoteDataSourceImpl.login(
          any,
          any,
        ),
      ).thenThrow(
        FirebaseAuthException(
          code: FirebaseAuthErrorCode.unknown.get(),
        ),
      );
      expect(
        () => authenticationRemoteDataSourceImpl.login(
          'abc@gmail.com',
          'abc@123',
        ),
        throwsA(
          isA<FirebaseAuthException>().having(
            (e) => e.code,
            'code',
            FirebaseAuthErrorCode.unknown.get(),
          ),
        ),
      );
    },
  );

  test(
    'login successfully',
    () async {
      when(
        authenticationRemoteDataSourceImpl.login(
          any,
          any,
        ),
      ).thenAnswer(
        (_) async => mockUser,
      );
      final user = await authenticationRemoteDataSourceImpl.login(
        'abc@gmail.com',
        'abc@123',
      );
      expect(
        user,
        mockUser,
      );
    },
  );
}
