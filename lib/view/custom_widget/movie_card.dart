import 'package:flick/view/movie_details/movie_details_screen.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.movieImage});

  final String movieImage;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailsScreen()));
      },
      child: Container(
        height: 200,
        width: 130, // Adjust width as needed
        margin: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          image: DecorationImage(
            image: NetworkImage(movieImage),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
