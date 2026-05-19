import 'package:flutter/material.dart';

class NavigationService {
  NavigationService._internal();
  static final NavigationService _instance = NavigationService._internal();
  factory NavigationService() => _instance;

  GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  void resetNavigatorKey() {
    _navigatorKey = GlobalKey<NavigatorState>();
  }
}
