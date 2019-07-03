import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
    @override
    Scaffold build(BuildContext context) {
        final productID = ModalRoute.of(context).settings.arguments as String;
        return Scaffold(
            appBar: AppBar(
                title: Text('title'),
            ),
        );
    }
}
