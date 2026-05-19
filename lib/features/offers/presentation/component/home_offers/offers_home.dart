import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zalameha/core/resource_manager/app_images.dart';
import 'package:zalameha/core/resource_manager/app_strings.dart';
import 'package:zalameha/core/utils/extensions.dart';
import 'package:zalameha/features/offers/data/models/offer_modle.dart';
import 'package:zalameha/features/offers/presentation/component/widget/offers_home_card.dart';

class OffersHome extends StatelessWidget {
  const OffersHome({super.key, required this.onViewAllTap});

  final VoidCallback onViewAllTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.36,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              InkWell(
                onTap: onViewAllTap,
                borderRadius: BorderRadius.circular(4),
                child: Text(
                  StringsManager.featuredOffers,
                  style: context.textTitleLarge(
                    fontSize: context.width * 0.052,
                  ),
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: onViewAllTap,
                borderRadius: BorderRadius.circular(4),
                child: Padding(
                  padding: EdgeInsets.all(context.width * 0.01),
                  child: SvgPicture.asset(
                    AppImages.arrow,
                    height: context.height * 0.02,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: context.height * 0.018),
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: homeOffers.length,
              separatorBuilder:
                  (context, index) => SizedBox(width: context.width * 0.04),
              itemBuilder:
                  (context, index) => OffersCard(offer: homeOffers[index]),
            ),
          ),
        ],
      ),
    );
  }
}
