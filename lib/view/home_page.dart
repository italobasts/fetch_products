import 'package:fetch_products/view/product_register_page.dart';
import 'package:fetch_products/view/products_list_page.dart';
import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home"),),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductsListPage())), 
            child: const Text("Lista de produtos")
          ),
          ElevatedButton(
            onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterProductPage())), 
            child: const Text("Cadastrar produto")
          ),
        ],
      ),
    );
  }
}