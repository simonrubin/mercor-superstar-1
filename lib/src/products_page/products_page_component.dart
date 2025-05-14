import 'dart:html';
import 'package:ngdart/angular.dart';
import 'package:ngforms/ngforms.dart';
import 'package:ngrouter/ngrouter.dart';
import '/src/product_page/product.dart';

@Component(
  selector: 'products-page',
  directives: [coreDirectives, formDirectives, routerDirectives],
  templateUrl: 'products_page_component.html',
  styleUrls: ['products_page_component.css'],
)
class ProductsPageComponent implements OnActivate {
  static final products = List.generate(100, Product.new);
  static final searchParamKey = 'q';
  static final sortParamKey = 'sort-by';

  final Location _location;

  var filteredProducts = products;
  var sortBy = 'name-asc';
  var q = '';

  ProductsPageComponent(this._location);

  void onSearch(Event e) {
    q = (e.target as InputElement).value ?? '';
    filteredProducts = products.where((e) => e.name.toLowerCase().contains(q.toLowerCase())).toList();

    _updateQueryParameters();
  }

  void onSort(Event e) {
    sortBy = (e.target as SelectElement).value ?? '';
    switch(sortBy) {
      case 'name-asc':
        filteredProducts.sort((a,b) => a.name.compareTo(b.name));
      case 'name-dsc':
        filteredProducts.sort((a,b) => b.name.compareTo(a.name));
      case 'price-asc':
        filteredProducts.sort((a,b) => a.price.compareTo(b.price));
      case 'price-dsc':
        filteredProducts.sort((a,b) => b.price.compareTo(a.price));
    }

    _updateQueryParameters();
  }

  @override
  void onActivate(RouterState? previous, RouterState current) {
      q = current.queryParameters[searchParamKey] ?? '';
      sortBy = current.queryParameters[sortParamKey] ?? 'name-asc';
  }

  void _updateQueryParameters() {
    final params = {if(q.isNotEmpty) searchParamKey: q, sortParamKey: sortBy};
    final uri = Uri.parse(_location.path()).replace(queryParameters: params);
    _location.replaceState(uri.toString());
  }
}
