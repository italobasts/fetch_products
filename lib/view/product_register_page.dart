import 'package:fetch_products/controller/prduct_controller.dart';
import 'package:flutter/material.dart';

class RegisterProductPage extends StatefulWidget {
  const RegisterProductPage({Key? key}) : super(key: key);

  @override
  State<RegisterProductPage> createState() => _RegisterProductPageState();
}

class _RegisterProductPageState extends State<RegisterProductPage> {

  final ProductController productController = ProductController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cadastrar produto"),),
      body: ListView(
        padding: const EdgeInsets.all(14),
        children: [
          TextField(
            controller: productController.nameController,
            decoration: const InputDecoration(hintText: "Nome do produto", border: OutlineInputBorder())
          ),
          const SizedBox(height: 14),
          TextField(
            controller: productController.numberController,
            decoration: const InputDecoration(hintText: "Quantidade", border: OutlineInputBorder())
          ),
          const SizedBox(height: 14),
          TextField(
            controller: productController.priceController,
            decoration: const InputDecoration(hintText: "Valor", border: OutlineInputBorder())
          ),
          const SizedBox(height: 14),
          ElevatedButton(
            onPressed: () => productController.registerProduct(ScaffoldMessenger.of(context)),
            style: ElevatedButton.styleFrom(
              primary: Colors.purple[900],
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            ),
            child: const Text("Cadastrar produto", style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}