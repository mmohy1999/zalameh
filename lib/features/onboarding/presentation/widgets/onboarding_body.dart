import 'package:flutter/material.dart';
import 'package:zalameha/features/onboarding/data/models/onboarding_page_data.dart';
import '../../../../core/resource_manager/routes_manager.dart';
import 'onboarding_card.dart';

class OnboardingBody extends StatefulWidget {
  const OnboardingBody({super.key});

  @override
  State<OnboardingBody> createState() => _OnboardingBodyState();
}

class _OnboardingBodyState extends State<OnboardingBody> {
  final _pageController = PageController();
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _nextPage() async {
    if (_currentIndex == pages.length - 1) {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, Routes.home);
      return;
    }
    _pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      physics: const BouncingScrollPhysics(),
      onPageChanged: (index) => setState(() => _currentIndex = index),
      itemCount: pages.length,
      itemBuilder: (context, index) {
        final data = pages[index];
        final isActive = _currentIndex == index;
        return OnboardingCard(
          data: data,
          isActive: isActive,
          isLast: index == pages.length - 1,
          currentIndex: _currentIndex,
          total: pages.length,
          onNext: _nextPage,
        );
      },
    );
  }
}
