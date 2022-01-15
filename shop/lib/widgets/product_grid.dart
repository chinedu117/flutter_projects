
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import "../providers/product.dart";

import "../providers/products.dart";
import './product_item.dart';


class ProductGrid extends StatelessWidget {
  
  final bool showFavorites;

  ProductGrid({ required this.showFavorites});
   

  @override
  Widget build(BuildContext context) {

    final products = Provider.of<Products>(context, listen: false);
    final productList = showFavorites ? products.favorites : products.items;

    return GridView.builder(
      itemCount: productList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 4 / 3,
      ),
      itemBuilder: (ctx, index) {
        return ChangeNotifierProvider.value(
          value: productList[index],
          child: ProductItem(),
        );
      },
    );
  }
}
