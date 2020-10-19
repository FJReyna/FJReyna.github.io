import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

@Component(
  selector: 'aboutus-component',
  templateUrl: 'aboutus_component.html',
  styleUrls: ['aboutus_component.css'],
  directives: [
    coreDirectives,
    routerDirectives,
  ],
)
class AboutUsComponent {}