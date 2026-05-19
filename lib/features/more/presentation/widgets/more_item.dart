import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zalameha/core/resource_manager/app_images.dart';
import 'package:zalameha/core/theming/colors.dart';
import 'package:zalameha/core/utils/extensions.dart';
import 'package:zalameha/features/more/data/models/more_item.dart';

class MoreListItem extends StatelessWidget {
  const MoreListItem({super.key, required this.item, required this.isLast});

  final MoreItemData item;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final iconSize = context.width * 0.055;

    return InkWell(
      onTap: () {},
      child: Container(
        height: context.height * 0.064,
        decoration: isLast
            ? null
            : const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: ColorsManager.grayPageDots),
                ),
              ),
        child: Row(
          children: [
            SvgPicture.asset(item.icon, width: iconSize, height: iconSize),
            SizedBox(width: context.width * 0.03),
            Expanded(
              child: Text(
                item.title,
                style: context.textBodyLarge(
                  fontSize: context.width * 0.04,
                  color: ColorsManager.blackText,
                ),
              ),
            ),
            SvgPicture.asset(
              AppImages.arrowShort,
              width: context.width * 0.032,
              height: context.width * 0.032,
            ),
          ],
        ),
      ),
    );
  }
}
