import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';
import '../providers/orders.dart';

import '../widgets/cart_item.dart' as wi;

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  static const String routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    var cartData = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Items"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          // Cart Summary

          Card(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(cartData.totalWorth.toString()),
                    backgroundColor: Colors.red,
                  ),
                  TextButton(
                    onPressed: () {
                      Provider.of<Orders>(context,listen: false)
                          .addItem(cartData.items.values.toList());
                      cartData.clear();
                    },
                    child: const Text("Place Order"),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return wi.CartItem(
                  id: cartData.items.values.toList()[index].id,
                  price: cartData.items.values.toList()[index].price,
                  title: cartData.items.values.toList()[index].title,
                  quantity: cartData.items.values.toList()[index].quantity,
                );
              },
              itemCount: cartData.items.length,
            ),
          ),
        ],
      ),
    );
  }
}
