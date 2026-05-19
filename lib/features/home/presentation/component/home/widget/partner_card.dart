part of 'partner_section.dart';

class _PartnerCard extends StatelessWidget {
  const _PartnerCard({required this.partner});

  final PartnerItem partner;

  @override
  Widget build(BuildContext context) {
    final itemWidth = context.width * 0.2;

    return SizedBox(
      width: itemWidth,
      child: Column(
        children: [
          SizedBox(
            width: itemWidth,
            height: itemWidth,

            child: AppCachedImage(
              imagePath: partner.image,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: context.height * 0.012),
          Expanded(
            child: Text(
              partner.title,
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: context.textBodyLarge(
                fontSize: context.width * 0.031,
                color: ColorsManager.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
