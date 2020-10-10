import 'package:ARShopUTC/src/footer_component/footer_component.dart';
import 'package:ARShopUTC/src/header_component/header_component.dart';
import 'package:ARShopUTC/src/home_page_component/home_page_component.dart';
import 'package:ARShopUTC/src/utils/routes.dart';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

@Component(
  selector: 'app-root',
  templateUrl: 'app_component.html',
  directives: [
    routerDirectives,
    HeaderComponent,
    HomePageComponent,
    FooterComponent
  ],
  exports: [RoutePaths, Routes],
)
class AppComponent {}
