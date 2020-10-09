import 'package:angular/angular.dart';
import 'package:ARShopUTC/app_component.template.dart' as ng;
import 'package:bloc/bloc.dart';
import 'SimpleBlocObserver.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(ng.AppComponentNgFactory);
}
