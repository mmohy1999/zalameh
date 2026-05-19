import 'package:flutter/material.dart';
import 'package:zalameha/core/resource_manager/app_strings.dart';
import 'package:zalameha/core/utils/extensions.dart';
import 'package:zalameha/core/widgets/selectable_filter_chip.dart';

class OffersSection extends StatefulWidget {
  const OffersSection({super.key});

  @override
  State<OffersSection> createState() => _OffersSectionState();
}

class _OffersSectionState extends State<OffersSection> {
  int _selectedIndex = 0;

  static const List<String> _categories = [
    StringsManager.strongestOffers,
    StringsManager.jobs,
    StringsManager.branches,
    StringsManager.additionalInfo,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.045,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        separatorBuilder: (context, index) =>
            SizedBox(width: context.width * 0.01),
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
