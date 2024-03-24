import 'dart:math';

import 'package:flick/presentation/series_screen/controller/series_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/dummy_data/category.dart';
import '../../../core/dummy_data/posters.dart';

class SeriesScreen extends StatefulWidget {
  const SeriesScreen({super.key});

  @override
  State<SeriesScreen> createState() => _SeriesScreenState();
}

class _SeriesScreenState extends State<SeriesScreen> {
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  fetchData() {
    Provider.of<SeriesController>(context, listen: false).fetchSeriesData(context);
  }

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    List<int> randomImageIndex = List.generate(category.length, (index) => random.nextInt(posters.length));
    return Consumer<SeriesController>(builder: (context, seriesController, _) {
      return seriesController.isLoading == true
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              shrinkWrap: true,
              itemCount: seriesController.seriesModel.results?.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75 / 1.1,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://image.tmdb.org/t/p/w600_and_h900_bestv2/${Provider.of<SeriesController>(context, listen: false).seriesModel.results?[index].posterPath}"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              });
    });
  }
}
