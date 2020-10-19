import 'package:ARShopUTC/src/services/UserService.dart';
import 'package:ARShopUTC/src/utils/route_paths.dart';
import 'package:ARShopUTC/src/utils/routes.dart';
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:dio/dio.dart';

@Component(
  selector: 'signup-component',
  templateUrl: 'signup_component.html',
  styleUrls: ['signup_component.css'],
  directives: [
    coreDirectives,
    routerDirectives,
    formDirectives,
  ],
  providers: [UserService],
  exports: [RoutePaths, Routes],
)
class SignUpComponent implements OnInit {
  UserService userService = UserService(Dio());
  String message = '';
  bool isLoading = false;

  final nameControl = Control('', Validators.required);
  final userNameControl = Control('', Validators.required);
  final emailControl = Control('', Validators.required);
  final passwordControl = Control('', Validators.required);

  ControlGroup formGroup;

  SignUpComponent();

  void onSignUp() async {
    isLoading = true;
    var _result = await userService.signUp(
      name: nameControl.rawValue.trim(),
      username: userNameControl.rawValue.trim(),
      email: emailControl.rawValue.trim(),
      password: passwordControl.rawValue.trim(),
    );
    message = _result['message'];
    formGroup.reset();
    isLoading = false;
  }

  @override
  void ngOnInit() {
    formGroup = FormBuilder.controlGroup({
      'inputName': nameControl,
      'inputEmail': emailControl,
      'inputUsername': userNameControl,
      'inputPassword': passwordControl,
    });
  }
}
