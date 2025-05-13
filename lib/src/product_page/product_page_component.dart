import 'package:ngdart/angular.dart';
import 'package:ngrouter/ngrouter.dart';
import 'product.dart';
import '../../routes.dart';

@Component(
  selector: 'product-page',
  directives: [coreDirectives, routerDirectives],
  templateUrl: 'product_page_component.html',
  styleUrls: ['product_page_component.css'],
  exports: [RoutePaths],
)
class ProductPageComponent implements OnActivate {
  var product = Product(-1);

  @override
  void onActivate(RouterState? previous, RouterState current) {
    product = new Product(int.parse(current.parameters['productId']!));
  }
}