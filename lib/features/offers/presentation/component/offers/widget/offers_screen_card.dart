import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zalameha/core/resource_manager/app_images.dart';
import 'package:zalameha/core/resource_manager/routes_manager.dart';
import 'package:zalameha/core/theming/colors.dart';
import 'package:zalameha/core/utils/extensions.dart';
import 'package:zalameha/core/widgets/app_cached_image.dart';
import 'package:zalameha/features/offers/data/models/offer_modle.dart';

class OffersScreenCard extends StatelessWidget {
  const OffersScreenCard({super.key, required this.offer});

  final OfferModel offer;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pushNamed(Routes.offerDetails, arguments: offer),
      child: SizedBox(
        width: double.infinity,
        height: context.height * 0.34,
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: AppCachedImage(
                  imagePath: offer.coverImage,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: context.height * 0.012),
            SizedBox(
              height: context.height * 0.06,
              child: Row(
                children: [
                  SizedBox(
                    width: context.width * 0.13,
                    height: context.width * 0.13,
                    child: AppCachedImage(
                      imagePath: offer.logo,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: context.width * 0.02),
                  Expanded(
                    child: Text(
                      offer.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.textBodyLarge(
                        fontSize: context.width * 0.036,
                        color: ColorsManager.black,
                      ),
                    ),
                  ),
                  SizedBox(width: context.width * 0.035),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        offer.stars.toStringAsFixed(1),
                        style: context.textBodyLarge(
                          fontSize: context.width * 0.032,
                          color: ColorsManager.black,
                        ),
                      ),
                      SizedBox(width: context.width * 0.015),
                      SvgPicture.asset(
                        AppImages.star,
                        width: context.width * 0.04,
                        height: context.width * 0.04,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
