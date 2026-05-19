import 'package:zalameha/core/resource_manager/app_strings.dart';

class PartnerItem {
  const PartnerItem({required this.title, required this.image});

  final String title;
  final String image;
}

const List<PartnerItem> partners = [
  PartnerItem(
    title: StringsManager.wingers,
    image: 'https://i.postimg.cc/cHDXspwc/p1.png',
  ),
  PartnerItem(
    title: StringsManager.beMiraya,
    image: 'https://i.postimg.cc/QCHSVfJy/p2.png',
  ),
  PartnerItem(
    title: StringsManager.zeroFit,
    image: 'https://i.postimg.cc/MHvtX9Yx/p3.png',
  ),
  PartnerItem(
    title: StringsManager.alMuznSchools,
    image: 'https://i.postimg.cc/HnRzMbSs/p4.png',
  ),
  PartnerItem(
    title: StringsManager.kapoliRoasters,
    image: 'https://i.postimg.cc/Fz8pS0PP/p5.png',
  ),
  PartnerItem(
    title: StringsManager.drAzmiSalameh,
    image: 'https://i.postimg.cc/T24CBXRg/p6.png',
  ),
  PartnerItem(
    title: StringsManager.qomrahSchools,
    image: 'https://i.postimg.cc/qvfQMXhb/p7.png',
  ),
];
