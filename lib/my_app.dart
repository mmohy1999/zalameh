import 'core/services/navigation_service.dart';
import 'core/theming/theme_app.dart';
import 'package:flutter/material.dart';
import 'core/resource_manager/routes_manager.dart';
import 'core/resource_manager/observers/route_observer.dart';
import 'core/resource_manager/app_strings.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: StringsManager.appTitle,
      navigatorObservers: [MyRouteObserver()],
      navigatorKey: NavigationService().navigatorKey,
      theme: appThemeData(),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splash,
      onGenerateRoute: RouteGenerator.getRoute,
      builder:
          (context, child) =>
              Directionality(textDirection: TextDirection.rtl, child: child!),
    );
  }
}
