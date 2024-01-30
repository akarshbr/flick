import 'package:flutter/material.dart';

class CategoryTitle extends StatelessWidget {
  const CategoryTitle({super.key, required this.categoryTitle});

  final String categoryTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(categoryTitle, style: const TextStyle(fontSize: 30,color: Colors.white)),

      ],
    );
  }
}
