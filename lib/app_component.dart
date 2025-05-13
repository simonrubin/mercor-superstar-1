import 'package:ngdart/angular.dart';
import 'package:ngrouter/ngrouter.dart';

import 'routes.dart';

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [coreDirectives, routerDirectives],
  providers: [routerProviders],
  exports: [Routes],
)
class AppComponent implements OnInit{



  void ngOnInit() {
    print(RoutePaths.product.toUrl(parameters: {'productId': '1'}));
  }
}
