import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AppAnimations {
  const AppAnimations._();

  static const Duration fast = Duration(milliseconds: 220);
  static const Duration normal = Duration(milliseconds: 420);
  static const Duration slow = Duration(milliseconds: 650);
  static const Duration stagger = Duration(milliseconds: 70);

  static Curve get curve => Curves.easeOutCubic;
}

extension AppAnimationX on Widget {
  Widget screenEntry({Duration delay = Duration.zero}) {
    return animate(delay: delay)
        .fadeIn(duration: AppAnimations.normal, curve: AppAnimations.curve)
        .moveY(
          begin: 16,
          end: 0,
          duration: AppAnimations.normal,
          curve: AppAnimations.curve,
        );
  }

  Widget listEntry(int index) {
    return animate(delay: AppAnimations.stagger * index)
        .fadeIn(duration: AppAnimations.normal, curve: AppAnimations.curve)
        .moveY(
          begin: 18,
          end: 0,
          duration: AppAnimations.normal,
          curve: AppAnimations.curve,
        );
  }

  Widget softScale({required bool active}) {
    return animate(target: active ? 1 : 0).scale(
      begin: const Offset(1, 1),
      end: const Offset(1.12, 1.12),
      duration: AppAnimations.fast,
      curve: AppAnimations.curve,
    );
  }
}
