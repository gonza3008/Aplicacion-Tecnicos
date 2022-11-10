class Product {
  final int id;
  final String name;
  final String description;
  final int price;

  Product(this.id, this.name, this.description, this.price);
}

class CartItem {
  final int id;
  final String name;
  final int price;
  int quantity;

  CartItem(
      {required this.id,
      required this.name,
      required this.price,
      required this.quantity});

  get totalPrice {
    return quantity * price;
  }

  Map<String, dynamic> toMap() {
    //Creo un mapa de mi modelo para despues poder guardar los datos.
    return {
      'id': id,
      'name': name,
      'price': price,
      'quantity': quantity,
    };
  }
}
