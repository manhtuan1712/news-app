import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:news_app/core/di/injection_container.dart';
import 'package:news_app/core/helpers/global_configs.dart';
import 'package:news_app/core/navigation/navigation_center.dart';
import 'package:news_app/core/theme/theme_style.dart';
import 'package:news_app/features/authentication/presentation/cubit/login_cubit.dart';
import 'package:news_app/features/authentication/presentation/cubit/sign_up_cubit.dart';
import 'package:news_app/features/main/presentation/page/main_screen.dart';
import 'package:news_app/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:news_app/generated/l10n.dart';

import 'features/authentication/presentation/page/login_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

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
      providers: [
        BlocProvider(
          create: (_) => sl<LoginCubit>(),
        ),
        BlocProvider(
          create: (_) => sl<SignUpCubit>(),
        ),
        BlocProvider(
          create: (_) => sl<ProfileCubit>(),
        ),
      ],
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
        home: FirebaseAuth.instance.currentUser != null
            ? const MainScreen()
            : const LoginScreen(),
      ),
    );
  }
}
