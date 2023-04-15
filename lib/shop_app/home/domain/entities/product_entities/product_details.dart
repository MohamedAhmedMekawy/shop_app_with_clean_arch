import 'package:equatable/equatable.dart';

class ProductDetailsEntities extends Equatable {
  final int id;
  final double price;
  final double oldPrice;
  final double discount;
  final String name;
  final String description;
  final List<String> images;
  final bool inCart;
  final bool inFavorite;

  const ProductDetailsEntities({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.name,
    required this.description,
    required this.images,

    required this.inCart,
    required this.inFavorite
  });

  @override
  List<Object?> get props =>
      [
        id,
        price,
        oldPrice,
        discount,
        name,
        description,
        images,
      ];
}
