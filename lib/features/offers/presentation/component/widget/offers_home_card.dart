import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zalameha/core/resource_manager/app_images.dart';
import 'package:zalameha/core/resource_manager/routes_manager.dart';
import 'package:zalameha/core/theming/colors.dart';
import 'package:zalameha/core/utils/extensions.dart';
import 'package:zalameha/core/widgets/app_cached_image.dart';
import 'package:zalameha/features/offers/data/models/offer_modle.dart';

class OffersCard extends StatelessWidget {
  const OffersCard({super.key, required this.offer, this.width});

  final OfferModel offer;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pushNamed(Routes.offerDetails, arguments: offer),
      child: SizedBox(
        width: width ?? context.width * 0.8,
        child: Column(
          children: [
            Expanded(
              child: AppCachedImage(
                imagePath: offer.coverImage,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: context.height * 0.075,
              child: Row(
                children: [
                  SizedBox(
                    width: context.width * 0.14,
                    height: context.width * 0.14,
                    child: AppCachedImage(
                      imagePath: offer.logo,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: context.width * 0.01),
                  Expanded(
                    child: Text(
                      offer.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.textBodyLarge(
                        fontSize: context.width * 0.043,
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
                          fontSize: context.width * 0.038,
                          color: ColorsManager.black,
                        ),
                      ),
                      SizedBox(width: context.width * 0.015),
                      SvgPicture.asset(
                        AppImages.star,
                        width: context.width * 0.055,
                        height: context.width * 0.055,
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
