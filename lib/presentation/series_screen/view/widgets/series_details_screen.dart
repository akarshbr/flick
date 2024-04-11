import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/movie_details_eb.dart';

class SeriesDetailsScreen extends StatefulWidget {
  const SeriesDetailsScreen({super.key});

  @override
  State<SeriesDetailsScreen> createState() => _SeriesDetailsScreenState();
}

class _SeriesDetailsScreenState extends State<SeriesDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
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
                            image: AssetImage("assets/details/Pulp-Fiction-ballo-2.jpg"), //TODO
                            fit: BoxFit.cover)),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back, color: Colors.white)),
                  Padding(
                    padding: const EdgeInsets.only(left: 370, top: 185),
                    child: IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.heart, color: Colors.red)),
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
                              image: AssetImage("assets/details/pulpFiction.jpg"),
                              fit: BoxFit.contain)), //TODO
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 180, top: 250, bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Pulp Fiction",
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("154 Min",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black, decoration: TextDecoration.none)),
                            SizedBox(width: 10),
                            Text("1994",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black, decoration: TextDecoration.none))
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
                "Sick, twisted, politically incorrect and Freakin' Sweet animated series featuring the adventures of the dysfunctional Griffin family. Bumbling Peter and long-suffering Lois have three kids. Stewie (a brilliant but sadistic baby bent on killing his mother and taking over the world), Meg (the oldest, and is the most unpopular girl in town) and Chris (the middle kid, he's not very bright but has a passion for movies). The final member of the family is Brian - a talking dog and much more than a pet, he keeps Stewie in check whilst sipping Martinis and sorting through his own life issues.",
                style: TextStyle(fontSize: 20, color: Colors.black, decoration: TextDecoration.none),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Row(
              children: [
                TextButton(
                    onPressed: () {
                      setState(() {});
                    },
                    child: Text("Cast", style: TextStyle(fontSize: 20))),
                TextButton(
                    onPressed: () {
                      setState(() {});
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
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  /* var castImage = controller.isCast
                      ? "${AppConfig.castCrewDP}${controller.castCrewModel.cast?[index].profilePath}"
                      : "${AppConfig.castCrewDP}${controller.castCrewModel.crew?[index].profilePath}";
                  var castCharacter = controller.isCast
                      ? (controller.castCrewModel.cast?[index].character ?? "")
                      : (controller.castCrewModel.crew?[index].job ?? "");*/
                  return /*controller.isLoadingCC
                      ? Center(child: CircularProgressIndicator())
                      :*/
                      Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 50,
                          backgroundImage: /*"controller.isLoadingCC
                              ? NetworkImage(AppConfig.loadingImage)
                              : controller.castCrewModel.cast?[index].profilePath == null ||
                                      controller.castCrewModel.crew?[index].profilePath == null
                                  ? NetworkImage(AppConfig.noImage)
                                  :*/ NetworkImage("https://static.wikia.nocookie.net/familyguy/images/c/c2/FamilyGuy_Single_BrianWriter_R7.jpg/revision/latest?cb=20200526171840"),
                        ),
                        Text(
                          /*controller.isCast
                              ? (controller.castCrewModel.cast?[index].name ?? "")
                              : (controller.castCrewModel.crew?[index].name ?? "")*/"Brian",
                          style:
                              TextStyle(fontSize: 13, color: Colors.black, decoration: TextDecoration.none),
                        ),
                        Text(
                          /*castCharacter.length > 15 ? "${castCharacter.substring(0, 15)}.." : castCharacter*/"Seth",
                          style:
                              TextStyle(fontSize: 13, color: Colors.black, decoration: TextDecoration.none),
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
  }
}
