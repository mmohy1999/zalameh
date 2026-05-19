import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zalameha/core/resource_manager/app_images.dart';
import 'package:zalameha/core/resource_manager/app_strings.dart';
import 'package:zalameha/core/theming/colors.dart';
import 'package:zalameha/core/utils/extensions.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key, this.onChanged, this.controller});

  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  late final TextEditingController _controller;
  Timer? _hintTimer;
  int _hintIndex = 0;
  bool _hasText = false;

  static const List<String> _hints = [
    StringsManager.searchOnShop,
    StringsManager.searchOnOffer,
    StringsManager.searchOnJob,
    StringsManager.searchOnCategory,
  ];

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _hasText = _controller.text.isNotEmpty;
    _controller.addListener(_handleTextChanged);
    _hintTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted || _hasText) return;
      setState(() => _hintIndex = (_hintIndex + 1) % _hints.length);
    });
  }

  @override
  void dispose() {
    _hintTimer?.cancel();
    _controller.removeListener(_handleTextChanged);
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _handleTextChanged() {
    final hasText = _controller.text.isNotEmpty;
    if (hasText != _hasText) {
      setState(() => _hasText = hasText);
    }
    widget.onChanged?.call(_controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.height * 0.012),
      child: SizedBox(
        height: context.height * 0.058,
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            TextField(
              controller: _controller,
              textInputAction: TextInputAction.search,
              textAlignVertical: TextAlignVertical.center,
              style: context.textBodyLarge(
                fontSize: context.width * 0.038,
                color: ColorsManager.blackText,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: ColorsManager.grayColor,
                contentPadding: EdgeInsetsDirectional.only(
                  start: context.width * 0.13,
                  end: context.width * 0.04,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            PositionedDirectional(
              start: context.width * 0.04,
              child: SvgPicture.asset(
                AppImages.seachIcon,
                width: context.width * 0.05,
                height: context.width * 0.05,
                colorFilter: const ColorFilter.mode(
                  ColorsManager.bottomNavText,
                  BlendMode.srcIn,
                ),
              ),
            ),
            if (!_hasText)
              PositionedDirectional(
                end: context.width * 0.04,
                start: context.width * 0.13,
                child: IgnorePointer(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (child, animation) => FadeTransition(
                      opacity: animation,
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0, 0.35),
                          end: Offset.zero,
                        ).animate(animation),
                        child: child,
                      ),
                    ),
                    child: Align(
                      key: ValueKey(_hints[_hintIndex]),
                      alignment: Alignment.centerRight,
                      child: Text(
                        _hints[_hintIndex],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: context.textBodyLarge(
                          fontSize: context.width * 0.038,
                          color: ColorsManager.bottomNavText,
                        ),
                      ),
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
