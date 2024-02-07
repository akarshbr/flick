import 'package:flick/view/custom_widget/category_card.dart';
import 'package:flick/view/custom_widget/category_title.dart';
import 'package:flick/view/movie_details/movie_details_screen.dart';
import 'package:flutter/material.dart';
import '../../../dummy_data/posters.dart';
import '../../../dummy_data/category.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
                  10,
                  (index) => MovieCard(key: ValueKey(index), movieImage: posters[index])),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: CategoryTitle(
              categoryTitle: category[1],
              index: 1,
            ),
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
            child: CategoryTitle(
              categoryTitle: category[5],
              index: 5,
            ),
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
            child: CategoryTitle(categoryTitle: category[8], index: 8),
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
      ),
    );
  }
}
