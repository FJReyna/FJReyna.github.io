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

  Future<Map<String, dynamic>> signIn({
    @required String username,
    @required String password,
  }) async {
    var _user = {};
    var _success = false;
    var _message = '';
    try {
      final _response = await _http.post(
        _signinEndpoint,
        data: {
          'username': username,
          'password': password,
        },
      );

      print(_response.data);

      if (_response.statusCode == 200) {
        _success = true;
        _user = {
          'id': _response.data['data']['userID'],
          'email': _response.data['data']['userEmail'],
          'name': _response.data['data']['userName'],
          'roles': _response.data['data']['userRoles'],
          'token': _response.data['data']['token'],
          username: _response.data['data']['userUsername'],
        };
        print(_user);
      }
      _message = _response.data['message'];
    } catch (error) {
      _handleError(error);
    }
    return {
      'success': _success,
      'user': _user,
      'message': _message,
    };
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
          'rolesUser': ['user'],
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
