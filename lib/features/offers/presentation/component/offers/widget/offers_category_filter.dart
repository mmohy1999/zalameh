import 'package:flutter/material.dart';
import 'package:zalameha/core/resource_manager/app_strings.dart';
import 'package:zalameha/core/utils/extensions.dart';
import 'package:zalameha/core/widgets/selectable_filter_chip.dart';

class OffersCategoryFilter extends StatefulWidget {
  const OffersCategoryFilter({super.key});

  @override
  State<OffersCategoryFilter> createState() => _OffersCategoryFilterState();
}

class _OffersCategoryFilterState extends State<OffersCategoryFilter> {
  int _selectedIndex = 0;

  static const List<String> _categories = [
    StringsManager.all,
    StringsManager.fashionAndClothing,
    StringsManager.electronics,
    StringsManager.homeAndKitchen,
    StringsManager.restaurantsAndFood,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.045,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        separatorBuilder:
            (context, index) => SizedBox(width: context.width * 0.02),
        itemBuilder: (context, index) {
          final isSelected = index == _selectedIndex;

          return InkWell(
            onTap: () => setState(() => _selectedIndex = index),
            borderRadius: BorderRadius.circular(5),
            child: SelectableFilterChip(
              label: _categories[index],
              isSelected: isSelected,
            ),
          );
        },
      ),
    );
  }
}
