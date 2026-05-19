import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zalameha/core/resource_manager/app_images.dart';
import 'package:zalameha/core/resource_manager/app_strings.dart';
import 'package:zalameha/core/theming/colors.dart';
import 'package:zalameha/core/utils/extensions.dart';
import 'package:zalameha/core/widgets/app_animations.dart';
import 'package:zalameha/core/widgets/app_header.dart';
import 'package:zalameha/features/more/data/models/more_item.dart';
import 'package:zalameha/features/more/presentation/widgets/more_item.dart';

part 'widgets/more_list.dart';
part 'widgets/info_widget.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width * 0.04),
        child: Column(
          children: [
            AppHeader(
              title: StringsManager.more,
              trailing: SvgPicture.asset(
                AppImages.setting,
                width: context.width * 0.055,
                height: context.width * 0.055,
              ),
            ).screenEntry(),
            MoreList().screenEntry(delay: AppAnimations.stagger),
            const Spacer(),
            InfoWidget().screenEntry(delay: AppAnimations.stagger * 3),
            SizedBox(height: context.height * 0.025),
          ],
        ),
      ),
    );
  }
}
