import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_clean_arch/core/use_case/base_use_case.dart';
import 'package:shop_app_with_clean_arch/core/utils/enum.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/favorite_entities/add_favorite.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/favorite_entities/favorite.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/favorite_use_case/add_favorite_use_case.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/favorite_use_case/get_favorite_use_case.dart';
part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  AddOrRemoveFavoriteUseCase addOrRemoveFavoriteUseCase;
  GetFavoriteUseCase getFavoriteUseCase;

  FavoritesBloc(
    this.addOrRemoveFavoriteUseCase,this.getFavoriteUseCase
  ) : super(const FavoritesState()) {
    on<GetFavoriteProductEvents>(_getFavoriteProducts);
    on<AddOrRemoveFavoriteProductsEvents>(_addOrRemoveProducts);
    on<ChangeFavoriteStatusEvents>(_changeFavoritesStatus);
  }

  FutureOr<void> _getFavoriteProducts(
      FavoritesEvent event,
      Emitter<FavoritesState> emit,
      ) async {
    final result = await getFavoriteUseCase(const NoParameters());
    result.fold(
          (l) {
        emit(state.copyWith(
          favoriteMessage: l.message,
          favoriteState: RequestState.error,
        ));
      },
          (r) {
        emit(state.copyWith(
          getFavorite: r,
          favoriteState: RequestState.loaded,
        ));
      },
    );
  }

  FutureOr<void> _addOrRemoveProducts(
      AddOrRemoveFavoriteProductsEvents event,
      Emitter<FavoritesState> emit,
      ) async {
    final result = await addOrRemoveFavoriteUseCase(
      AddOrRemoveFavoriteParameter(id:event.productId),
    );
    result.fold(
          (l) {
        emit(state.copyWith(
          addOrRemoveFavoriteErrorMessage: l.message,
          addOrRemoveFavoritesState: RequestState.error,
        ));
      },
          (r) {
        emit(state.copyWith(
          addOrRemoveFavoriteProducts: r,
          addOrRemoveFavoritesState: RequestState.loaded,
        ));
      },
    );
    add(GetFavoriteProductEvents());
  }

  FutureOr<void> _changeFavoritesStatus(
      ChangeFavoriteStatusEvents event,
      Emitter<FavoritesState> emit,
      ) async {
    event.products[event.productId] = !event.products[event.productId]!;
    emit(ChangeFavoriteStatus());
  }
}
