import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';
import '../providers/cart.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: GridTile(
        child: Image.network(
          product.imageUrl,
          fit: BoxFit.cover,
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black38,
          title: Text(
            product.title,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          leading: Consumer<Product>(//only this widget would rebuild
              builder: (context, product, child) {
            return IconButton(
              onPressed: () {
                product.toggleFavorite();
              },
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Colors.red,
              ),
            );
          }),
          trailing: IconButton(
            onPressed: () {
              Provider.of<Cart>(context, listen: false).addCartItem(
                  product.id, product.title, 1, product.price);
            },
            icon: Icon(Icons.shopping_cart),
          ),
        ),
      ),
    );
  }
}
