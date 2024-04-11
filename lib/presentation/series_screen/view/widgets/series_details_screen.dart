import 'package:flick/config/app_config.dart';
import 'package:flick/presentation/series_screen/controller/series_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../widgets/movie_details_eb.dart';

class SeriesDetailsScreen extends StatefulWidget {
  const SeriesDetailsScreen({super.key, required this.seriesId});

  final int? seriesId;

  @override
  State<SeriesDetailsScreen> createState() => _SeriesDetailsScreenState();
}

class _SeriesDetailsScreenState extends State<SeriesDetailsScreen> {
  fetchData() {
    Provider.of<SeriesController>(context, listen: false).fetchSeriesDetails(context, widget.seriesId);
    Provider.of<SeriesController>(context, listen: false).fetchSeriesCastCrew(context, widget.seriesId);
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<SeriesController>(builder: (context, controller, _) {
      return controller.isLoadingSD
          ? Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Container(
                height: size.height,
                width: size.width,
                color: Colors.white,
                child: CustomScrollView(slivers: [
                  SliverToBoxAdapter(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width * .9,
                      child: Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.width * .55,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "${AppConfig.mediaUrlBackDrop}${controller.seriesDetailsModel.backdropPath}"), //TODO
                                    fit: BoxFit.cover)),
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.arrow_back, color: Colors.white)),
                          Padding(
                            padding: const EdgeInsets.only(left: 370, top: 185),
                            child: IconButton(
                                onPressed: () {}, icon: Icon(CupertinoIcons.heart, color: Colors.red)),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 200, 0, 0),
                            child: Container(
                              height: 160,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 4,
                                  ),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "${AppConfig.mediaUrlPoster}${controller.seriesDetailsModel.posterPath}"),
                                      fit: BoxFit.contain)), //TODO
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 180, top: 250, bottom: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${controller.seriesDetailsModel.name}",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w900,
                                        decoration: TextDecoration.none)),
                                SizedBox(height: 10),
                                Text("Director:",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black, decoration: TextDecoration.none)),
                                Text("director",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black, decoration: TextDecoration.none)),
                                SizedBox(height: 10),
                                Text("${controller.seriesDetailsModel.firstAirDate?.year}",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black, decoration: TextDecoration.none))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        "${controller.seriesDetailsModel.overview}",
                        style: TextStyle(fontSize: 20, color: Colors.black, decoration: TextDecoration.none),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Row(
                      children: [
                        TextButton(
                            onPressed: () {
                              setState(() {
                                Provider.of<SeriesController>(context, listen: false).isCast = true;
                              });
                            },
                            child: Text("Cast", style: TextStyle(fontSize: 20))),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                Provider.of<SeriesController>(context, listen: false).isCast = false;
                              });
                            },
                            child: Text("Crew", style: TextStyle(fontSize: 20))),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 140,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        itemCount: controller.isCast
                            ? (controller.castCrewModel.cast?.length)
                            : (controller.castCrewModel.crew?.length), //TODO
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          var castImage = controller.isCast
                              ? "${AppConfig.castCrewDP}${controller.castCrewModel.cast?[index].profilePath}"
                              : "${AppConfig.castCrewDP}${controller.castCrewModel.crew?[index].profilePath}";
                          var castCharacter = controller.isCast
                              ? (controller.castCrewModel.cast?[index].character ?? "")
                              : (controller.castCrewModel.crew?[index].job ?? "");
                          return controller.isLoadingCC
                              ? Center(child: CircularProgressIndicator())
                              : Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.black,
                                        radius: 50,
                                        backgroundImage: controller.isLoadingCC
                                            ? NetworkImage(AppConfig.loadingImage)
                                            : controller.castCrewModel.cast?[index].profilePath == null ||
                                                    controller.castCrewModel.crew?[index].profilePath == null
                                                ? NetworkImage(AppConfig.noImage)
                                                : NetworkImage(castImage),
                                      ),
                                      Text(
                                        controller.isCast
                                            ? (controller.castCrewModel.cast?[index].name ?? "")
                                            : (controller.castCrewModel.crew?[index].name ?? ""),
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.black,
                                            decoration: TextDecoration.none),
                                      ),
                                      Text(
                                        castCharacter.length > 15
                                            ? "${castCharacter.substring(0, 15)}.."
                                            : castCharacter,
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.black,
                                            decoration: TextDecoration.none),
                                      )
                                    ],
                                  ),
                                );
                        },
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(height: 10),
                  ),
                  SliverToBoxAdapter(
                    child: MovieDetailsEB(text: "Watch Later"),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(height: 10),
                  ),
                  SliverToBoxAdapter(
                    child: MovieDetailsEB(text: "Already Watched"),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(height: 10),
                  ),
                  SliverToBoxAdapter(
                    child: MovieDetailsEB(text: "Favorites"),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(height: 10),
                  ),
                ]),
              ),
            );
    });
  }
}
