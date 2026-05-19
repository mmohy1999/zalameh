import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zalameha/core/resource_manager/app_strings.dart';
import 'package:zalameha/core/resource_manager/routes_manager.dart';
import 'package:zalameha/core/theming/colors.dart';
import 'package:zalameha/core/utils/extensions.dart';
import 'package:zalameha/core/widgets/app_animations.dart';
import 'core/resource_manager/app_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _navigationTimer;

  @override
  void initState() {
    super.initState();

    _navigationTimer = Timer(const Duration(seconds: 3), () {
      if (!mounted) return;
      context.pushReplacementNamed(Routes.onboarding);
    });
  }

  @override
  void dispose() {
    _navigationTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: context.width,
        height: context.height,
        decoration: const BoxDecoration(color: ColorsManager.primaryColor),
        child: SafeArea(
          child: Column(
            children: [
              const Spacer(flex: 3),
              Image.asset(
                AppImages.logoImage,
                width: context.width * 0.80,
              ).screenEntry(),
              const Spacer(flex: 4),
              Text(
                StringsManager.splashFooter,
                textAlign: TextAlign.center,

                style: context
                    .textBodyLarge(
                      fontSize: context.width * 0.04,
                      color: ColorsManager.whiteColor,
                    )
                    ?.copyWith(
                      shadows: [
                        Shadow(
                          color: ColorsManager.blackText,
                          offset: const Offset(0, 1),
                          blurRadius: 2,
                        ),
                      ],
                    ),
              ).screenEntry(delay: AppAnimations.stagger * 2),
              SizedBox(height: context.height * 0.035),
            ],
          ),
        ),
      ),
    );
  }
}
