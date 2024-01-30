import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.movieImage});

  final String movieImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 120, // Adjust width as needed
      margin: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        image: DecorationImage(
          image: AssetImage(movieImage),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
