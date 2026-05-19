import 'package:flutter/material.dart';
import 'package:zalameha/core/services/logger_service.dart';

class MyRouteObserver extends NavigatorObserver {
  static Route<dynamic>? currentRoute;

  void _sendScreenView(PageRoute<dynamic> route) {
    final screenName = route.settings.name;
    if (screenName == null || screenName.isEmpty) {
      return;
    }
    LoggerService.logInfo('Current route: $screenName');
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (route is PageRoute) {
      currentRoute = route;
      _sendScreenView(route);
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    if (newRoute is PageRoute) {
      currentRoute = newRoute;
      _sendScreenView(newRoute);
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (previousRoute is PageRoute && route is PageRoute) {
      currentRoute = previousRoute;
      _sendScreenView(previousRoute);
      return;
    }

    if (previousRoute == null) {
      currentRoute = null;
    }
  }
}
