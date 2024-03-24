import 'dart:math';

import 'package:flick/controller/series_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../dummy_data/category.dart';
import '../../../dummy_data/posters.dart';

class SeriesScreen extends StatelessWidget {
  const SeriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    List<int> randomImageIndex =
        List.generate(category.length, (index) => random.nextInt(posters.length));
    return Consumer<SeriesController>(builder: (context, seriesController, _) {
      Provider.of<SeriesController>(context,listen: false).fetchData();
      return seriesController.isLoading == false
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
          shrinkWrap: true,
          itemCount: seriesController.seriesModel.results?.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200, mainAxisSpacing: 10, childAspectRatio: 1 / 1.45),
              itemBuilder: (context, index) {
                return InkWell(
                  child: Container(
                    height: 200,
                    width: 130, // Adjust width as needed TODO
                    margin: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://image.tmdb.org/t/p/w600_and_h900_bestv2/${Provider.of<SeriesController>(context,listen: false).seriesModel.results?[index].posterPath}"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              });
    });
  }
}
