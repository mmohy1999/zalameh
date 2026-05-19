import 'package:flutter/material.dart';
import 'package:zalameha/core/theming/colors.dart';
import 'package:zalameha/core/utils/extensions.dart';

class SelectableFilterChip extends StatelessWidget {
  const SelectableFilterChip({
    super.key,
    required this.label,
    required this.isSelected,
  });

  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.02),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isSelected
            ? ColorsManager.primaryColor
            : ColorsManager.whiteColor,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: isSelected
              ? ColorsManager.primaryColor
              : ColorsManager.grayPageDots,
        ),
      ),
      child: Text(
        label,
        style: context.textBodyLarge(
          fontSize: context.width * 0.031,
          color: isSelected
              ? ColorsManager.whiteColor
              : ColorsManager.blackText,
        ),
      ),
    );
  }
}
