part of '../offer_detiles.dart';

class OfferDetilesFooter extends StatelessWidget {
  const OfferDetilesFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.width * 0.04,
        vertical: context.height * 0.018,
      ),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: ColorsManager.grayPageDots)),
      ),
      child: Row(
        children: [
          Expanded(
            child: _ContactButton(
              label: StringsManager.callNow,
              icon: AppImages.phone,
              backgroundColor: ColorsManager.primaryColor,
              onPressed: Socilservies.call,
            ),
          ),
          SizedBox(width: context.width * 0.04),
          Expanded(
            child: _ContactButton(
              label: StringsManager.whatsapp,
              icon: AppImages.whatsapp,
              backgroundColor: ColorsManager.green,
              onPressed: Socilservies.openWhatsApp,
            ),
          ),
        ],
      ),
    ).screenEntry(delay: AppAnimations.stagger * 3);
  }
}

class _ContactButton extends StatelessWidget {
  const _ContactButton({
    required this.label,
    required this.icon,
    required this.backgroundColor,
    required this.onPressed,
  });

  final String label;
  final String icon;
  final Color backgroundColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.058,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: context.textBodyLarge(
                fontSize: context.width * 0.035,
                color: ColorsManager.whiteColor,
              ),
            ),
            SizedBox(width: context.width * 0.02),
            SvgPicture.asset(
              icon,
              width: context.width * 0.04,
              height: context.width * 0.04,
              colorFilter: const ColorFilter.mode(
                ColorsManager.whiteColor,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
