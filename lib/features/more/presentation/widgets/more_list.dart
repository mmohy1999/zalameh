part of '../more_screen.dart';

class MoreList extends StatelessWidget {
  const MoreList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        items.length,
        (index) => MoreListItem(
          item: items[index],
          isLast: index == items.length - 1,
        ).listEntry(index),
      ),
    );
  }
}
