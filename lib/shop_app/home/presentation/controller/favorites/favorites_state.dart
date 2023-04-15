part of 'favorites_bloc.dart';

class FavoritesState extends Equatable {
  final List<Favorite> getFavorite;
  final RequestState favoriteState;
  final String favoriteMessage;
  final ProductItemFavorite? addOrRemoveFavoriteProducts;
  final RequestState addOrRemoveFavoritesState;
  final String addOrRemoveFavoriteErrorMessage;

  const FavoritesState({
    this.getFavorite = const [],
    this.favoriteState = RequestState.loading,
    this.favoriteMessage = '',
    this.addOrRemoveFavoriteProducts,
    this.addOrRemoveFavoritesState = RequestState.loading,
    this.addOrRemoveFavoriteErrorMessage = '',
  });

  @override
  List<Object?> get props {
    return [
      getFavorite,
      favoriteState,
      favoriteMessage,
      addOrRemoveFavoriteProducts,
      addOrRemoveFavoritesState,
      addOrRemoveFavoriteErrorMessage,
    ];
  }

  FavoritesState copyWith({
    List<Favorite>? getFavorite,
    RequestState? favoriteState,
    String? favoriteMessage,
    ProductItemFavorite? addOrRemoveFavoriteProducts,
    RequestState? addOrRemoveFavoritesState,
    String? addOrRemoveFavoriteErrorMessage,
  }) {
    return FavoritesState(
      getFavorite: getFavorite ?? this.getFavorite,
      favoriteState: favoriteState ?? this.favoriteState,
      favoriteMessage: favoriteMessage ?? this.favoriteMessage,
      addOrRemoveFavoriteProducts:
      addOrRemoveFavoriteProducts ?? this.addOrRemoveFavoriteProducts,
      addOrRemoveFavoritesState:
      addOrRemoveFavoritesState ?? this.addOrRemoveFavoritesState,
      addOrRemoveFavoriteErrorMessage: addOrRemoveFavoriteErrorMessage ??
          this.addOrRemoveFavoriteErrorMessage,
    );
  }
}

class ChangeFavoriteStatus extends FavoritesState {}
