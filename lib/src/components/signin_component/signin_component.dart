import 'package:ARShopUTC/src/model/UserModel.dart';
import 'package:ARShopUTC/src/services/UserService.dart';
import 'package:ARShopUTC/src/utils/route_paths.dart';
import 'package:ARShopUTC/src/utils/routes.dart';
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:dio/dio.dart';
import 'dart:html' as html;

@Component(
  selector: 'signing-component',
  templateUrl: 'signin_component.html',
  styleUrls: ['signin_component.css'],
  directives: [
    coreDirectives,
    routerDirectives,
    formDirectives,
  ],
  providers: [UserService],
  exports: [RoutePaths, Routes],
)
class SignInComponent implements OnInit {
  UserService userService = UserService(Dio());
  final Router _router;
  String message = '';
  bool isLoading = false;

  final usernameControl = Control('', Validators.required);
  final passwordControl = Control('', Validators.required);

  ControlGroup formGroup;

  SignInComponent(this._router);

  void onSignIn() async {
    isLoading = true;
    var _result = await userService.signIn(
      username: usernameControl.rawValue.trim(),
      password: passwordControl.rawValue.trim(),
    );

    print(_result['user']);

    var _user = _result['user'];

    if (_result['success']) {
      html.window.localStorage.addAll(Map<String, String>.from({
        'username': _user['username'],
        'name': _user['name'],
        'id': _user['id'].toString(),
        'token': _user['token'],
        'email': _user['email'],
        'role': _user['roles'].elementAt(0),
      }));
      formGroup.reset();
      await _router.navigate(RoutePaths.counter.toUrl());
    }

    message = _result['message'];
    isLoading = false;
  }

  @override
  void ngOnInit() {
    formGroup = FormBuilder.controlGroup({
      'inputUsername': usernameControl,
      'inputPassword': passwordControl,
    });
  }
}
