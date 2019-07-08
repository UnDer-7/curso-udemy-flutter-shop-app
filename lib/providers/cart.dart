import 'package:flutter/material.dart';

class CartItem {
    final String id;
    final String title;
    final int quantity;
    final double price;

    CartItem({
        @required this.id,
        @required this.title,
        @required this.quantity,
        @required this.price
    });
}

class Cart with ChangeNotifier {
    Map<String, CartItem> _items = {};

    Map<String, CartItem> get item => Map.from(_items);

    int get itemCount => _items.length;

    double get totalAmout {
        double total = 0.0;
        _items.forEach((key, cartItem) {
           total += cartItem.price * cartItem.quantity;
        });
        return total;
    }

    void addItem(String productId, double price, String title) {
        if (_items.containsKey(productId)) {
            _items.update(
                productId,
                (existingCartItem) => CartItem(
                    id: existingCartItem.id,
                    title: existingCartItem.title,
                    price: existingCartItem.price,
                    quantity: existingCartItem.quantity + 1,
                ),
            );
        } else {
            _items.putIfAbsent(
                productId,
                () => CartItem(
                  id: DateTime.now().toString(),
                    title: title,
                    price: price,
                    quantity: 1,
                ),
            );
        }
        notifyListeners();
    }

    void removeItem(String id) {
        _items.remove(id);
        notifyListeners();
    }

    void clear() {
        _items = {};
        notifyListeners();
    }
}
