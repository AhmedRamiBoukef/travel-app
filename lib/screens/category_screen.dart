import 'package:flutter/material.dart';
import 'package:travel_app/app_data.dart';
import 'package:travel_app/models/category.dart';
import 'package:travel_app/widgets/category_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 7 / 8,
        ),
        children: Categories_data.map(
          (categorydata) => CategoryItem(
            categorydata.id,
            categorydata.imageUrl,
            categorydata.title,
          ),
        ).toList(),
      ),
    );
  }
}
