import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
    @override
    Scaffold build(BuildContext context) {
        final productID = ModalRoute.of(context).settings.arguments as String;
        final loadedProduct = Provider.of<Products>(context, listen: false).findById(productID);

        return Scaffold(
            appBar: AppBar(
                title: Text(loadedProduct.title),
            ),
        );
    }
}
