import 'package:flutter/material.dart';
import 'package:news_app/features/main/presentation/page/main_screen.dart';

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
              return Container(
                color: Colors.blue,
              );
            } else if (tabItem == NaviTabItem.favorite) {
              return Container(
                color: Colors.green,
              );
            }
            return Container(
              color: Colors.red,
            );
          },
        );
      },
    );
  }
}
