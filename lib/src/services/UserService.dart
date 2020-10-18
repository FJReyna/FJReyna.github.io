import 'dart:convert';

import 'package:ARShopUTC/src/model/UserModel.dart';
import 'package:ARShopUTC/src/utils/ARShopAPI.dart';
import 'dart:html' as html;
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

class UserService {
  static final String _signUpEndpoint = '${ARShopAPI.URL}/auth/signup';
  static final String _signinEndpoint = '${ARShopAPI.URL}/auth/signin';

  final Dio _http;

  UserService(this._http);

  Future<UserModel> signIn({
    @required String username,
    @required String password,
  }) async {
    UserModel _user;
    try {
      final _response = await _http.post(
        _signinEndpoint,
        data: {
          'username': username,
          'password': password,
        },
      );

      _user = UserModel.fromJson(_response.data['data']);
    } catch (error) {
      _handleError(error);
    }
    return _user;
  }

  Future<Map<String, dynamic>> signUp({
    @required String name,
    @required String username,
    @required String email,
    @required String password,
  }) async {
    bool _success;
    String _message;
    try {
      final _response = await _http.post(
        _signUpEndpoint,
        data: {
          'name': name,
          'username': username,
          'email': email,
          'password': password,
        },
      );

      _message = _response.data['message'];

      _success = _response.statusCode == 200;
    } catch (error) {
      _handleError(error);
    }
    return {
      'succes': _success,
      'message': _message,
    };
  }

  Exception _handleError(dynamic e) {
    return Exception('Server error; cause: $e');
  }
}
