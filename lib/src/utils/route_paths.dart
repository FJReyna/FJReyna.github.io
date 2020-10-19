import 'package:angular_router/angular_router.dart';

const String idParam = 'id';

class RoutePaths {
  static final homePage = RoutePath(path: 'HomePage');
  static final counter = RoutePath(path: 'CounterPage');
  static final notFound = RoutePath(path: '404');
  static final signInPage = RoutePath(path: 'SignInPage');
  static final signUpPage = RoutePath(path: 'SignUpPage');
  static final profilePage = RoutePath(path: 'ProfilePage');
  static final catalogPage = RoutePath(path: 'CatalogPage');
  static final furniturePage = RoutePath(path: 'FurniturePage');
  static final aboutUsPage = RoutePath(path: 'AboutUsPage');
  static final downloadAppPage = RoutePath(path: 'DownloadAppPage');
}

int getId(Map<String, String> parameters) {
  final id = parameters[idParam];
  return id ?? int.tryParse(id);
}
