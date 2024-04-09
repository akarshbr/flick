import 'package:flutter/material.dart';

class MovieSeriesCard extends StatelessWidget {
  const MovieSeriesCard({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin:  EdgeInsets.only(left: size.width*0.01),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(5),
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}