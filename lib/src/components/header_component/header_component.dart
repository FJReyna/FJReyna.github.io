import 'package:angular/angular.dart';
import 'dart:html' as html;

import 'package:angular_router/angular_router.dart';

@Component(
    selector: 'header-component',
    templateUrl: 'header_component.html',
    styleUrls: [
      'header_component.css'
    ],
    directives: [
      coreDirectives,
      routerDirectives,
    ])
class HeaderComponent implements OnInit {
  String role = '';
  bool isSignedOut = true;

  void onSignOut() {
    html.window.localStorage.clear();
    isSignedOut = true;
    html.window.location.href = '/';
  }

  @override
  void ngOnInit() {
    isSignedOut = html.window.localStorage.isEmpty;
  }
}
