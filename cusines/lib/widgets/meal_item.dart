import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {

  final String imageUrl;
  
  const MealItem({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
        height: 250,
      ),
    );
  }
}
