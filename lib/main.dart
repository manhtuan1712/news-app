import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/core/helpers/app_utils.dart';
import 'package:news_app/my_app.dart';

Future<void> main() async {
  return runZonedGuarded(
    () async {
      await AppUtils.init();
      runApp(
        const MyApp(),
      );
    },
    (error, stack) {
      debugPrint('$stack');
      debugPrint('$error');
    },
  );
}
