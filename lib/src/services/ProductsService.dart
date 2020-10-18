import 'dart:async';
import 'dart:convert';
import 'dart:html' as html;
import 'package:ARShopUTC/src/model/ProductModel.dart';
import 'package:ARShopUTC/src/utils/ARShopAPI.dart';
import 'package:http/http.dart';

class ProductService {
  static final _headers = {'Content-Type': 'application/json'};
  static final String _endpoint = '${ARShopAPI.URL}/productsToShow';
  final Client _http;

  ProductService(this._http);

  Future<List<ProductModel>> getAll() async {
    List<ProductModel> _products;
    try {
      final _response = await _http.get(_endpoint, headers: _headers);

      _products = (_extractData(_response) as List)
          .map((product) => ProductModel.fromJson(product))
          .toList();
    } catch (error) {
      _handleError(error);
    }
    return _products;
  }

  dynamic _extractData(Response resp) => json.decode(resp.body)['data'];

  Exception _handleError(dynamic e) {
    return Exception('Server error; cause: $e');
  }
}
