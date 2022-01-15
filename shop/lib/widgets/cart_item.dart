import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart' as prov;

class CartItem extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
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
        Provider.of<prov.Cart>(context, listen: false).removeCartItem(id);
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Removes item '),
          ),
        );
      },
      child: Card(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: CircleAvatar(
            child: FittedBox(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('\$${price}'),
              ),
            ),
          ),
          title: Text(title),
          subtitle: Text('Total: \$${(price * quantity)}'),
          trailing: Text('${quantity} x'),
        ),
      )),
    );
    ;
  }
}
