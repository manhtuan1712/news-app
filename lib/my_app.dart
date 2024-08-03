import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:news_app/core/helpers/global_configs.dart';
import 'package:news_app/core/navigation/navigation_center.dart';
import 'package:news_app/core/theme/theme_style.dart';
import 'package:news_app/generated/l10n.dart';

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiBlocProvider(
      providers: const [],
      child: MaterialApp(
        navigatorKey: NavigationCenter.navigatorKey,
        title: '',
        builder: EasyLoading.init(),
        theme: ThemeStyle.lightTheme,
        darkTheme: ThemeStyle.darkTheme,
        debugShowCheckedModeBanner: false,
        locale: Platform.localeName.isEmpty
            ? const Locale(GlobalConfig.languageEn)
            : Locale(Platform.localeName),
        showPerformanceOverlay: false,
        showSemanticsDebugger: false,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        onGenerateRoute: NavigationCenter.generateRoute,
        home: const SizedBox(),
      ),
    );
  }
}
