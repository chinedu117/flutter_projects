import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../widgets/home_drawer.dart';
import '../widgets/product_grid.dart';
import '../providers/product.dart';
import '../providers/products.dart';
import '../widgets/product_item.dart';

import './cart_screen.dart';

enum FilterOptions {
  All,
  Favorites,
}

class ProductsScreen extends StatefulWidget {
  static const routeName = '/';

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  var _showFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chizmart"),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            onSelected: (dynamic selectedItem) {
              setState(() {
                if (selectedItem == FilterOptions.Favorites) {
                  _showFavorites = true;
                } else {
                  //show all
                  _showFavorites = false;
                }
              });
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text("Show All"),
                value: FilterOptions.All,
              ),
              PopupMenuItem(
                child: Text("Favorites"),
                value: FilterOptions.Favorites,
              ),
            ],
          ),

          IconButton(onPressed: (){
            Navigator.of(context).pushNamed(CartScreen.routeName);
          }, icon: const Icon(Icons.shopping_cart)),

          
        ],
      ),
      body: ProductGrid(
        showFavorites: _showFavorites,
      ),
      drawer: Drawer(
        child: HomeDrawer(),
      )
    );
  }
}
