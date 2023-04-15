class ProductEntities {
  final int id;
  final double price;
  final double oldPrice;
  final double discount;
  final String image;
  final String name;
  final bool inCart;
  final bool inFavorite;

  ProductEntities(
      {
        required this.id,
      required this.price,
      required this.oldPrice,
      required this.discount,
      required this.image,
      required this.name,
      required this.inCart,
      required this.inFavorite});
}
