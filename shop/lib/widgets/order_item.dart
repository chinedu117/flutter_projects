import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../providers/orders.dart' as prov;

class OrderItem extends StatefulWidget {
  const OrderItem({Key? key, required this.order}) : super(key: key);

  final prov.OrderItem order;

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _showDetail = false;

  void _toggleShowDetail() {
    setState(() {
      _showDetail = !_showDetail;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text('\$${widget.order.amount}'),
            subtitle: Text(
              DateFormat('dd-MM-yyyy').format(widget.order.date),
            ),
            trailing: IconButton(
                onPressed: _toggleShowDetail, 
                icon: Icon(_showDetail
                    ? Icons.expand_less_outlined
                    : Icons.expand_more_outlined)),
          ),
          if (_showDetail)
            Container(
              child: Column(
                children: [
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text("Product"),
                         Text('Amount'),
                     ],),
                   ),

                   ...widget.order.products.map((product){
                      return Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text(product.title),
                         Text('\$${( product.quantity * product.price )}'),
                     ],),
                   );
                      
                   }).toList()

                   

                    
                ],
              ),
            ),
        ],
      ),
    );
  }
}
