import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:news_app/core/di/injection_container.dart' as di;
import 'package:news_app/core/helpers/secure_storage.dart';
import 'package:news_app/core/navigation/navigation_center.dart';
import 'package:news_app/firebase_options.dart';

class AppUtils {
  static BuildContext get contextMain =>
      NavigationCenter.navigatorKey.currentContext!;

  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await di.init();
    await di.sl<SecureStorage>().init();
  }

  static showToastMessage(
    String message,
    BuildContext context,
  ) {
    if (message.isNotEmpty) {
      Future.delayed(
        const Duration(milliseconds: 200),
        () {
          Fluttertoast.showToast(
            msg: message,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 2,
            backgroundColor: Theme.of(context).colorScheme.scrim,
            textColor: Theme.of(context).colorScheme.surfaceDim,
          );
        },
      );
    }
  }
}
