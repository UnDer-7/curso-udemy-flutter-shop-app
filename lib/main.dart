import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/products_overview_screen.dart';
import './providers/products.dart';
import './providers/cart.dart';
import './providers/orders.dart';
import './routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MultiProvider(
            providers: [
                ChangeNotifierProvider.value(
                    value: Products(),
                ),
                ChangeNotifierProvider.value(
                    value: Cart(),
                ),
                ChangeNotifierProvider.value(
                    value: Orders(),
                ),
            ],
            child: MaterialApp(
                title: 'MyShop',
                theme: ThemeData(
                    primarySwatch: Colors.purple,
                    accentColor: Colors.orangeAccent,
                    fontFamily: 'Lato',
                ),
                home: ProductsOverviewScreen(),
                routes: Routes.availableRoutes,
            ),
        );
    }
}
