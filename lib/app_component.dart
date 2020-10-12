import 'package:ARShopUTC/src/components/footer_component/footer_component.dart';
import 'package:ARShopUTC/src/components/header_component/header_component.dart';
import 'package:ARShopUTC/src/components/home_page_component/home_page_component.dart';
import 'package:ARShopUTC/src/components/not_found_component/not_found_component.dart';
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
    FooterComponent,
    NotFoundComponent,
  ],
  exports: [RoutePaths, Routes],
)
class AppComponent {}
