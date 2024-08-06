// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a vi locale. All the
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
  String get localeName => 'vi';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "firebaseAuthErrorDisable":
            MessageLookupByLibrary.simpleMessage("Tài khoản đã bị vô hiệu hoá"),
        "firebaseAuthErrorEmailAlreadyInUse":
            MessageLookupByLibrary.simpleMessage("Email đã được sử dụng"),
        "firebaseAuthErrorGeneral": MessageLookupByLibrary.simpleMessage(
            "Lỗi hệ thống, vui lòng thử lại sau"),
        "firebaseAuthErrorInvalidEmail":
            MessageLookupByLibrary.simpleMessage("Email không tồn tại"),
        "firebaseAuthErrorNotFound":
            MessageLookupByLibrary.simpleMessage("Tài khoản không tồn tại"),
        "firebaseAuthErrorPasswordAndConfirmPasswordNotMatch":
            MessageLookupByLibrary.simpleMessage(
                "Xác nhận mật khẩu không chính xác"),
        "firebaseAuthErrorWeakPassword":
            MessageLookupByLibrary.simpleMessage("Mật khẩu yếu"),
        "firebaseAuthErrorWrongPassword":
            MessageLookupByLibrary.simpleMessage("Mật khẩu sai"),
        "loginDoNotHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("Không có tài khoản?"),
        "loginEmail": MessageLookupByLibrary.simpleMessage("Email"),
        "loginPassword": MessageLookupByLibrary.simpleMessage("Mật khẩu"),
        "loginSignIn": MessageLookupByLibrary.simpleMessage("Đăng nhập"),
        "loginSignUp": MessageLookupByLibrary.simpleMessage("Đăng ký"),
        "loginToYourAccount": MessageLookupByLibrary.simpleMessage(
            "Đăng nhập vào tài khoản của bạn"),
        "signUp": MessageLookupByLibrary.simpleMessage("Đăng ký"),
        "signUpConfirmPassword":
            MessageLookupByLibrary.simpleMessage("Xác nhận mật khẩu"),
        "signUpCreateYourAccount":
            MessageLookupByLibrary.simpleMessage("Tạo tài khoản của bạn"),
        "signUpEmailWrongFormat":
            MessageLookupByLibrary.simpleMessage("Email không đúng định đạng")
      };
}
