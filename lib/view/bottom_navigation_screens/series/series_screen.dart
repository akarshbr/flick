import 'dart:math';

import 'package:flutter/material.dart';

import '../../../dummy_data/posters.dart';
import '../../../dummy_data/category.dart';
import '../../custom_widget/category_card.dart';
import '../../custom_widget/category_title.dart';

class SeriesScreen extends StatelessWidget {
  const SeriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    List<int> randomImageIndex =
        List.generate(category.length, (index) => random.nextInt(posters.length));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: CategoryTitle(categoryTitle: category[0], index: 0),
        ),
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: List.generate(
                10, (index) => MovieCard(key: ValueKey(index), movieImage: posters[index])),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: CategoryTitle(categoryTitle: category[2], index: 2),
        ),
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: List.generate(
                10, (index) => MovieCard(key: ValueKey(index), movieImage: posters[index])),
          ),
        )
      ],
    );
  }
}
