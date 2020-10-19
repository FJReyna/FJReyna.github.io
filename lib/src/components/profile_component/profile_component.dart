import 'package:angular/angular.dart';
import 'dart:html' as html;

import 'package:angular_router/angular_router.dart';

@Component(
  selector: 'profile-component',
  templateUrl: 'profile_component.html',
  styleUrls: ['profile_component.css'],
  directives: [
    coreDirectives,
    routerDirectives,
  ],
)
class ProfileComponent implements OnInit {
  bool isSignedIn = false;
  String name = '';
  String username = '';
  String email = '';

  @override
  void ngOnInit() {
    isSignedIn = html.window.localStorage.isNotEmpty;
    if (isSignedIn) {
      name = html.window.localStorage['name'];
      username = html.window.localStorage['username'];
      email = html.window.localStorage['email'];
    }
  }
}
