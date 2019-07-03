import 'package:flutter/material.dart';

import '../routes.dart';

class ProductItem extends StatelessWidget {
    final String id;
    final String title;
    final String imageUrl;

    ProductItem(this.id, this.title, this.imageUrl);

    @override
    ClipRRect build(BuildContext context) =>
        ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: GridTile(
                child: GestureDetector(
                    onTap: () => Navigator.of(context).pushNamed(
                        Routes.productDetailScreen,
                        arguments: id,
                    ),
                    child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                    ),
                ),
                footer: GridTileBar(
                    backgroundColor: Colors.black87,
                    leading: IconButton(
                        icon: Icon(Icons.favorite_border),
                        color: Theme.of(context).accentColor,
                        onPressed: () {},
                    ),
                    trailing: IconButton(
                        icon: Icon(Icons.shopping_cart),
                        color: Theme.of(context).accentColor,
                        onPressed: () {},
                    ),
                    title: Text(
                        title,
                        textAlign: TextAlign.center,
                    ),
                ),
            ),
        );
}
