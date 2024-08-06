// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "firebaseAuthErrorDisable":
            MessageLookupByLibrary.simpleMessage("Account disabled"),
        "firebaseAuthErrorEmailAlreadyInUse":
            MessageLookupByLibrary.simpleMessage("Email already in use"),
        "firebaseAuthErrorGeneral": MessageLookupByLibrary.simpleMessage(
            "System error, please try again later"),
        "firebaseAuthErrorInvalidEmail":
            MessageLookupByLibrary.simpleMessage("Email does not exist"),
        "firebaseAuthErrorNotFound":
            MessageLookupByLibrary.simpleMessage("Account does not exist"),
        "firebaseAuthErrorPasswordAndConfirmPasswordNotMatch":
            MessageLookupByLibrary.simpleMessage(
                "Incorrect password confirmation"),
        "firebaseAuthErrorWeakPassword":
            MessageLookupByLibrary.simpleMessage("Weak Password"),
        "firebaseAuthErrorWrongPassword":
            MessageLookupByLibrary.simpleMessage("Incorrect password"),
        "loginDoNotHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("Don\'t have an account?"),
        "loginEmail": MessageLookupByLibrary.simpleMessage("Email"),
        "loginPassword": MessageLookupByLibrary.simpleMessage("Password"),
        "loginSignIn": MessageLookupByLibrary.simpleMessage("Sign in"),
        "loginSignUp": MessageLookupByLibrary.simpleMessage("Sign up"),
        "loginToYourAccount":
            MessageLookupByLibrary.simpleMessage("Login to your account"),
        "signUp": MessageLookupByLibrary.simpleMessage("Sign up"),
        "signUpConfirmPassword":
            MessageLookupByLibrary.simpleMessage("Confirm Password"),
        "signUpCreateYourAccount":
            MessageLookupByLibrary.simpleMessage("Create your Account"),
        "signUpEmailWrongFormat": MessageLookupByLibrary.simpleMessage(
            "Email is not in the correct format")
      };
}
