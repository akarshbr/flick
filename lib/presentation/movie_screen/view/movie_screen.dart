import 'package:flick/presentation/movie_details_screen/controller/movie_details_controller.dart';
import 'package:flick/presentation/movie_screen/controller/cast_crew_controller.dart';
import 'package:flick/presentation/movie_screen/controller/movie_controller.dart';
import 'package:flick/repository/api/movie_screen/model/cast_crew_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../movie_details_screen/view/movie_details_screen.dart';

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
    Provider.of<MovieController>(context, listen: false).fetchMovieData(context);
  }

  @override
  Widget build(BuildContext context) {
    String? director;
    var size = MediaQuery.of(context).size;
    return Consumer<MovieController>(builder: (context, movieController, _) {
      return movieController.isLoading == true
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              shrinkWrap: true,
              itemCount: movieController.movieModel.results?.length,
              gridDelegate:  SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75 / 1.1,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Provider.of<MovieDetailsController>(context, listen: false)
                        .fetchMovieDetails(movieController.movieModel.results?[index].id);
                    Provider.of<CastCrewController>(context, listen: false)
                        .fetchCastCrewDetails(movieController.movieModel.results?[index].id);
                    if (Provider.of<CastCrewController>(context, listen: false)
                            .castCrewModel
                            .crew?[index]
                            .knownForDepartment ==
                        KnownForDepartment.DIRECTING) {
                      director = Provider.of<CastCrewController>(context).castCrewModel.crew?[index].name;
                    }
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MovieDetailsScreen(
                                  title: Provider.of<MovieDetailsController>(context).movieDetailsModel.title ?? "",
                                  director:
                                      "${Provider.of<CastCrewController>(context).castCrewModel.crew?[index].name}",
                                  runTime: Provider.of<MovieDetailsController>(context).movieDetailsModel.runtime,
                                  overview:
                                      Provider.of<MovieDetailsController>(context).movieDetailsModel.overview ?? "",
                                  poster:
                                      "https://image.tmdb.org/t/p/w600_and_h900_bestv2/${Provider.of<MovieController>(context, listen: false).movieModel.results?[index].posterPath}",
                                  backdropPath:
                                      "https://image.tmdb.org/t/p/original${Provider.of<MovieDetailsController>(context).movieDetailsModel.backdropPath}",
                                  movieID: Provider.of<MovieController>(context).movieModel.results?[index].id,
                                )));
                  },
                  child: Container(
                    // margin:  EdgeInsets.only(left: size.width*0.01),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://image.tmdb.org/t/p/w600_and_h900_bestv2/${Provider.of<MovieController>(context, listen: false).movieModel.results?[index].posterPath}"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              });
    });
  }
}
