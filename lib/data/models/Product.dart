class Product {
  final String id;
  String id_grocery;
  final String image;
  final String cardName;
  final String? weight;
  int quantity;
  final String? price;

  Product({
    this.id = '1',
    this.id_grocery = '1',
    this.image = '',
    this.cardName = '',
    this.quantity = 1,
    this.price,
    this.weight,
  });

  Product copyWith({
    String? id,
    String? id_grocery,
    String? image,
    String? cardName,
    String? price,
    int? quantity,
    String? weight,
  }) {
    return Product(
      id: id ?? this.id,
      id_grocery: id_grocery ?? this.id_grocery,
      image: image ?? this.image,
      cardName: cardName ?? this.cardName,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      weight: weight ?? this.weight,
    );
  }
}
