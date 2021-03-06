import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/screens/order_screen.dart';
import 'package:shop/screens/product_manager_screen.dart';
import './providers/orders.dart';
import './screens/product_detail_screen.dart';

import './screens/cart_screen.dart';
import './providers/cart.dart';
import './screens/edit_product_screen.dart';
import './providers/products.dart';

import './screens/products_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Cart()),
        ChangeNotifierProvider(create: (_) => Products()),
        ChangeNotifierProvider(create: (_) => Orders(),),

      ], 
      child: MaterialApp(
        title: 'My Shop',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ProductsScreen(),
        routes: {
          EditProductScreen.routeName: (ctx) => EditProductScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          OrderScreen.routeName: (ctx) => OrderScreen(),
          ProductManagerScreen.routeName: (ctx) => ProductManagerScreen(),
        },
      ),
    );
  }
}
