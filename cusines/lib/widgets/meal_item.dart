
import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../../screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String title;
  final Affordability affordability;
  final Complexity complexity;
  final int duration;

  const MealItem({
    Key? key,
    required this.imageUrl,
    required this.id,
    required this.title,
    required this.affordability,
    required this.complexity,
    required this.duration,
  }) : super(key: key);

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;

      case Affordability.Luxurious:
        return 'Expensive';
        break;

      case Affordability.Pricey:
        return "Pricey";
        break;

      default:
        return "Unknown";
        break;
    }
  }

  String get complexityText {
    switch (complexity) {
      case Complexity.Challenging:
        return "Challenging";
        break;

      case Complexity.Hard:
        return "Hard";
        break;

      case Complexity.Simple:
        return "Simple";
        break;

      default:
        return "Unknown";
        break;
    }
  }

  void _selectMeal(BuildContext context){
     Navigator.of(context).pushNamed(MealDetailScreen.routeName,arguments: id);
  }

  Widget _buildIcon(IconData icon, String iconText) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(
          width: 6,
        ),
        Text(
          iconText,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>  _selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(15),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 250,
                  ),
                ),
                Positioned(
                  bottom: 10.0,
                  right: 10.0,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.black45,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildIcon(Icons.schedule, '$duration min'),
                  _buildIcon(Icons.work, complexityText),
                  _buildIcon(Icons.money, affordabilityText),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
