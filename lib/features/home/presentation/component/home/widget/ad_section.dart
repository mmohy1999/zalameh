import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zalameha/core/utils/extensions.dart';
import 'package:zalameha/core/widgets/app_cached_image.dart';

class AdSection extends StatefulWidget {
  const AdSection({super.key});

  @override
  State<AdSection> createState() => _AdSectionState();
}

class _AdSectionState extends State<AdSection> {
  Timer? _timer;
  int _currentIndex = 0;

  static const List<String> _adImages = [
    'https://i.postimg.cc/59HY0cVf/ad1.png',
    'https://i.postimg.cc/MKVn7yHn/ad2.png',
    'https://i.postimg.cc/B6BhP8Ds/ad3.png',
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 1500), (_) {
      if (!mounted) return;

      setState(() {
        _currentIndex = (_currentIndex + 1) % _adImages.length;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.19,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 350),
        child: AppCachedImage(
          key: ValueKey(_adImages[_currentIndex]),
          imagePath: _adImages[_currentIndex],
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
