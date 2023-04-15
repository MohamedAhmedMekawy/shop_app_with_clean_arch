import 'package:equatable/equatable.dart';

class CartProductEntities extends Equatable {
  final int id;
  final dynamic price;
  final dynamic oldPrice;
  final dynamic discount;
  final String? image;
  final String? name;
  final String? description;
  final bool? inFavorites;
  final bool? inCart;

  const CartProductEntities({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.inFavorites,
    required this.inCart,
  });

  @override
  List<Object?> get props {
    return [
      id,
      price,
      oldPrice,
      discount,
      image,
      name,
      description,
      inFavorites,
      inCart,
    ];
  }
}
