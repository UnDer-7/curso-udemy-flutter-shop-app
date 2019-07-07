import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './product_item.dart';
import '../providers/products.dart';

class ProductsGrid extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        final products = Provider.of<Products>(context).items;

        return GridView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
            ),
            itemBuilder: (BuildContext ctx, int i) =>
                ChangeNotifierProvider(
                    builder: (BuildContext ctx) => products[i],
                    child: ProductItem(),
                ),
        );
    }
}
