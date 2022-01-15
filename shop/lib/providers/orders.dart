import 'package:flutter/foundation.dart';

import './cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime date;

  OrderItem(
      {required this.id,
      required this.amount,
      required this.products,
      required this.date});
}

class Orders with ChangeNotifier {
  List<OrderItem> _items = [];

  List<OrderItem> get items {
    return [..._items];
  }

  void addItem(List<CartItem> products) {

    if(products.length > 0){
      _items.insert(
      0,
      OrderItem(

        date: DateTime.now(),
        id: DateTime.now().toString(),
        products: products,
        amount: products.fold(
            0.0,
            (previousValue, cartItem) =>
                previousValue += (cartItem.price * cartItem.quantity)),
      ),

    );
    notifyListeners();
    }
    
  }
}
