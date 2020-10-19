import 'package:ARShopUTC/src/utils/route_paths.dart';
import 'package:angular_router/angular_router.dart';
import 'package:ARShopUTC/src/components/counter_page/counter_page_component.template.dart'
    as counter_page_component;
import 'package:ARShopUTC/src/components/home_page_component/home_page_component.template.dart'
    as home_page_component;
import 'package:ARShopUTC/src/components/signin_component/signin_component.template.dart'
    as signin_component;
import 'package:ARShopUTC/src/components/signup_component/signup_component.template.dart'
    as signup_component;
import 'package:ARShopUTC/src/components/profile_component/profile_component.template.dart'
    as profile_component;
import 'package:ARShopUTC/src/components/catalog_component/catalog_component.template.dart'
    as catalog_component;
import 'package:ARShopUTC/src/components/furniture_component/furniture_component.template.dart'
    as furniture_component;
import 'package:ARShopUTC/src/components/aboutus_component/aboutus_component.template.dart'
    as aboutus_component;
import 'package:ARShopUTC/src/components/downloadapp_component/downloadapp_component.template.dart'
    as downloadapp_component;
import 'package:ARShopUTC/src/components/not_found_component/not_found_component.template.dart'
    as not_found_component;

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

  static final signInPage = RouteDefinition(
    routePath: RoutePaths.signInPage,
    component: signin_component.SignInComponentNgFactory,
  );

  static final signUpPage = RouteDefinition(
    routePath: RoutePaths.signUpPage,
    component: signup_component.SignUpComponentNgFactory,
  );

  static final profilePage = RouteDefinition(
    routePath: RoutePaths.profilePage,
    component: profile_component.ProfileComponentNgFactory,
  );

  static final catalogPage = RouteDefinition(
    routePath: RoutePaths.catalogPage,
    component: catalog_component.CatalogComponentNgFactory,
  );

  static final furniturePage = RouteDefinition(
    routePath: RoutePaths.furniturePage,
    component: furniture_component.FurnitureComponentNgFactory,
  );

  static final aboutUsPage = RouteDefinition(
    routePath: RoutePaths.aboutUsPage,
    component: aboutus_component.AboutUsComponentNgFactory,
  );

  static final downloadAppPage = RouteDefinition(
    routePath: RoutePaths.downloadAppPage,
    component: downloadapp_component.DownloadAppComponentNgFactory,
  );

  static final all = <RouteDefinition>[
    homePage,
    counter,
    signInPage,
    signUpPage,
    profilePage,
    catalogPage,
    furniturePage,
    aboutUsPage,
    downloadAppPage,
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
