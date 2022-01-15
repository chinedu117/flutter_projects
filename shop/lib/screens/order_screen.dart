
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/orders.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var orders = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Orders"),
      ),

      body: ListView.builder(
        itemCount: orders.items.length,
        itemBuilder: (ctx, index) {
         return Container();
      }),
    );
  }
}
