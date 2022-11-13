import 'dart:convert';

import 'package:fetch_products/model/product.dart';
import 'package:fetch_products/service/product_service.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class ProductController{

  final ProductService _productService = ProductService();

  final BehaviorSubject<List<Product>> productStream = BehaviorSubject<List<Product>>();

  Future<void> fetchProdutcs() async {
    List<Product> fetchedProducts = await _productService.fetchProducts();
    productStream.sink.add(fetchedProducts);
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  Future<void> registerProduct(ScaffoldMessengerState message) async {
    var body = jsonEncode(Product().toMap(nameController.text, numberController.text, priceController.text));
    bool beenRegisteredSuccessfully = await _productService.registerProduct(body);
    if(!beenRegisteredSuccessfully) {
      message.showSnackBar(const SnackBar(content: Text("Ocorreu um erro, tente novamente."), backgroundColor: Colors.green,));
      return;
    }
    message.showSnackBar(const SnackBar(content: Text("Produto cadastrado com sucesso!"), backgroundColor: Colors.red,));
  }

}