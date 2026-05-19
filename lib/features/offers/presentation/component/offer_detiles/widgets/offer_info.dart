part of '../offer_detiles.dart';

class OfferInfo extends StatelessWidget {
  const OfferInfo({super.key, required this.offerData});
  final OfferModel offerData;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: context.width * 0.18,
          height: context.width * 0.18,
          child: AppCachedImage(
            imagePath: offerData.logo,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: context.width * 0.015),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                offerData.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.textTitleLarge(fontSize: context.width * 0.04),
              ),
              SizedBox(height: context.height * 0.006),
              Text(
                offerData.description,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.end,
                style: context.textBodyLarge(
                  fontSize: context.width * 0.026,
                  color: ColorsManager.bottomNavText,
                ),
              ),
              SizedBox(height: context.height * 0.006),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    offerData.location,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.textBodyLarge(
                      fontSize: context.width * 0.03,
                      color: ColorsManager.bottomNavText,
                    ),
                  ),
                  SizedBox(width: context.width * 0.01),
                  SvgPicture.asset(
                    AppImages.star,
                    width: context.width * 0.035,
                    height: context.width * 0.035,
                  ),
                  SizedBox(width: context.width * 0.01),

                  Text(
                    offerData.stars.toStringAsFixed(1),
                    style: context.textTitleLarge(
                      fontSize: context.width * 0.03,
                      color: ColorsManager.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
