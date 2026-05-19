import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zalameha/core/resource_manager/app_images.dart';
import 'package:zalameha/core/resource_manager/app_strings.dart';
import 'package:zalameha/core/theming/colors.dart';
import 'package:zalameha/core/utils/extensions.dart';
import 'package:zalameha/core/widgets/app_animations.dart';
import 'package:zalameha/core/widgets/toast_helper.dart';
import 'package:zalameha/features/categories/presentation/categories_screen.dart';
import 'package:zalameha/features/home/presentation/component/home/home_screen.dart';
import 'package:zalameha/features/jobs/presentation/jobs_screen.dart';
import 'package:zalameha/features/main/domian/entity/home_nav_item.dart';
import 'package:zalameha/features/more/presentation/more_screen.dart';
import 'package:zalameha/features/offers/presentation/component/offers/offers_screen.dart';

part 'widgets/main_bottom_nav_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  DateTime? _lastHomePopAt;

  final List<HomeNavItem> _items = const [
    HomeNavItem(
      label: StringsManager.home,
      icon: AppImages.homeIcon,
      activeIcon: AppImages.homeActiveIcon,
    ),
    HomeNavItem(
      label: StringsManager.offers,
      icon: AppImages.offersIcon,
      activeIcon: AppImages.offersActiveIcon,
    ),
    HomeNavItem(
      label: StringsManager.jobs,
      icon: AppImages.workIcon,
      activeIcon: AppImages.workActiveIcon,
    ),
    HomeNavItem(
      label: StringsManager.categories,
      icon: AppImages.categoryIcon,
      activeIcon: AppImages.categoryActiveIcon,
    ),
    HomeNavItem(
      label: StringsManager.more,
      icon: AppImages.moreIcon,
      activeIcon: AppImages.moreActiveIcon,
    ),
  ];

  void _openOffers() => setState(() => _currentIndex = 1);

  void _handlePop() {
    if (_currentIndex != 0) {
      setState(() => _currentIndex = 0);
      return;
    }

    final now = DateTime.now();
    final shouldExit =
        _lastHomePopAt != null &&
        now.difference(_lastHomePopAt!) < const Duration(seconds: 2);

    if (shouldExit) {
      SystemNavigator.pop();
      return;
    }

    _lastHomePopAt = now;
    ToastHelper.showToast(message: StringsManager.pressAgainToExit);
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      HomeScreen(onOffersTap: _openOffers),
      const OffersScreen(),
      const JobsScreen(),
      const CategoriesScreen(),
      const MoreScreen(),
    ];

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          _handlePop();
        }
      },
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: AnimatedSwitcher(
            duration: AppAnimations.normal,
            switchInCurve: AppAnimations.curve,
            switchOutCurve: Curves.easeInCubic,
            transitionBuilder: (child, animation) {
              return FadeTransition(
                opacity: animation,
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0.04, 0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                ),
              );
            },
            child: IndexedStack(
              key: ValueKey(_currentIndex),
              index: _currentIndex,
              children: screens,
            ),
          ),
          bottomNavigationBar: _HomeBottomNavBar(
            currentIndex: _currentIndex,
            items: _items,
            onTap: (index) => setState(() => _currentIndex = index),
          ),
        ),
      ),
    );
  }
}
