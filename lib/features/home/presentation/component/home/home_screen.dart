import 'package:flutter/material.dart';
import 'package:zalameha/core/resource_manager/app_strings.dart';
import 'package:zalameha/core/utils/extensions.dart';
import 'package:zalameha/core/widgets/app_animations.dart';
import 'package:zalameha/core/widgets/app_header.dart';
import 'package:zalameha/core/widgets/search_widget.dart';
import 'package:zalameha/features/home/presentation/component/home/widget/add_business_card.dart';
import 'package:zalameha/features/home/presentation/component/home/widget/ad_section.dart';
import 'package:zalameha/features/home/presentation/component/home/widget/banner_section.dart';
import 'package:zalameha/features/home/presentation/component/home/widget/category_section.dart';
import 'package:zalameha/features/home/presentation/component/home/widget/partner_section.dart';
import 'package:zalameha/features/jobs/presentation/component/home_jobs/jobs_home.dart';
import 'package:zalameha/features/offers/presentation/component/home_offers/offers_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.onOffersTap});

  final VoidCallback onOffersTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width * 0.04),
        child: Column(
          children: [
            const AppHeader(title: StringsManager.home).screenEntry(),
            const SearchWidget().screenEntry(delay: AppAnimations.stagger),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const BannerSection().listEntry(0),

                    SizedBox(height: context.height * 0.02),
                    const CategorySection().listEntry(1),
                    SizedBox(height: context.height * 0.02),
                    const PartnerSection().listEntry(2),
                    SizedBox(height: context.height * 0.02),
                    OffersHome(onViewAllTap: onOffersTap).listEntry(3),
                    SizedBox(height: context.height * 0.02),
                    const AdSection().listEntry(4),
                    SizedBox(height: context.height * 0.02),
                    const JobsHome().listEntry(5),
                    SizedBox(height: context.height * 0.02),
                    const AddBusinessCard().listEntry(6),
                    SizedBox(height: context.height * 0.02),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
