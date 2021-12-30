import 'package:cusines/widgets/category_item.dart';
import 'package:flutter/material.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const categories = DUMMY_CATEGORIES;

    return  GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
        ),
        itemBuilder: (_, index) {
          return CategoryItem(
            title: categories[index].title,
            color: categories[index].color,
            id: categories[index].id,
          );
        },
        itemCount: categories.length,
      
    );
  }
}
