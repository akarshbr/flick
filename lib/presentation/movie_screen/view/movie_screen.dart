import 'package:flick/presentation/movie_screen/controller/movie_controller.dart';
import 'package:flick/presentation/movie_screen/view/widgets/movie_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../config/app_config.dart';
import '../../../widgets/movie_series_card.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  void initState() {
    fetchData(context);
    super.initState();
  }

  fetchData(context) {
    Provider.of<MovieController>(context, listen: false).fetchMovies(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieController>(builder: (context, controller, _) {
      return controller.isLoading == true
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              shrinkWrap: true,
              itemCount: controller.movieModel.results?.length,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75 / 1.1,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MovieDetailsScreen(movieID: controller.movieModel.results?[index].id)));
                  },
                  child: MovieSeriesCard(
                      poster:
                          '${AppConfig.mediaUrlPoster}${controller.movieModel.results?[index].posterPath}'),
                );
              });
    });
  }
}
