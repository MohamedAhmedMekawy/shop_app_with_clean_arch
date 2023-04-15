import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_clean_arch/core/services/service_locator.dart';
import 'package:shop_app_with_clean_arch/core/utils/enum.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/components/favorite_components/empty_fav.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/components/favorite_components/favorite_item.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/controller/bloc/shop_bloc.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/controller/bloc/shop_event.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/controller/bloc/shop_state.dart';

class FavouriteScreen extends StatelessWidget {
  final Map<int, bool> favorites;

  const FavouriteScreen({
    key,
    this.favorites = const {},
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeBloc>()..add(GetFavoriteProductEvent()),
      child: BlocBuilder<HomeBloc, ShopState>(builder: (context, state) {
        return state.favoriteState == RequestState.loading
            ? const Center(child: CircularProgressIndicator())
            : state.getFavorite.isEmpty
                ? const EmptyFavorite()
                : const FavoriteItem();
      }),
    );
  }
}
