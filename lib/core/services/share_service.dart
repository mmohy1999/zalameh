import 'package:share_plus/share_plus.dart';
import 'package:zalameha/core/resource_manager/app_strings.dart';
import 'package:zalameha/features/offers/data/models/offer_modle.dart';

class ShareService {
  ShareService._();

  static Future<void> shareOffer(OfferModel offer) {
    final shareText = [
      offer.name,
      offer.location,
      offer.description,
      StringsManager.appTitle,
    ].where((text) => text.trim().isNotEmpty).join('\n');

    return SharePlus.instance.share(
      ShareParams(text: shareText, subject: offer.name),
    );
  }
}
