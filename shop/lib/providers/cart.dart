import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem(
      {required this.id,
      required this.title,
      required this.quantity,
      required this.price});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  double get totalWorth {
      var total = 0.0;
      items.values.forEach((product) { 
         total += product.quantity * product.price;
       });

      return total;
  }

  void removeCartItem(productID){

    _items.removeWhere((ind, cartItem) =>  cartItem.id == productID );
     
     notifyListeners();
  }

  addCartItem(
    String productID,
    String title,
    int quantity,
    double price,
  ) {
    if (items.containsKey(productID)) {
      //  update the quant
        print("Item in cart updated");
      _items.update(productID, (oldValue) {
        return CartItem(
          id: oldValue.id,
          title: oldValue.title,
          price: oldValue.price,
          quantity: oldValue.quantity + 1,
        );
      });
    } else {
      // _create new cartitem
       
      _items.putIfAbsent(
        productID,
        () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          quantity: quantity,
          price: price,
        )
      );

      print("Item added to cart");
    }

  
  }
}
