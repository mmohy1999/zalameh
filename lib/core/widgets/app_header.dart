import 'package:flutter/material.dart';
import 'package:zalameha/core/utils/extensions.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({
    super.key,
    required this.title,
    this.leading,
    this.trailing,
  });
  final String title;
  final Widget? leading;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight,
      child: Row(
        children: [
          leading ?? const SizedBox(),
          if (trailing != null) Opacity(opacity: 0, child: trailing),
          const Spacer(),
          Text(
            title,
            style: context.textTitleLarge(fontSize: context.width * 0.05),
          ),
          const Spacer(),
          if (leading != null) Opacity(opacity: 0, child: leading),
          trailing ?? const SizedBox(),
        ],
      ),
    );
  }
}
