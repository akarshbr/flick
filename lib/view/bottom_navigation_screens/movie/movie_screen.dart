import 'dart:math';

import 'package:flick/view/custom_widget/category_card.dart';
import 'package:flick/view/custom_widget/category_title.dart';
import 'package:flutter/material.dart';

import '../../../dummy_data/posters.dart';
import '../../../dummy_data/category.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    int randomImageIndex =random.nextInt(posters.length);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: CategoryTitle(categoryTitle: category[0]),
          ),
          LimitedBox(
            maxHeight: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: List.generate(
                  10, (index) => CategoryCard(key: ValueKey(index), movieImage: posters[index])),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: CategoryTitle(categoryTitle: category[1]),
          ),
          LimitedBox(
            maxHeight: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: List.generate(
                  10, (index) => CategoryCard(key: ValueKey(index), movieImage: posters[index])),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: CategoryTitle(categoryTitle: category[5]),
          ),
          LimitedBox(
            maxHeight: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: List.generate(
                  10, (index) => CategoryCard(key: ValueKey(index), movieImage: posters[index])),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: CategoryTitle(categoryTitle: category[8]),
          ),
          LimitedBox(
            maxHeight: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: List.generate(
                  10, (index) => CategoryCard(key: ValueKey(index), movieImage: posters[index])),
            ),
          )
        ],
      ),
    );
  }
}