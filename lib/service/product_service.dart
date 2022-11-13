import 'dart:convert';

import 'package:fetch_products/model/product.dart';
import 'package:http/http.dart';

class ProductService{
  
  Future<List<Product>> fetchProducts() async {
    try {
      Response products = await get(Uri.parse('https://teste-produtos.herokuapp.com/api/produtos'));
      return (jsonDecode(products.body) as List).map((e) => Product.fromMap(e)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<bool> registerProduct(String map) async {
    try {
      Response response = await post(Uri.parse("te;ste-produtos.herokuapp.com/api/produtos"), headers: {'Content-Type': 'application/json; charset=UTF-8'}, body: map);
      if(response.statusCode == 201) return true;
      return false;
    } catch (e) {
      return false;
    }
  }

}