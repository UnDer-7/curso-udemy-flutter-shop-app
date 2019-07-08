import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
    final String id;
    final String title;
    final double price;
    final int quantity;

    CartItem({
        @required this.id,
        @required this.title,
        @required this.price,
        @required this.quantity
    });

    @override
    Card build(BuildContext context) =>
        Card(
            margin: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 4,
            ),
            child: Padding(
                padding: EdgeInsets.all(8),
                child: ListTile(
                    leading: CircleAvatar(
                        child: Padding(
                            padding: EdgeInsets.all(5),
                          child: FittedBox(
                              child: Text('\$$price'),
                          ),
                        ),
                    ),
                    title: Text(title),
                    subtitle: Text('Total: \$${(price * quantity)}'),
                    trailing: Text('$quantity x'),
                ),
            ),
        );
}
