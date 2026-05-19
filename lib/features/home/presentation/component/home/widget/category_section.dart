import 'package:flutter/material.dart';
import 'package:zalameha/core/theming/colors.dart';
import 'package:zalameha/core/utils/extensions.dart';
import 'package:zalameha/core/widgets/app_cached_image.dart';
import 'package:zalameha/features/home/domian/models/category_item.dart';
part 'category_card.dart';
class CategorySection extends StatelessWidget {
  const CategorySection({super.key});


  @override
  Widget build(BuildContext context) {
    final itemWidth = context.width * 0.18;

    return SizedBox(
      height: context.height * 0.275,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: (categories.length / 2).ceil(),
        separatorBuilder: (context, index) =>
            SizedBox(width: context.width * 0.04),
        itemBuilder: (context, columnIndex) {
          final topIndex = columnIndex * 2;
          final bottomIndex = topIndex + 1;

          return SizedBox(
            width: itemWidth,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _CategoryCard(category: categories[topIndex]),
                SizedBox(height: context.height * 0.01),
                if (bottomIndex < categories.length)
                  _CategoryCard(category: categories[bottomIndex]),
              ],
            ),
          );
        },
      ),
    );
  }
}

