import 'package:ARShopUTC/src/utils/route_paths.dart';
import 'package:ARShopUTC/src/utils/routes.dart';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

@Component(
  selector: 'signing-component',
  templateUrl: 'signin_component.html',
  styleUrls: ['signin_component.css'],
  directives: [
    coreDirectives,
    routerDirectives,
  ],
  exports: [RoutePaths, Routes],
)
class SignInComponent {}