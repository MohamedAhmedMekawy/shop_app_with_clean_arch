import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_clean_arch/config/global/localize/locale/app_localizations.dart';
import 'package:shop_app_with_clean_arch/core/services/service_locator.dart';
import 'package:shop_app_with_clean_arch/core/utils/app_icons.dart';
import 'package:shop_app_with_clean_arch/core/utils/component_in_general.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/search_entities/search.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/components/home_compoents/product_components/product_details.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/controller/bloc/shop_bloc.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/controller/bloc/shop_event.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/controller/bloc/shop_state.dart';

class SearchResult extends StatelessWidget {
  final Map<int, bool> favorites;
  final Map<int, bool> cart;

  const SearchResult({Key? key, required this.favorites, required this.cart})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, ShopState>(
        buildWhen: (previous, current) => previous.search != current.search,
        builder: (context, state) {
          for (var element in state.search) {
            favorites.addAll({
              element.id: element.inFavorite,
            });
            cart.addAll({
              element.id: element.inCart,
            });
          }
          return GridView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: state.search.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: .7,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1),
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      navigateTo(
                          context,
                          ProductDetails(
                            favorites: favorites,
                            productId: state.search[index].id,
                          ));
                    },
                    child: Transform.translate(
                        offset: Offset(0, index.isOdd ? 100 : 0.0),
                        child: Stack(alignment: Alignment.topRight, children: [
                          Card(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  start: 6, end: 6),
                              child: Column(children: [
                                Row(
                                  children: [
                                    if (state.search[index].discount != 0)
                                      Container(
                                        alignment: Alignment.center,
                                        height: 30,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: Colors.red),
                                        child: Text(
                                          AppLocalizations.of(context)!
                                              .translate('discount')!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        ),
                                      ),
                                    Expanded(
                                      child: CartIconButton(
                                          cart: cart,
                                          product: state.search[index]),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: CachedNetworkImage(
                                    imageUrl: state.search[index].image,
                                    progressIndicatorBuilder: (context, url,
                                            downloadProgress) =>
                                        CircularProgressIndicator(
                                            value: downloadProgress.progress),
                                    errorWidget: (context, url, error) =>
                                        const Icon(AppIcons.error),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  state.search[index].name,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                                Row(children: [
                                  Text(
                                    '${state.search[index].price.round()}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall,
                                  ),
                                  const Spacer(),
                                  FavoriteIconButton(
                                      favorites: favorites,
                                      product: state.search[index]),
                                ]),
                              ]),
                            ),
                          )
                        ])));
              });
        });
  }
}

class FavoriteIconButton extends StatelessWidget {
  const FavoriteIconButton({
    Key? key,
    required this.favorites,
    required this.product,
  }) : super(key: key);

  final Map<int, bool> favorites;
  final SearchEntities product;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeBloc>(),
      child: BlocBuilder<HomeBloc, ShopState>(
        builder: (context, state) {
          return IconButton(
            icon: favorites[product.id]!
                ? Icon(
                    AppIcons.favorite,
                    size: Theme.of(context).iconTheme.size,
                    color: Theme.of(context).iconTheme.color,
                  )
                : Icon(
                    AppIcons.favoriteBorder,
                    size: Theme.of(context).iconTheme.size,
                    color: Theme.of(context).iconTheme.color,
                  ),
            onPressed: () {
              context.read<HomeBloc>().add(
                    ChangeFavoriteStatusEvent(
                      productId: product.id,
                      products: favorites,
                    ),
                  );
              context.read<HomeBloc>().add(
                    AddOrRemoveFavoriteProductsEvent(
                      product.id,
                    ),
                  );
            },
          );
        },
      ),
    );
  }
}

class CartIconButton extends StatelessWidget {
  const CartIconButton({
    Key? key,
    required this.cart,
    required this.product,
  }) : super(key: key);

  final Map<int, bool> cart;
  final SearchEntities product;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeBloc>(),
      child: BlocBuilder<HomeBloc, ShopState>(
        builder: (context, state) {
          return IconButton(
            icon: cart[product.id]!
                ? Icon(
                    AppIcons.cart,
                    size: Theme.of(context).iconTheme.size,
                    color: Theme.of(context).iconTheme.color,
                  )
                : Icon(
                    AppIcons.addCart,
                    size: Theme.of(context).iconTheme.size,
                    color: Theme.of(context).iconTheme.color,
                  ),
            onPressed: () {
              context.read<HomeBloc>().add(
                    ChangeCartStatusEvent(
                      productId: product.id,
                      products: cart,
                    ),
                  );
              context.read<HomeBloc>().add(
                    AddOrRemoveCartProductsEvent(
                      product.id,
                    ),
                  );
            },
          );
        },
      ),
    );
  }
}
