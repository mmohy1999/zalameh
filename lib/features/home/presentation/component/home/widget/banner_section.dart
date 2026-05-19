import 'package:flutter/material.dart';
import 'package:zalameha/core/theming/colors.dart';
import 'package:zalameha/core/utils/extensions.dart';
import 'package:zalameha/core/widgets/app_cached_image.dart';

class BannerSection extends StatelessWidget {
  const BannerSection({super.key});

  static const List<String> _bannerImages = [
    'https://i.postimg.cc/nVSZLjh6/b1.png',
    'https://i.postimg.cc/h4ZgGzGz/b2.png',
    'https://i.postimg.cc/yYJK31Jg/b3.png',
    'https://i.postimg.cc/jdWTnxWc/b4.png',
    'https://i.postimg.cc/GmG1zXxt/b5.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.25,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _bannerImages.length,
        separatorBuilder: (context, index) =>
            SizedBox(width: context.width * 0.025),
        itemBuilder: (context, index) => Container(
          width: context.width * 0.86,
          decoration: BoxDecoration(
            color: ColorsManager.grayColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: ColorsManager.grayPageDots),
          ),
          clipBehavior: Clip.antiAlias,
          child: AppCachedImage(
            imagePath: _bannerImages[index],
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
