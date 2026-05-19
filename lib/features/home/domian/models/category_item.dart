import 'package:zalameha/core/resource_manager/app_strings.dart';

class CategoryItem {
  const CategoryItem({required this.title, required this.image});

  final String title;
  final String image;
}

const List<CategoryItem> categories = [
  CategoryItem(
    title: StringsManager.fashionAndClothing,
    image: 'https://i.postimg.cc/jdZ4JT7h/r1-1.png',
  ),
  CategoryItem(
    title: StringsManager.cars,
    image: 'https://i.postimg.cc/Wb273zhc/r1-2.png',
  ),
  CategoryItem(
    title: StringsManager.electronics,
    image: 'https://i.postimg.cc/vTPxDQNv/r2-1.png',
  ),
  CategoryItem(
    title: StringsManager.healthAndBeauty,
    image: 'https://i.postimg.cc/tCTVwxsx/r2-2.png',
  ),
  CategoryItem(
    title: StringsManager.homeAndKitchen,
    image: 'https://i.postimg.cc/zGh3YS8w/Image(2).png',
  ),
  CategoryItem(
    title: StringsManager.sportsAndFitness,
    image: 'https://i.postimg.cc/pdYTpW9b/Image(8).png',
  ),
  CategoryItem(
    title: StringsManager.restaurantsAndFood,
    image: 'https://i.postimg.cc/gkCksXRQ/Image(3).png',
  ),
  CategoryItem(
    title: StringsManager.booksAndEducation,
    image: 'https://i.postimg.cc/zXsX7bK3/Image(9).png',
  ),
  CategoryItem(
    title: StringsManager.businessServices,
    image: 'https://i.postimg.cc/J09mpvyF/Image(4).png',
  ),
  CategoryItem(
    title: StringsManager.entertainment,
    image: 'https://i.postimg.cc/9F7cDmSL/Image(10).png',
  ),
  CategoryItem(
    title: StringsManager.giftsAndEvents,
    image: 'https://i.postimg.cc/bJ5jvWRr/Image(5).png',
  ),
  CategoryItem(
    title: StringsManager.pets,
    image: 'https://i.postimg.cc/2yBNLGH5/Image(11).png',
  ),
];
