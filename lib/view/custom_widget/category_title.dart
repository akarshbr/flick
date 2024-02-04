import 'package:flick/view/category_expanded/category_expanded_screen.dart';
import 'package:flutter/material.dart';

class CategoryTitle extends StatelessWidget {
  const CategoryTitle({super.key, required this.categoryTitle, required this.index});

  final String categoryTitle;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) =>  CategoryExpandedScreen(index: index)));
      },
      child: Column(
        children: [
          Text(categoryTitle, style: const TextStyle(fontSize: 30, color: Colors.white)),
        ],
      ),
    );
  }
}
