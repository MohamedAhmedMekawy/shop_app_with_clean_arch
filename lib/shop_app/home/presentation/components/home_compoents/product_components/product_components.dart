import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app_with_clean_arch/config/global/localize/locale/app_localizations.dart';
import 'package:shop_app_with_clean_arch/core/services/service_locator.dart';
import 'package:shop_app_with_clean_arch/core/utils/app_icons.dart';
import 'package:shop_app_with_clean_arch/core/utils/component_in_general.dart';
import 'package:shop_app_with_clean_arch/core/utils/enum.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/product_entities/product.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/components/home_compoents/product_components/product_details.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/controller/bloc/shop_bloc.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/controller/bloc/shop_event.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/controller/bloc/shop_state.dart';

class ProductComponents extends StatelessWidget {
  final Map<int, bool> favorites;
  final Map<int, bool> cart;

  const ProductComponents(
      {Key? key, required this.favorites, required this.cart})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, ShopState>(
      buildWhen: (previous, current) =>
          previous.productShop != current.productShop,
      builder: (context, state) {
        for (var element in state.productShop) {
          favorites.addAll({
            element.id: element.inFavorite,
          });
          cart.addAll({
            element.id: element.inCart,
          });
        }

        switch (state.productState) {
          case RequestState.loading:
            return const SizedBox(
              height: 200,
              child: Center(child: CircularProgressIndicator()),
            );
          case RequestState.loaded:
            return GridView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: state.productShop.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: .42,
                  crossAxisSpacing: .1,
                  mainAxisSpacing: .1),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    navigateTo(
                        context,
                        ProductDetails(
                          favorites: favorites,
                          productId: state.productShop[index].id,
                        ));
                  },
                  child: Transform.translate(
                    offset: Offset(0.0, index.isOdd ? 100 : 0.0),
                    child: Card(
                      elevation: 9,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      shadowColor: Colors.black54,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              if (state.productShop[index].discount != 0)
                                Align(
                                  child: ClipRect(
                                    child: Banner(
                                      message: AppLocalizations.of(context)!
                                          .translate('discount')!,
                                      location: BannerLocation.topStart,
                                      color: Colors.red,
                                      child: const SizedBox(
                                        height: 100,
                                        width: 60,
                                      ),
                                    ),
                                  ),
                                ),
                              const Spacer(),
                              Expanded(
                                child: CartIconButton(
                                    cart: cart,
                                    product: state.productShop[index]),
                              ),
                            ],
                          ),
                          CachedNetworkImage(
                            height: 140,
                            width: 140,
                            imageUrl: state.productShop[index].image,
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) =>
                                    CircularProgressIndicator(
                                        value: downloadProgress.progress),
                            errorWidget: (context, url, error) =>
                                const Icon(AppIcons.error),
                            fit: BoxFit.cover,
                          ),
                          const Spacer(),
                          Text(
                            state.productShop[index].name,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Row(
                            children: [
                              Text(
                                '${state.productShop[index].price.round()}',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              if (state.productShop[index].discount != 0)
                                Text(
                                    '${state.productShop[index].oldPrice.round()}',
                                    style:
                                        Theme.of(context).textTheme.titleSmall),
                              const Spacer(),
                              FavoriteIconButton(
                                  favorites: favorites,
                                  product: state.productShop[index]),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          case RequestState.error:
            return SizedBox(
              height: 400,
              child: Text(state.bannerMessage),
            );
        }
      },
    );
  }
}

class FavoriteIconButton extends StatelessWidget {
  const FavoriteIconButton({
    Key? key,
    required this.favorites,
    required this.product,
  }) : super(key: key);

  final Map<int, bool> favorites;
  final ProductEntities product;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeBloc>(),
      child: BlocBuilder<HomeBloc, ShopState>(
        builder: (context, state) {
          return IconButton(
            icon: favorites[product.id]!
                ? CircleAvatar(
                    radius: 20.0.r,
                    backgroundColor: Colors.blue,
                    child: Icon(
                      AppIcons.favorite,
                      size: 16.0.w,
                      color: Colors.white,
                    ),
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
  final ProductEntities product;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeBloc>(),
      child: BlocBuilder<HomeBloc, ShopState>(
        builder: (context, state) {
          return IconButton(
            alignment: AlignmentDirectional.topStart,
            icon: cart[product.id]!
                ? Icon(
                    Icons.shopping_cart,
                    size: Theme.of(context).iconTheme.size,
                    color: Theme.of(context).iconTheme.color,
                  )
                : Icon(
                    Icons.add_shopping_cart,
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
