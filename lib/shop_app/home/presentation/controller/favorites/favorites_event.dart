part of 'favorites_bloc.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();
  @override
  List<Object> get props => [];
}

class GetFavoriteProductEvents extends FavoritesEvent {}

class AddOrRemoveFavoriteProductsEvents extends FavoritesEvent {
  final int productId;

  const AddOrRemoveFavoriteProductsEvents(this.productId);
  @override
  List<Object> get props => [productId];
}

class ChangeFavoriteStatusEvents extends FavoritesEvent {
  final int productId;
  final Map<int, bool> products;
  const ChangeFavoriteStatusEvents({
    required this.productId,
    required this.products,
  });

  @override
  List<Object> get props => [productId, products];
}
