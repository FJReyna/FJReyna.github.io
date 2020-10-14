import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:http/http.dart';
import 'package:http/browser_client.dart';
import 'package:bootstrap_bundle/bootstrap_bundle.dart';
import 'package:ARShopUTC/app_component.template.dart' as ng;
import 'package:bloc/bloc.dart';
import 'SimpleBlocObserver.dart';
import 'main.template.dart' as self;

@GenerateInjector([
  routerProvidersHash,
  ClassProvider(Client, useClass: BrowserClient),
])
final InjectorFactory injector = self.injector$Injector;
void main() {
  print(bootstrapVersion);
  print(jQueryVersion);
  Bloc.observer = SimpleBlocObserver();
  runApp(
    ng.AppComponentNgFactory,
    createInjector: injector,
  );
}
