// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Don't have an account?`
  String get loginDoNotHaveAnAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'loginDoNotHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get loginSignUp {
    return Intl.message(
      'Sign up',
      name: 'loginSignUp',
      desc: '',
      args: [],
    );
  }

  /// `Login to your account`
  String get loginToYourAccount {
    return Intl.message(
      'Login to your account',
      name: 'loginToYourAccount',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get loginEmail {
    return Intl.message(
      'Email',
      name: 'loginEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get loginPassword {
    return Intl.message(
      'Password',
      name: 'loginPassword',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get loginSignIn {
    return Intl.message(
      'Sign in',
      name: 'loginSignIn',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signUp {
    return Intl.message(
      'Sign up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Create your Account`
  String get signUpCreateYourAccount {
    return Intl.message(
      'Create your Account',
      name: 'signUpCreateYourAccount',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get signUpConfirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'signUpConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Email is not in the correct format`
  String get signUpEmailWrongFormat {
    return Intl.message(
      'Email is not in the correct format',
      name: 'signUpEmailWrongFormat',
      desc: '',
      args: [],
    );
  }

  /// `Weak Password`
  String get firebaseAuthErrorWeakPassword {
    return Intl.message(
      'Weak Password',
      name: 'firebaseAuthErrorWeakPassword',
      desc: '',
      args: [],
    );
  }

  /// `Email already in use`
  String get firebaseAuthErrorEmailAlreadyInUse {
    return Intl.message(
      'Email already in use',
      name: 'firebaseAuthErrorEmailAlreadyInUse',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect password confirmation`
  String get firebaseAuthErrorPasswordAndConfirmPasswordNotMatch {
    return Intl.message(
      'Incorrect password confirmation',
      name: 'firebaseAuthErrorPasswordAndConfirmPasswordNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Email does not exist`
  String get firebaseAuthErrorInvalidEmail {
    return Intl.message(
      'Email does not exist',
      name: 'firebaseAuthErrorInvalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Account disabled`
  String get firebaseAuthErrorDisable {
    return Intl.message(
      'Account disabled',
      name: 'firebaseAuthErrorDisable',
      desc: '',
      args: [],
    );
  }

  /// `Account does not exist`
  String get firebaseAuthErrorNotFound {
    return Intl.message(
      'Account does not exist',
      name: 'firebaseAuthErrorNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect password`
  String get firebaseAuthErrorWrongPassword {
    return Intl.message(
      'Incorrect password',
      name: 'firebaseAuthErrorWrongPassword',
      desc: '',
      args: [],
    );
  }

  /// `System error, please try again later`
  String get firebaseAuthErrorGeneral {
    return Intl.message(
      'System error, please try again later',
      name: 'firebaseAuthErrorGeneral',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
