import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/screens/edit_product_screen.dart';
import 'package:shop/widgets/manage_product_item.dart';

import '../providers/products.dart';

class ProductManagerScreen extends StatelessWidget {
  static const routeName = '/product-manager';

  const ProductManagerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var products = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Manage Products"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(EditProductScreen.routeName);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
          itemCount: products.items.length,
          itemBuilder: (ctx, index) => Container(
                child: ManageProductItem(
                    title: products.items[index].title,
                    imageUrl: products.items[index].imageUrl,
                    id: products.items[index].id),
              )),
    );
  }
}
