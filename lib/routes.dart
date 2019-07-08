import 'package:flutter/material.dart';

import './screens/product_detail_screen.dart';
import './screens/cart_screen.dart';
import './screens/orders_screen.dart';

abstract class Routes {
    /// <h2>Route: /product-detail</h2>
    static const String productDetailScreen = '/product-detail';

    /// <h2>Route: /cart</h2>
    static const String cartScreen = '/cart';

    /// <h2>Route: /orders</h2>
    static const String ordersScreen = '/orders';

    static final Map<String, WidgetBuilder> _availableRoutes = {
        productDetailScreen: (BuildContext ctx) => ProductDetailScreen(),
        cartScreen: (BuildContext ctx) => CartScreen(),
        ordersScreen: (BuildContext ctx) => OrdersScreen(),
    };

    static Map<String, WidgetBuilder> get availableRoutes {
        return Map.from(_availableRoutes);
    }
}
