import 'package:zalameha/core/resource_manager/app_images.dart';
import 'package:zalameha/core/resource_manager/app_strings.dart';

class MoreItemData {
  const MoreItemData({required this.title, required this.icon});

  final String title;
  final String icon;
}

const items = [
      MoreItemData(title: StringsManager.supportTeam, icon: AppImages.support),
      MoreItemData(
        title: StringsManager.privacyPolicy,
        icon: AppImages.privacy,
      ),
      MoreItemData(title: StringsManager.termsOfUse, icon: AppImages.terms),
      MoreItemData(
        title: StringsManager.frequentlyAskedQuestions,
        icon: AppImages.faq,
      ),
      MoreItemData(title: StringsManager.aboutApp, icon: AppImages.gift),
      MoreItemData(title: StringsManager.shareApp, icon: AppImages.share),
      MoreItemData(title: StringsManager.rateApp, icon: AppImages.rate),
    ];