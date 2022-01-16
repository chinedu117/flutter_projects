import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/orders.dart' as prov;
import '../widgets/order_item.dart' as wi;

class OrderScreen extends StatelessWidget {
  static const routeName = '/orders';
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var orders = Provider.of<prov.Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Orders"),
      ),
      body: ListView.builder(
          itemCount: orders.items.length,
          itemBuilder: (ctx, index) {
            return wi.OrderItem(order: orders.items[index]);
          }),
    );
  }
}
