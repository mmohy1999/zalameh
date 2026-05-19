import 'package:flutter/material.dart';
import 'package:zalameha/core/widgets/app_animations.dart';
import 'package:zalameha/features/offers/data/models/offer_modle.dart';
import 'package:zalameha/features/offers/presentation/component/offer_detiles/offer_detiles.dart';
import 'package:zalameha/features/main/presentation/main_screen.dart';
import 'package:zalameha/features/onboarding/presentation/onboarding_screen.dart';
import '../../splash.dart';

class Routes {
  Routes._();

  static const String splash = "/splash";
  static const String onboarding = "/onboarding";
  static const String home = "/home";
  static const String offerDetails = "/offer-details";
}

class RouteGenerator {
  static String currentContext = '';

  static Route<dynamic> _animatedRoute({
    required RouteSettings settings,
    required WidgetBuilder builder,
  }) {
    return PageRouteBuilder(
      settings: settings,
      transitionDuration: AppAnimations.normal,
      reverseTransitionDuration: AppAnimations.fast,
      pageBuilder: (context, animation, secondaryAnimation) => builder(context),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: AppAnimations.curve,
          reverseCurve: Curves.easeInCubic,
        );

        return FadeTransition(
          opacity: curvedAnimation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.06, 0),
              end: Offset.zero,
            ).animate(curvedAnimation),
            child: child,
          ),
        );
      },
    );
  }

  static Route<dynamic>? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboarding:
        currentContext = Routes.onboarding;
        return _animatedRoute(
          settings: settings,
          builder: (_) => const OnboardingScreen(),
        );
      case Routes.splash:
        currentContext = Routes.splash;
        return _animatedRoute(
          settings: settings,
          builder: (_) => const SplashScreen(),
        );
      case Routes.home:
        currentContext = Routes.home;
        return _animatedRoute(
          settings: settings,
          builder: (_) => const MainScreen(),
        );
      case Routes.offerDetails:
        currentContext = Routes.offerDetails;
        final offer =
            settings.arguments is OfferModel
                ? settings.arguments as OfferModel
                : null;
        return _animatedRoute(
          settings: settings,
          builder: (_) => OfferDetiles(offer: offer),
        );
    }

    return null;
  }
}
