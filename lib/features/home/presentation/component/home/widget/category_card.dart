part of 'category_section.dart';

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({required this.category});

  final CategoryItem category;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.13,
      child: Column(
        children: [
          SizedBox(
            width: context.width * 0.17,
            height: context.width * 0.17,
            child: AppCachedImage(
              imagePath: category.image,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: context.height * 0.006),
          Expanded(
            child: Text(
              category.title,
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: context.textBodyLarge(
                fontSize: context.width * 0.033,
                color: ColorsManager.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
