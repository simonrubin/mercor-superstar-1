import 'dart:html';
import 'package:ngdart/angular.dart';
import 'package:ngrouter/ngrouter.dart';
import '/src/product_page/product.dart';

@Component(
  selector: 'products-page',
  directives: [coreDirectives, routerDirectives],
  templateUrl: 'products_page_component.html',
  styleUrls: ['products_page_component.css'],
)
class ProductsPageComponent implements OnActivate, OnDeactivate {
  static const scrollYKey = 'scroll-y';
  static final products = List.generate(100, Product.new);

  @override
  void onDeactivate(RouterState current, RouterState next) {
    // Save current scroll offset to local-storage.
    window.localStorage[scrollYKey] = window.scrollY.toString();
  }

  @override
  void onActivate(RouterState? previous, RouterState current) {
    // Read scroll offset from local-storage.
    final scrollY = int.tryParse(window.localStorage[scrollYKey] ?? '0');
    
    // Restore scroll position
    window.requestAnimationFrame((_) => window.scrollTo(0, scrollY));    
  }
}