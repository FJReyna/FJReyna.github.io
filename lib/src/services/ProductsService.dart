import 'dart:async';
import 'dart:convert';
import 'dart:html' as html;
import 'package:ARShopUTC/src/model/ProductModel.dart';
import 'package:ARShopUTC/src/utils/ARShopAPI.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

class ProductService {
  static final String _endpointProductsToShow =
      '${ARShopAPI.URL}/productsToShow';
  static final String _endpointProductByID = '${ARShopAPI.URL}/product';
  final Client _http;

  ProductService(this._http);

  Future<Map<String, dynamic>> getByID({@required int id}) async {
    var _product = {};
    try {
      final _response = await _http.get(
        '$_endpointProductByID?id=$id'
      );

      print(json.decode(_response.body)['data']);

      _product = json.decode(_response.body)['data'];
    } catch (error) {
      _handleError(error);
    }
    return _product;
  }

  Future<List<ProductModel>> getAll() async {
    List<ProductModel> _products;
    try {
      final _response = await _http.get(
        _endpointProductsToShow
      );

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
