class Grocery {
  final String id;
  final String image;
  final String cardName;

  Grocery({
    required this.id,
    required this.image,
    required this.cardName,
  });

  Grocery copyWith({
    String? id,
    String? image,
    String? cardName,
  }) {
    return Grocery(
      id: id ?? this.id,
      image: image ?? this.image,
      cardName: cardName ?? this.cardName,
    );
  }
}
