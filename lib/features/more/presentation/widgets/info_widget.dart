part of '../more_screen.dart';
class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
         Text(
              StringsManager.zalamehaApp,
              style: context.textTitleLarge(fontSize: context.width * 0.032),
            ),
            SizedBox(height: context.height * 0.008),
            Text(
              StringsManager.version,
              style: context.textBodyLarge(
                fontSize: context.width * 0.028,
                color: ColorsManager.grayText,
              ),
            ),
      ],
    );
  }
}