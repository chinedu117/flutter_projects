import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../providers/orders.dart' as prov;

class OrderItem extends StatelessWidget {
  const OrderItem({Key? key, required this.order}) : super(key: key);
  
  final prov.OrderItem order;
  @override
  Widget build(BuildContext context) {
    return Card(
       child: ListTile(
         title: Text(order.date),
       ),
    );
  }
}