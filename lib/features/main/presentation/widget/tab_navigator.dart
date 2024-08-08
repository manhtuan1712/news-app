import 'package:flutter/material.dart';
import 'package:news_app/features/bookmark/presentation/page/bookmark_screen.dart';
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
              return const HomeScreen();
            } else if (tabItem == NaviTabItem.bookmark) {
              return const BookMarkScreen();
            }
            return const ProfileScreen();
          },
        );
      },
    );
  }
}
