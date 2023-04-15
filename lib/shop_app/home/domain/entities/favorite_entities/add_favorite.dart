import 'package:equatable/equatable.dart';

class ProductItemFavorite extends Equatable {
  final int id;
  final dynamic price;
  final dynamic oldPrice;
  final dynamic discount;
  final String? image;
  final String? name;
  final String? description;

  const ProductItemFavorite({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
  });

  @override
  List<Object?> get props =>
      [
        id,
        price,
        oldPrice,
        discount,
        image,
        name,
        description,
      ];
}
