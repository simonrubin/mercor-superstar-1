import 'package:ngrouter/ngrouter.dart';
import 'src/product_page/product_page_component.template.dart';
import 'src/products_page/products_page_component.template.dart';


class RoutePaths {
  static final products = RoutePath(path: 'products');
  static final product = RoutePath(path: 'products/:productId');
}

class Routes {
  static final all = <RouteDefinition>[
  RouteDefinition(
    routePath: RoutePaths.product,
    component: ProductPageComponentNgFactory,
  ),
    RouteDefinition(
    routePath: RoutePaths.products,
    component: ProductsPageComponentNgFactory,
  ),
  RouteDefinition.redirect(
    path: '',
    redirectTo: RoutePaths.products.toUrl(),
  ),
  ];
}



