import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/products_overview_screen.dart';
import './routes.dart';
import './providers/products.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return ChangeNotifierProvider(
            builder: (BuildContext ctx) => Products(),
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