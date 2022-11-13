import 'package:fetch_products/controller/prduct_controller.dart';
import 'package:fetch_products/model/product.dart';
import 'package:flutter/material.dart';

class ProductsListPage extends StatefulWidget {
  const ProductsListPage({Key? key}) : super(key: key);

  @override
  State<ProductsListPage> createState() => _ProductsListPageState();
}

class _ProductsListPageState extends State<ProductsListPage> {

  final ProductController productController = ProductController();

  @override
  void initState() {
    productController.fetchProdutcs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Produtos"),),
      backgroundColor: Colors.grey[100],
      body: StreamBuilder<List<Product>>(
        stream: productController.productStream.stream,
        builder: (context, snapshot) {
          if (snapshot.data != null) return productsListView(context, snapshot.data!);
          return const Center(child: CircularProgressIndicator(),);
        },
      ),
    );
  }

  Widget productsListView(BuildContext context, List<Product> productsFromStream){
    return ListView.builder(
      shrinkWrap: true,
      itemCount: productsFromStream.length,
      itemBuilder: (context, index) => productItem(context, productsFromStream[index])
    );
  }

  Widget productItem(BuildContext context, Product product){
    return Container(
      width: double.maxFinite,
      color: Colors.white,
      margin: const EdgeInsets.all(14),
      padding: const EdgeInsets.all(14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(product.name ?? "Nome indisponível", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              const SizedBox(height: 14,),
              Text("${product.number ?? "Quantidade indisponível"}", style: const TextStyle(fontSize: 14),)
            ],
          ),
          Text("${product.price ?? "Valor indisponível"}", style: const TextStyle(fontSize: 14),)
        ],
      ),
    );
  }
}