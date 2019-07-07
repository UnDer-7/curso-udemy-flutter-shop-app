import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './product_item.dart';
import '../providers/products.dart';
import 'package:shop_app/providers/product.dart';

class ProductsGrid extends StatelessWidget {
    final bool showFavs;

    ProductsGrid(this.showFavs);

    @override
    Widget build(BuildContext context) {
        final productData = Provider.of<Products>(context);
        final products = _productList(productData);

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
                ChangeNotifierProvider.value(
                    value: products[i],
                    child: ProductItem(),
                ),
        );
    }

    List<Product> _productList(Products products) {
        if (showFavs) return products.favoriteItems;
        return products.items;
    }
}
