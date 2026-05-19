import 'package:flutter/material.dart';
import 'package:zalameha/core/resource_manager/app_strings.dart';
import 'package:zalameha/core/utils/extensions.dart';
import 'package:zalameha/core/widgets/app_animations.dart';
import 'package:zalameha/core/widgets/app_header.dart';
import 'package:zalameha/core/widgets/search_widget.dart';
import 'package:zalameha/features/offers/data/models/offer_modle.dart';
import 'package:zalameha/features/offers/presentation/component/offers/widget/offers_category_filter.dart';
import 'package:zalameha/features/offers/presentation/component/offers/widget/offers_screen_card.dart';

part 'widget/offers_list.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width * 0.04),
        child: Column(
          children: [
            const AppHeader(title: StringsManager.offers).screenEntry(),
            const SearchWidget().screenEntry(delay: AppAnimations.stagger),
            const OffersCategoryFilter().screenEntry(
              delay: AppAnimations.stagger * 2,
            ),
            SizedBox(height: context.height * 0.018),
            Expanded(child: _OffersList()),
          ],
        ),
      ),
    );
  }
}
