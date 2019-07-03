import 'package:flutter/material.dart';

import './screens/product_detail_screen.dart';

abstract class Routes {
    static const String productDetailScreen = '/product-detail';

    static final Map<String, WidgetBuilder> _availableRoutes = {
        productDetailScreen: (BuildContext ctx) => ProductDetailScreen(),
    };

    static Map<String, WidgetBuilder> get availableRoutes {
        return Map.from(_availableRoutes);
    }
}
