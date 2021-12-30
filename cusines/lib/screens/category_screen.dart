import 'package:cusines/widgets/meal_item.dart';
import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../models/meal.dart';

class CategoryScreen extends StatelessWidget {
  static const String routeName = "/category";
  
  final Map<String,bool> currentFilters;

  const CategoryScreen(this.currentFilters);


  List<Meal> get meals {


       return DUMMY_MEALS.where((meal) {

           if(currentFilters['isVegan'] == true && meal.isVegan == false){
              return false;
           }

           if(currentFilters['isVegetarian'] == true && meal.isVegetarian == false){
              return false;
           }

           if(currentFilters['isLactoseFree'] == true  && meal.isLactoseFree == false){
              return false;
           }

           if(currentFilters['isGlutenFree'] == true && meal.isGlutenFree == false){
              return false;
           }

          
          return true;


       }).toList();
  }

  

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object?>;

    final String categoryTitle = routeArgs['title'] as String;
    final String categoryId = routeArgs['id'] as String;
    final List<Meal> categoryMeals = meals.where((element) {
      return element.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: categoryMeals[index].id,
            imageUrl: categoryMeals[index].imageUrl,
            title: categoryMeals[index].title,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
            duration: categoryMeals[index].duration,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
