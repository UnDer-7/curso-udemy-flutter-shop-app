import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/cart.dart';

class CartItem extends StatelessWidget {
    final String id;
    final String productId;
    final String title;
    final double price;
    final int quantity;

    CartItem({
        @required this.id,
        @required this.productId,
        @required this.title,
        @required this.price,
        @required this.quantity
    });

    @override
    Dismissible build(BuildContext context) =>
        Dismissible(
            direction: DismissDirection.endToStart,
            key: ValueKey(id),
            onDismissed: (direction) {
                Provider.of<Cart>(context, listen: false).removeItem(productId);
            },
            background: Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 20),
                color: Theme.of(context).errorColor,
                child: Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 40,
                ),
            ),
            child: Card(
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
            ),
        );
}
