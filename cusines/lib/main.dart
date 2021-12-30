

import 'package:flutter/material.dart';

import './screens/categories_screen.dart';
import './screens/category_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import './screens/filters_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String,bool> _currentFilters = {
      "isVegan" : false,
     "isVegetarian" : false,
     "isLactoseFree" : false,
     "isGlutenFree" : false

  };

  void _updateFilters(Map<String,bool> filters){
      setState(() {
          
           _currentFilters['isVegan'] = filters['isVegan'] as bool;
           _currentFilters['isVegetarian'] = filters['isVegetarian'] as bool;
           _currentFilters['isGlutenFree'] = filters['isGlutenFree'] as bool;
           _currentFilters['isLactoseFree'] = filters['isLactoseFree'] as bool;

      });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cusines',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        canvasColor: const Color.fromRGBO(234, 211, 214, 1),
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline4: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
                fontFamily: 'RobotoCondensed',
                fontSize: 24,
                fontWeight: FontWeight.w700
              ),
            ),
      ),
      // home: CategoriesScreen(),
      routes: {
        TabsScreen.routeName: (ctx) => TabsScreen(),
        CategoryScreen.routeName: (ctx) => CategoryScreen(_currentFilters),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_currentFilters, _updateFilters),
      },
    );
  }
}
