import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zalameha/core/resource_manager/app_images.dart';
import 'package:zalameha/core/resource_manager/app_strings.dart';
import 'package:zalameha/core/theming/colors.dart';
import 'package:zalameha/core/utils/extensions.dart';
import 'package:zalameha/core/widgets/app_cached_image.dart';
import 'package:zalameha/features/home/domian/models/partner_item.dart';

part 'partner_card.dart';

class PartnerSection extends StatelessWidget {
  const PartnerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text(
                StringsManager.featuredPartners,
                textAlign: TextAlign.end,
                style: context.textTitleLarge(fontSize: context.width * 0.052),
              ),
              const Spacer(),
              SvgPicture.asset(AppImages.arrow, height: context.height * 0.02),
            ],
          ),
          SizedBox(height: context.height * 0.018),
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: partners.length,
              separatorBuilder: (context, index) =>
                  SizedBox(width: context.width * 0.04),
              itemBuilder: (context, index) =>
                  _PartnerCard(partner: partners[index]),
            ),
          ),
        ],
      ),
    );
  }
}
