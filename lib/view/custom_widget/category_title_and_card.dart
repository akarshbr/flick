import 'package:flutter/material.dart';

import '../../dummy_data/posters.dart';
import '../../dummy_data/category.dart';
import 'category_card.dart';
import 'category_title.dart';
class TitleAndCard extends StatelessWidget {
  const TitleAndCard({
    super.key, required this.title, required this.card,
  });
  final String title;
  final String card;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: CategoryTitle(categoryTitle: title),
        ),
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: List.generate(
                10, (index) => CategoryCard(key: ValueKey(index), movieImage: card)),
          ),
        )
      ],
    );
  }
}
