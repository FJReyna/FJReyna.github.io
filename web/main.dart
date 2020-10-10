import 'package:angular/angular.dart';
import 'package:bootstrap_bundle/bootstrap_bundle.dart';
import 'package:ARShopUTC/app_component.template.dart' as ng;
import 'package:bloc/bloc.dart';
import 'SimpleBlocObserver.dart';

void main() {
  print(bootstrapVersion);
  print(jQueryVersion);
  Bloc.observer = SimpleBlocObserver();
  runApp(ng.AppComponentNgFactory);
}
