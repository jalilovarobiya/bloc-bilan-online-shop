import 'dart:convert';

import 'package:online_shop/model/products_model.dart';
import 'package:http/http.dart' as http;

sealed class _ProductRepository {
  Future<List<ProductsModel>> fetchProducts();
}

class ProductRepositoryImpl extends _ProductRepository {
  @override
  Future<List<ProductsModel>> fetchProducts() async {
    final response = await http.get(
      Uri.parse("https://fakestoreapi.com/products"),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode > 199 && response.statusCode < 300) {
      final data = json.decode(Utf8Decoder().convert(response.bodyBytes));
      final List<dynamic> dataList = data;
      List<ProductsModel> list =
          dataList.map((e) => ProductsModel.fromMap(e)).toList();
      return list;
    }
    throw json.decode(response.body)['message'];
  }
}
