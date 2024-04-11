import 'package:flutter/material.dart';

class MovieSeriesCard extends StatelessWidget {
  const MovieSeriesCard({super.key, required this.poster});

  final String poster;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(5),
        image: DecorationImage(
          image: NetworkImage(poster),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
