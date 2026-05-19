part of '../offers_screen.dart';

class _OffersList extends StatelessWidget {
  const _OffersList();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: homeOffers.length,
      separatorBuilder:
          (context, index) => SizedBox(height: context.height * 0.025),
      itemBuilder:
          (context, index) =>
              OffersScreenCard(offer: homeOffers[index]).listEntry(index),
    );
  }
}
