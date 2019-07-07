import 'package:flutter/material.dart';

import '../widgets/products_grid.dart';

enum FilterOptions {
    favorites,
    all
}

class ProductsOverviewScreen extends StatefulWidget {
    @override
    _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
    bool _showOnlyFavorites = false;
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('MyShop'),
                actions: <Widget>[
                    PopupMenuButton(
                        onSelected: (FilterOptions selectValue) {
                            setState(() {
                                if (selectValue == FilterOptions.favorites){
                                    _showOnlyFavorites = true;
                                } else {
                                    _showOnlyFavorites = false;
                                }
                            });
                        },
                        icon: Icon(
                            Icons.more_vert,
                        ),
                        itemBuilder: (_) => [
                            PopupMenuItem(
                                child: Text('Only Favorites'),
                                value: FilterOptions.favorites,
                            ),
                            PopupMenuItem(
                                child: Text('Show All'),
                                value: FilterOptions.all,
                            )
                        ],
                    ),
                ],
            ),
            body: ProductsGrid(_showOnlyFavorites),
        );
    }
}
