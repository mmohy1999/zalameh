import 'package:flutter/material.dart';
import 'package:zalameha/core/resource_manager/app_images.dart';
import 'package:zalameha/core/resource_manager/app_strings.dart';
import 'package:zalameha/core/theming/colors.dart';
import 'package:zalameha/core/utils/extensions.dart';

class AddBusinessCard extends StatelessWidget {
  const AddBusinessCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.29,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        image: const DecorationImage(
          image: AssetImage(AppImages.addBusinessCard),
          fit: BoxFit.cover,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.06,
          vertical: context.height * 0.028,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StringsManager.addYourBusiness,
              textAlign: TextAlign.start,
              style: context.textTitleLarge(
                fontSize: context.width * 0.065,
                color: ColorsManager.whiteColor,
              ),
            ),
            SizedBox(height: context.height * 0.022),
            Text(
              StringsManager.addBusinessDescription,
              maxLines: 2,
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              style: context.textBodyLarge(
                fontSize: context.width * 0.042,
                color: ColorsManager.whiteColor,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: context.width * 0.28,
              height: context.height * 0.06,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsManager.whiteColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
                child: Text(
                  StringsManager.startNow,
                  style: context.textTitleLarge(
                    fontSize: context.width * 0.038,
                    color: ColorsManager.primarySecColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
