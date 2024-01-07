enum JewType { all, ring, earring, watch, bracelet, pendant, brooch }

class Jew{
  int id;
  String image;
  String name;
  double price;
  int quantity;
  bool isFavorite;
  String description;
  double score;
  JewType type;
  int voter;
  bool cart;

  Jew({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.quantity,
    required this.isFavorite,
    required this.description,
    required this.score,
    required this.type,
    required this.voter,
    required this.cart
  });

  @override
  List<Object?> get props => [id, image, name, price, quantity, isFavorite, description, score, type, voter, cart];
  @override
  int get hashCode => id.hashCode^image.hashCode^name.hashCode^price.hashCode^quantity.hashCode^isFavorite.hashCode^description.hashCode^score.hashCode^type.hashCode^voter.hashCode^cart.hashCode;

  Jew copyWith({
    int? id,
    String? image,
    String? name,
    double? price,
    int? quantity,
    bool? isFavorite,
    String? description,
    double? score,
    JewType? type,
    int? voter,
    bool? cart,
  }) {
    return Jew(
      id: id ?? this.id,
      image: image ?? this.image,
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      isFavorite: isFavorite ?? this.isFavorite,
      description: description ?? this.description,
      score: score ?? this.score,
      type: type ?? this.type,
      voter: voter ?? this.voter,
      cart: cart ?? this.cart,
    );
  }
}
