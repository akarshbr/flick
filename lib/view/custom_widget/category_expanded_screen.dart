import 'package:flick/controller/movie_controller.dart';
import 'package:flick/dummy_data/category.dart';
import 'package:flick/utils/constants.dart';
import 'package:flick/view/custom_widget/appbar_without_action.dart';
import 'package:flick/view/custom_widget/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../custom_widget/category_title.dart';

class CategoryExpandedScreen extends StatelessWidget {
  const CategoryExpandedScreen({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: currentScreenBGColor,
      appBar:
          const PreferredSize(preferredSize: appBarPreferredSize, child: AppBarWOActionWidget()),
      body: Consumer<MovieController>(builder: (context, movieController, _) {
        return movieController.isLoading == true
            ? const Center(child: CircularProgressIndicator())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: CategoryTitle(categoryTitle: category[index], index: index),
                  ),
                  Expanded(
                    child: GridView.builder(
                        itemCount: movieController.movieModel.results?.length,
                        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            mainAxisSpacing: 10,
                            childAspectRatio: 1 / 1.45),
                        itemBuilder: (context, index) {
                          return MovieCard(
                              movieImage:
                                  "https://image.tmdb.org/t/p/w600_and_h900_bestv2/${Provider.of<MovieController>(context).movieModel.results?[index].posterPath}");
                        }),
                  )
                ],
              );
      }),
    );
  }
}
