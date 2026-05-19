import 'package:flutter/material.dart';
import 'package:zalameha/core/resource_manager/app_strings.dart';
import 'package:zalameha/core/theming/colors.dart';
import 'package:zalameha/core/utils/extensions.dart';
import 'package:zalameha/core/widgets/app_animations.dart';
import 'package:zalameha/features/onboarding/data/models/onboarding_page_data.dart';

/// Card that renders a single onboarding page with its animations and controls.
class OnboardingCard extends StatelessWidget {
  const OnboardingCard({
    super.key,
    required this.data,
    required this.isActive,
    required this.isLast,
    required this.currentIndex,
    required this.total,
    required this.onNext,
  });

  final OnboardingPageData data;
  final bool isActive;
  final bool isLast;
  final int currentIndex;
  final int total;
  final Future<void> Function() onNext;

  @override
  Widget build(BuildContext context) {
    final h = context.height;
    final w = context.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: w,

          child: Image.asset(data.image, fit: BoxFit.contain),
        ).screenEntry(),
        SizedBox(height: h * 0.03),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.07),
            child: Column(
              children: [
                Text(
                  data.title,
                  textAlign: TextAlign.center,
                  style: context.textTitleLarge(fontSize: w * 0.08),
                ).screenEntry(delay: AppAnimations.stagger),
                SizedBox(height: h * 0.018),
                Text(
                  data.description,
                  textAlign: TextAlign.center,
                  style: context.textBodyLarge(fontSize: w * 0.05),
                ).screenEntry(delay: AppAnimations.stagger * 2),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    total,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: h * 0.006,
                      width: w * 0.07,
                      margin: EdgeInsets.symmetric(horizontal: w * 0.006),
                      decoration: BoxDecoration(
                        color:
                            currentIndex >= index
                                ? ColorsManager.primaryColor
                                : ColorsManager.grayPageDots,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ).screenEntry(delay: AppAnimations.stagger * 3),
                SizedBox(height: h * 0.02),
                SizedBox(
                  width: double.infinity,
                  height: h * 0.06,
                  child: ElevatedButton(
                    onPressed: onNext,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          isLast
                              ? ColorsManager.primaryColor
                              : ColorsManager.grayColor,
                      foregroundColor:
                          isLast
                              ? ColorsManager.whiteColor
                              : ColorsManager.blackText,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      textStyle: context.textBodyLarge(fontSize: w * 0.045),
                    ),
                    child: Text(
                      isLast ? StringsManager.letsstart : StringsManager.next,
                      style: context.textBodyLarge(
                        fontSize: w * 0.045,
                        color:
                            isLast
                                ? ColorsManager.whiteColor
                                : ColorsManager.blackText,
                      ),
                    ),
                  ),
                ).screenEntry(delay: AppAnimations.stagger * 4),
                SizedBox(height: h * 0.035),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
