import 'package:zalameha/core/resource_manager/app_images.dart';
import 'package:zalameha/core/resource_manager/app_strings.dart';

class OnboardingPageData {
  const OnboardingPageData({
    required this.image,
    required this.title,
    required this.description,
  });

  final String image;
  final String title;
  final String description;
}

  final pages = [
    OnboardingPageData(
      image: AppImages.onboarding1,
      title: StringsManager.onboardingTitle1,
      description: StringsManager.onboardingSubTitle1,
    ),
    OnboardingPageData(
      image: AppImages.onboarding2,
      title: StringsManager.onboardingTitle2,
      description: StringsManager.onboardingSubTitle2,
    ),
    OnboardingPageData(
      image: AppImages.onboarding3,
      title: StringsManager.onboardingTitle3,
      description: StringsManager.onboardingSubTitle3,
    ),
  ];
