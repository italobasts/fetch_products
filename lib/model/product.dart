class Product{

  final int? id;
  String? name;
  int? number;
  double? price;

  Product({this.id, this.name, this.number, this.price});

  factory Product.fromMap(Map map){
    return Product(
      id: map["id"],
      name: map["nome"],
      number: map["quantidade"],
      price: map["valor"]
    );
  }

  Map<String, dynamic> toMap(String nameMap, String numberMap, String priceMap) =>
    { 
      "nome": nameMap,
      "quantidade": numberMap,
      "valor": priceMap,
    };
}