import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart' as prov;


class CartItem extends StatefulWidget {
  final String id;
  final int quantity;
  final double price;
  final String title;

  const CartItem(
      {required this.price,
      required this.title,
      required this.quantity,
      required this.id});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(widget.id),
      background: Container(
        color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Icon(Icons.delete),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: Icon(Icons.delete),
            )
          ],
        ),
      ),
      onDismissed: (direction) {
          setState(() {
            
          });
          Provider.of<prov.Cart>(context,listen: false).removeCartItem(widget.id);
      },
      child: Card(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: CircleAvatar(
            child: FittedBox(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('\$${widget.price}'),
              ),
            ),
          ),
          title: Text(widget.title),
          subtitle: Text('Total: \$${(widget.price * widget.quantity)}'),
          trailing: Text('${widget.quantity} x'),
        ),
      )),
    );
    ;
  }
}
