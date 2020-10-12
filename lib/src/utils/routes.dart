import 'package:ARShopUTC/src/utils/route_paths.dart';
import 'package:angular_router/angular_router.dart';
import 'package:ARShopUTC/src/components/counter_page/counter_page_component.template.dart'
    as counter_page_component;
import 'package:ARShopUTC/src/components/home_page_component/home_page_component.template.dart'
    as home_page_component;
import 'package:ARShopUTC/src/components/not_found_component/not_found_component.template.dart' as not_found_component;

export 'route_paths.dart';

class Routes {
  static final homePage = RouteDefinition(
    routePath: RoutePaths.homePage,
    component: home_page_component.HomePageComponentNgFactory,
  );

  static final counter = RouteDefinition(
    routePath: RoutePaths.counter,
    component: counter_page_component.CounterPageComponentNgFactory,
  );

  static final all = <RouteDefinition>[
    homePage,
    counter,
    RouteDefinition.redirect(
      path: '',
      redirectTo: RoutePaths.homePage.toUrl(),
    ),
    RouteDefinition(
      path: '.+',
      component: not_found_component.NotFoundComponentNgFactory,
    ),
  ];
}
