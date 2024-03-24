import 'package:flick/presentation/movie_screen/controller/movie_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'category_expanded_screen.dart';
import '../presentation/movie_details_screen/view/movie_details_screen.dart';

class TitleAndCard extends StatelessWidget {
  const TitleAndCard(
      {super.key, required this.index, required this.categoryTitle,  this.fetchData});

  final String categoryTitle;
  final int index;
  final Function()? fetchData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CategoryExpandedScreen(index: index)));
              },
              child: Column(
                children: [
                  Text(categoryTitle, style: const TextStyle(fontSize: 30, color: Colors.white)),
                ],
              ),
            ),
          ),
          LimitedBox(
            maxHeight: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: List.generate(10, (index1) {
                return InkWell(
                  onTap: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => const MovieDetailsScreen()));
                  },
                  child: Container(
                    height: 200,
                    width: 130, // Adjust width as needed
                    margin: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://image.tmdb.org/t/p/w600_and_h900_bestv2/${Provider.of<MovieController>(context,listen: false).movieModel.results?[index1].posterPath}"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
