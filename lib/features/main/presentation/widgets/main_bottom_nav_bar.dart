part of '../main_screen.dart';

class _HomeBottomNavBar extends StatelessWidget {
  const _HomeBottomNavBar({
    required this.currentIndex,
    required this.items,
    required this.onTap,
  });

  final int currentIndex;
  final List<HomeNavItem> items;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ColorsManager.whiteColor,
        border: Border(top: BorderSide(color: ColorsManager.grayPageDots)),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: context.height * 0.08,
          child: Row(
            children: List.generate(items.length, (index) {
              final item = items[index];
              final isActive = currentIndex == index;

              return Expanded(
                child: InkWell(
                  onTap: () => onTap(index),
                  child: Column(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: context.width * 0.15,
                        height: 2,
                        color:
                            isActive
                                ? ColorsManager.primaryColor
                                : Colors.transparent,
                      ),
                      const Spacer(),
                      SizedBox(
                        width: context.width * 0.055,
                        height: context.width * 0.055,
                        child: SvgPicture.asset(
                          isActive ? item.activeIcon : item.icon,
                        ),
                      ).softScale(active: isActive),
                      SizedBox(height: context.height * 0.006),
                      Text(
                        item.label,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: context.textBodyLarge(
                          fontSize: (context.width * 0.028).clamp(10.0, 12.0),
                          color:
                              isActive
                                  ? ColorsManager.primaryColor
                                  : ColorsManager.grayText,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
