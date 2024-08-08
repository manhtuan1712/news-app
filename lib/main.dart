import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app/core/helpers/app_utils.dart';
import 'package:news_app/core/helpers/global_configs.dart';
import 'package:news_app/my_app.dart';

Future<void> main() async {
  return runZonedGuarded(
    () async {
      await AppUtils.init();
      await dotenv.load(
        fileName: GlobalConfig.envPath,
      );
      FlutterError.onError =
          FirebaseCrashlytics.instance.recordFlutterFatalError;
      PlatformDispatcher.instance.onError = (
        error,
        stack,
      ) {
        FirebaseCrashlytics.instance.recordError(
          error,
          stack,
          fatal: true,
        );
        return true;
      };
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
