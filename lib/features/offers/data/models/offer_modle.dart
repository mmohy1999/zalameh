import 'package:zalameha/core/resource_manager/app_strings.dart';

class OfferModel {
  const OfferModel({
    required this.coverImage,
    required this.logo,
    required this.name,
    required this.stars,
    required this.location,
    required this.description,
  });

  final String coverImage;
  final String logo;
  final String name;
  final int stars;
  final String location;
  final String description;
}

const List<OfferModel> homeOffers = [
  OfferModel(
    coverImage: 'https://i.postimg.cc/cHm9jKF4/g1.png',
    logo: 'https://i.postimg.cc/HLWBMWpf/p1.png',
    name: StringsManager.kapoliRoasters,
    stars: 5,
    location: 'cairo',
    description: 'lorem ipsum dolor sit amet, consectetur adipiscing elit',
  ),
  OfferModel(
    coverImage: 'https://i.postimg.cc/Cxscdngp/g2.png',
    logo: 'https://i.postimg.cc/bvY3nYyq/p2.png',
    name: StringsManager.wingers,
    stars: 5,
    location: 'جبل اللويبدة',
    description: 'The best wings and burgers in town',
  ),
];
