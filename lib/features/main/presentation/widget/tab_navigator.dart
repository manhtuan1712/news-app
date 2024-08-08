import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/di/injection_container.dart';
import 'package:news_app/features/home/presentation/cubit/home_article_cubit.dart';
import 'package:news_app/features/home/presentation/cubit/home_source_cubit.dart';
import 'package:news_app/features/home/presentation/page/home_screen.dart';
import 'package:news_app/features/main/presentation/page/main_screen.dart';
import 'package:news_app/features/profile/presentation/page/profile_screen.dart';

class TabNavigatorRoutes {
  static const String root = '/';
}

class TabNavigator extends StatelessWidget {
  const TabNavigator({
    super.key,
    this.navigatorKey,
    this.tabItem,
    this.scrollController,
  });

  final GlobalKey<NavigatorState>? navigatorKey;

  final NaviTabItem? tabItem;

  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorRoutes.root,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) {
            if (tabItem == NaviTabItem.home) {
              return MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (_) => sl<HomeArticleCubit>(),
                  ),
                  BlocProvider(
                    create: (_) => sl<HomeSourceCubit>(),
                  ),
                ],
                child: const HomeScreen(),
              );
            } else if (tabItem == NaviTabItem.favorite) {
              return Container(
                color: Colors.green,
              );
            }
            return const ProfileScreen();
          },
        );
      },
    );
  }
}
