import 'package:flick/config/app_config.dart';
import 'package:flick/presentation/movie_screen/controller/movie_controller.dart';
import 'package:flick/repository/api/movie_screen/model/cast_crew_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({super.key, required this.movieID});

  //final int movieID;

  final int? movieID;

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  fetchData() {
    Provider.of<MovieController>(context, listen: false).fetchMovieDetails(context, widget.movieID);
    Provider.of<MovieController>(context, listen: false).fetchMovieCastCrew(context, widget.movieID);
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  String? director;

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat("yyyy");
    return Consumer<MovieController>(builder: (context, controller, _) {

      return controller.isLoadingMD
          ? Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.width,
                width: MediaQuery.of(context).size.width,
                child: CustomScrollView(
                  slivers: [
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
                                          "${AppConfig.mediaUrlBackDrop}${controller.movieDetailsModel.backdropPath}"),
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
                                            "${AppConfig.mediaUrlPoster}${controller.movieDetailsModel.posterPath}"),
                                        fit: BoxFit.contain)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 180, top: 250, bottom: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(controller.movieDetailsModel.title ?? "",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w900,
                                          decoration: TextDecoration.none)),
                                  SizedBox(height: 10),
                                  Text("Director:",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          decoration: TextDecoration.none)),
                                  Text("$director",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          decoration: TextDecoration.none)),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("${controller.movieDetailsModel.runtime}Min",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                              decoration: TextDecoration.none)),
                                      SizedBox(width: 10),
                                      Text("${controller.movieDetailsModel.releaseDate?.year}",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                              decoration: TextDecoration.none))
                                    ],
                                  )
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
                          controller.movieDetailsModel.overview ?? "",
                          style:
                              TextStyle(fontSize: 20, color: Colors.black, decoration: TextDecoration.none),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                        child: Row(
                      children: [
                        TextButton(onPressed: () {}, child: Text("Cast", style: TextStyle(fontSize: 20))),
                        TextButton(onPressed: () {}, child: Text("Crew", style: TextStyle(fontSize: 20))),
                      ],
                    )),
                    Consumer<MovieController>(builder: (context, controller, _) {
                      return SliverToBoxAdapter(
                        child: SizedBox(
                          height: 140,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            itemCount: controller.castCrewModel.cast?.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              var castImage =
                                  "${AppConfig.castCrewDP}${controller.castCrewModel.cast?[index].profilePath}";
                              var castCharacter = controller.castCrewModel.cast?[index].character;
                              return Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.black,
                                      radius: 50,
                                      backgroundImage: controller.isLoadingCC
                                          ? NetworkImage(
                                              "https://i.pinimg.com/originals/2e/60/07/2e60079f1e36b5c7681f0996a79e8af4.jpg")
                                          : controller.castCrewModel.cast?[index].profilePath == null
                                              ? NetworkImage(
                                                  "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/2048px-No_image_available.svg.png")
                                              : NetworkImage(castImage),
                                    ),
                                    Text(
                                      controller.castCrewModel.cast?[index].name ?? "", //TODO
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black, decoration: TextDecoration.none),
                                    ),
                                    Text(
                                      castCharacter!.length > 15
                                          ? "${castCharacter.substring(0, 15)}.."
                                          : castCharacter, //TODO
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black, decoration: TextDecoration.none),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    }),
                    SliverToBoxAdapter(
                      child: SizedBox(height: 10),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text("Lets Talk About", style: TextStyle(fontSize: 30, color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              minimumSize: Size.fromHeight(60),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(height: 10),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text("Rating", style: TextStyle(fontSize: 30, color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              minimumSize: Size.fromHeight(60),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(height: 10),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text("Watch Later", style: TextStyle(fontSize: 30, color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              minimumSize: Size.fromHeight(60),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(height: 10),
                    ),
                  ],
                ),
              ),
            );
      
    });
  }
  
}
