import 'package:cusines/screens/category_screen.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;

  const CategoryItem(
      {Key? key, required this.title, required this.color, required this.id})
      : super(key: key);

  void showCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoryScreen.routeName,
      arguments: {"title": title, "color": color, "id": id},
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showCategory(context),
      child: Container(
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline4,
          
        ),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            colors: [color.withOpacity(0.2), color.withOpacity(0.7)],
          ),
        ),
      ),
    );
  }
}
