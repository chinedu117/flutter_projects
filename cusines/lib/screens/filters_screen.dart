import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static String routeName = "/filterscreen";

  Map<String, bool> currentFilters;
  Function updateFilters;

  FiltersScreen(this.currentFilters, this.updateFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool isVegan = false;
  bool isVegetarian = false;
  bool isLactoseFree = false;
  bool isGlutenFree = false;

  @override
  void initState() {
    isVegan = widget.currentFilters['isVegan'] as bool;
    isVegetarian = widget.currentFilters['isVegetarian'] as bool;
    isGlutenFree = widget.currentFilters['isGlutenFree'] as bool;
    isLactoseFree = widget.currentFilters['isLactoseFree'] as bool;

    super.initState();
  }

  
  void _saveFilters()
  {  
    setState(() {
      widget.updateFilters(
        {
           "isVegetarian":isVegetarian,
           "isVegan": isVegan,
           "isGlutenFree": isGlutenFree,
           "isLactoseFree": isLactoseFree
        } 
      );
    });
      
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Set Filters"),
        actions: [
          IconButton(onPressed: _saveFilters, icon: Icon(Icons.save))
        ],
      ),
      body: Column(
        children: [
          SwitchListTile(
              value: isVegan,
              title: Text('Select vegan diets'),
              onChanged: (bool newValue) {
                setState(() {
                  isVegan = newValue;
                });
              }),
                SwitchListTile(
              value: isVegetarian,
              title: Text('Select vegetarian diets'),
              onChanged: (bool newValue) {
                setState(() {
                  isVegetarian = newValue;
                });
              }),
                SwitchListTile(
              value: isGlutenFree,
              title: Text('Select Gluten free diets'),
              onChanged: (bool newValue) {
                setState(() {
                  isGlutenFree = newValue;
                });
              }),
              SwitchListTile(
              value: isLactoseFree,
              title: const Text('Select Lactose free diets'),
              onChanged: (bool newValue) {
                setState(() {
                  isLactoseFree = newValue;
                });
              }),
        ],
      ),
    );
  }
}
