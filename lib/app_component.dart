import 'package:ARShopUTC/src/footer_component/footer_component.dart';
import 'package:ARShopUTC/src/header_component/header_component.dart';
import 'package:ARShopUTC/src/home_page_component/home_page_component.dart';
import 'package:angular/angular.dart';

@Component(
  selector: 'app-root',
  templateUrl: 'app_component.html',
  directives: [
    HeaderComponent,
    HomePageComponent,
    FooterComponent
  ],
)
class AppComponent {}
