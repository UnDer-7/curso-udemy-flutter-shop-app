import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../routes.dart';
import '../providers/product.dart';
import '../providers/cart.dart';

class ProductItem extends StatelessWidget {
    @override
    ClipRRect build(BuildContext context) {
        final product = Provider.of<Product>(context, listen: false);
        final cart = Provider.of<Cart>(context, listen: false);

        return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: GridTile(
                child: GestureDetector(
                    onTap: () =>
                        Navigator.of(context).pushNamed(
                            Routes.productDetailScreen,
                            arguments: product.id,
                        ),
                    child: Image.network(
                        product.imageUrl,
                        fit: BoxFit.cover,
                    ),
                ),
                footer: GridTileBar(
                    backgroundColor: Colors.black87,
                    leading: Consumer<Product>(
                      builder: (BuildContext ctx, Product product, child) =>
                          IconButton(
                              icon: Icon(_favoriteIcon(product)),
                              color: Theme
                                  .of(context)
                                  .accentColor,
                              onPressed: () {
                                  product.toggleFavoriteStatus();
                              },
                          ),
                    ),
                    trailing: IconButton(
                        icon: Icon(Icons.shopping_cart),
                        color: Theme
                            .of(context)
                            .accentColor,
                        onPressed: () {
                            cart.addItem(product.id, product.price, product.title);
                        },
                    ),
                    title: Text(
                        product.title,
                        textAlign: TextAlign.center,
                    ),
                ),
            ),
        );
    }

    IconData _favoriteIcon(Product product) {
        if (product.isFavorite) return Icons.favorite;
        return Icons.favorite_border;
    }
}
