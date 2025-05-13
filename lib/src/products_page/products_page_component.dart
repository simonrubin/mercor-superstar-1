import 'package:ngdart/angular.dart';
import 'package:ngrouter/ngrouter.dart';
import '/src/product_page/product.dart';

@Component(
  selector: 'products-page',
  directives: [coreDirectives, routerDirectives],
  templateUrl: 'products_page_component.html',
  styleUrls: ['products_page_component.css'],
)
class ProductsPageComponent {
  static final products = List.generate(100, Product.new);
}