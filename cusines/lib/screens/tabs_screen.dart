// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import './filters_screen.dart';
import './categories_screen.dart';
import './favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  static String routeName = "/";

  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  void _selectTab(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  int _selectedTabIndex = 0;

  List<Widget> _tabs = [
    CategoriesScreen(),
    FavoritesScreen(),
  ];

  Widget _buildDrawerItem(IconData icon, String title, Function action) {
    return InkWell(
      onTap: () => action(),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: ListTile(
          leading: Icon(icon),
          title: Text(title),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Cusines App'),
          ),
          drawer: Drawer(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Menu',
                      style: Theme.of(context).textTheme.headline5),
                ),
                _buildDrawerItem(Icons.restaurant, 'Restaurant', () {
                  Navigator.of(context)
                      .pushReplacementNamed(TabsScreen.routeName);
                }),
                _buildDrawerItem(Icons.filter, 'Filters', () {
                  Navigator.of(context).pushNamed(FiltersScreen.routeName);
                }),
              ],
            ),
          ),
          body: _tabs[_selectedTabIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: _selectTab,
            backgroundColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.white,
            selectedItemColor: Colors.orange,
            currentIndex: _selectedTabIndex,
            type: BottomNavigationBarType.shifting,

            items: [
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.category),
                title: Text("Categories"),
              ),
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.star),
                title: Text("Favorites"),
              )
            ],
          ),
        ));
  }
}
