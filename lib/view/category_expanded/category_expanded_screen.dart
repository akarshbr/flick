import 'package:flick/dummy_data/category.dart';
import 'package:flick/dummy_data/posters.dart';
import 'package:flick/utils/constants.dart';
import 'package:flick/view/custom_widget/appbar_without_action.dart';
import 'package:flick/view/custom_widget/category_card.dart';
import 'package:flutter/material.dart';

import '../custom_widget/category_title.dart';

class CategoryExpandedScreen extends StatelessWidget {
  const CategoryExpandedScreen({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: currentScreenBGColor,
      appBar:
          const PreferredSize(preferredSize: appBarPreferredSize, child: AppBarWOActionWidget()),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: CategoryTitle(categoryTitle: category[index], index: index),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: posters.length,
                gridDelegate:  const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200,mainAxisSpacing: 10,childAspectRatio: 1/1.6),
                itemBuilder: (context, index) {
                  return CategoryCard(movieImage: posters[index]);
                }),
          )
        ],
      ),
    );
  }
}
