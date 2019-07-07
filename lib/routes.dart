import 'package:flutter/material.dart';

import './screens/product_detail_screen.dart';
import './screens/cart_screen.dart';

abstract class Routes {
    /// Route: /product-detail
    static const String productDetailScreen = '/product-detail';

    /// Route: /cart
    static const String cartScreen = '/cart';

    static final Map<String, WidgetBuilder> _availableRoutes = {
        productDetailScreen: (BuildContext ctx) => ProductDetailScreen(),
        cartScreen: (BuildContext ctx) => CartScreen(),
    };

    static Map<String, WidgetBuilder> get availableRoutes {
        return Map.from(_availableRoutes);
    }
}
