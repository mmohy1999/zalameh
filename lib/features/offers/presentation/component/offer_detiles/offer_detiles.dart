import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zalameha/core/resource_manager/app_images.dart';
import 'package:zalameha/core/resource_manager/app_strings.dart';
import 'package:zalameha/core/services/share_service.dart';
import 'package:zalameha/core/services/socilservies.dart';
import 'package:zalameha/core/theming/colors.dart';
import 'package:zalameha/core/utils/extensions.dart';
import 'package:zalameha/core/widgets/app_cached_image.dart';
import 'package:zalameha/core/widgets/app_animations.dart';
import 'package:zalameha/core/widgets/app_header.dart';
import 'package:zalameha/features/offers/data/models/offer_modle.dart';
import 'package:zalameha/features/offers/presentation/component/offer_detiles/widgets/offers_sections.dart';
part 'widgets/offer_info.dart';
part 'widgets/offer_detiles_footer.dart';

class OfferDetiles extends StatelessWidget {
  const OfferDetiles({super.key, this.offer});

  final OfferModel? offer;

  @override
  Widget build(BuildContext context) {
    final offerData = offer ?? homeOffers[1];

    return Scaffold(
      backgroundColor: ColorsManager.whiteColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.width * 0.04),
              child: Column(
                children: [
                  AppHeader(
                    title: StringsManager.storeDetails,
                    trailing: IconButton(
                      onPressed: () => ShareService.shareOffer(offerData),
                      icon: SvgPicture.asset(
                        AppImages.share,
                        width: context.width * 0.05,
                        height: context.width * 0.05,
                      ),
                    ),
                    leading: IconButton(
                      onPressed: context.pop,
                      icon: Transform.rotate(
                        angle: 3.14159,
                        child: SvgPicture.asset(
                          AppImages.arrow,
                          width: context.width * 0.05,
                        ),
                      ),
                    ),
                  ).screenEntry(),
                  SizedBox(height: context.height * 0.02),
                  OfferInfo(
                    offerData: offerData,
                  ).screenEntry(delay: AppAnimations.stagger),
                  SizedBox(height: context.height * 0.025),
                  OffersSection().screenEntry(delay: AppAnimations.stagger * 2),
                ],
              ),
            ),
            const Spacer(),
            const OfferDetilesFooter(),
          ],
        ),
      ),
    );
  }
}
