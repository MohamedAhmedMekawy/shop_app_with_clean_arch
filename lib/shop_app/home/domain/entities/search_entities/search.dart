import 'package:equatable/equatable.dart';

class SearchEntities extends Equatable {
  final int id;
  final double price;
  final String image;
  final String name;
  final bool inFavorite;
  final bool inCart;
  final int? discount;


  const SearchEntities({
    required this.id,
    required this.price,
    required this.image,
    required this.name,
    required this.inFavorite,
    required this.inCart,
    required this.discount,
  });

  @override
  List<Object?> get props =>
      [
        id,
        price,
        image,
        name,
        inFavorite,
        inCart,
        discount
      ];
}
