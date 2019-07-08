import 'package:flutter/material.dart';

import './cart.dart';

class OrderItem {
    final String id;
    final double amount;
    final List<CartItem> products;
    final DateTime dateTime;

    OrderItem({
        @required this.id,
        @required this.amount,
        @required this.products,
        @required this.dateTime
    });
}

class Orders with ChangeNotifier {
    List<OrderItem> _orders = [];

    List<OrderItem> get orders => List.from(_orders);

    void addOrder(List<CartItem> cartProduct, double total) {
        _orders.insert(0, OrderItem(
            id: DateTime.now().toString(),
            amount: total,
            dateTime: DateTime.now(),
            products: cartProduct,
        ));
        notifyListeners();
    }
}
