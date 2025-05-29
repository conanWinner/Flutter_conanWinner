class Product {
  final String id;
  final String image;
  final String cardName;
  final String? weight;
  int quantity;
  final String? price;

  Product({
    required this.id,
    required this.image,
    required this.cardName,
    this.quantity = 1,
    this.price,
    this.weight,
  });

  Product copyWith({
    String? id,
    String? image,
    String? cardName,
    String? price,
    int? quantity,
    String? weight,
  }) {
    return Product(
      id: id ?? this.id,
      image: image ?? this.image,
      cardName: cardName ?? this.cardName,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      weight: weight ?? this.weight,
    );
  }
}
