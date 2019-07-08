import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart' show Cart;
import '../providers/orders.dart';
import '../widgets/cart_item.dart';
class CartScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        final cart = Provider.of<Cart>(context);

        return Scaffold(
            appBar: AppBar(
                title: Text('Your Cart'),
            ),
            body: Column(
                children: <Widget>[
                    Card(
                        margin: EdgeInsets.all(15),
                        child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                    Text(
                                        'Total',
                                        style: TextStyle(
                                            fontSize: 20,
                                        ),
                                    ),
                                    Spacer(),
                                    Chip(
                                        label: Text(
                                            '\$${cart.totalAmout.toStringAsFixed(2)}',
                                            style: TextStyle(
                                                color: Theme.of(context).primaryTextTheme.title.color,
                                            ),
                                        ),
                                        backgroundColor: Theme.of(context).primaryColor,
                                    ),
                                    FlatButton(
                                        child: Text('ORDER NOW!'),
                                        onPressed: () {
                                            Provider.of<Orders>(context, listen: false)
                                                .addOrder(cart.item.values.toList(), cart.totalAmout);
                                            cart.clear();
                                        },
                                        textColor: Theme.of(context).primaryColor,
                                    )
                                ],
                            ),
                        ),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                        child: ListView.builder(
                            itemCount: cart.itemCount,
                            itemBuilder: (BuildContext ctx, int i) => CartItem(
                                id: cart.item.values.toList()[i].id,
                                productId: cart.item.keys.toList()[i],
                                price: cart.item.values.toList()[i].price,
                                quantity: cart.item.values.toList()[i].quantity,
                                title: cart.item.values.toList()[i].title,
                            )
                        ),
                    )
                ],
            ),
        );
    }
}
