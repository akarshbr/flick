import 'package:flutter/material.dart';

import 'category_expanded_screen.dart';

class CategoryTitle extends StatelessWidget {
  const CategoryTitle({super.key, required this.categoryTitle, required this.index});

  final String categoryTitle;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryExpandedScreen(index: index)));
      },
      child: Column(
        children: [
          Text(categoryTitle, style: const TextStyle(fontSize: 30, color: Colors.white)),
        ],
      ),
    );
  }
}
