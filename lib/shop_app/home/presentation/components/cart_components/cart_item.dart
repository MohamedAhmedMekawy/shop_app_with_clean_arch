import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app_with_clean_arch/config/global/theme/app_color/app_color.dart';
import 'package:shop_app_with_clean_arch/core/services/service_locator.dart';
import 'package:shop_app_with_clean_arch/core/utils/app_icons.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/cart_entities/cart_product.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/controller/bloc/shop_bloc.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/controller/bloc/shop_event.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/controller/bloc/shop_state.dart';

class CartItem extends StatelessWidget {
  final Map<int, bool> cart;
  final Map<int, bool> favorite;

  const CartItem({
    Key? key,
    this.cart = const {},
    required this.favorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, ShopState>(
      builder: (context, state) {
        for (var element in state.getCart) {
          favorite.addAll({
            element.id: element.cartProductEntities.inFavorites ?? true,
          });
        }
        return ListView.separated(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  height: 110,
                  width: 110,
                  imageUrl: state.getCart[index].cartProductEntities.image!,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                          value: downloadProgress.progress),
                  errorWidget: (context, url, error) =>
                      const Icon(AppIcons.error),
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              state.getCart[index].cartProductEntities.name!,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                          CartIconButton(
                              cart: cart,
                              product:
                                  state.getCart[index].cartProductEntities),
                        ],
                      ),
                      FavoriteIconButton(
                        product: state.getCart[index].cartProductEntities,
                        favorites: favorite,
                      ),
                      Row(
                        children: [
                          Text(
                            '${state.getCart[index].cartProductEntities.price}',
                            style: const TextStyle(
                                color: Colors.blue, fontSize: 14),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          if (state.getCart[index].cartProductEntities
                                  .discount !=
                              0)
                            Text(
                              '${state.getCart[index].cartProductEntities.oldPrice}',
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10,
                                  decoration: TextDecoration.lineThrough),
                            ),
                          const Spacer(),
                          Row(
                            children: [
                              CounterButton(
                                icon: Icons.remove,
                                color: Colors.grey[200]!,
                                onPressed: () {
                                  int quantity = state.getCart[index].quantity;
                                  if (quantity > 1) {
                                    quantity--;
                                    context.read<HomeBloc>().add(
                                          UpdateCartProductEvent(
                                            cartId: state.getCart[index].id,
                                            quantity: quantity,
                                          ),
                                        );
                                  }
                                },
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Text(
                                '${state.getCart[index].quantity}',
                                style:
                                    Theme.of(context).textTheme.displayLarge!,
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              CounterButton(
                                  icon: Icons.add,
                                  onPressed: () {
                                    int quantity =
                                        state.getCart[index].quantity;
                                    if (quantity <= 7) {
                                      quantity++;
                                      context.read<HomeBloc>().add(
                                            UpdateCartProductEvent(
                                              cartId: state.getCart[index].id,
                                              quantity: quantity,
                                            ),
                                          );
                                    }
                                  },
                                  color: Colors.blueAccent),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          separatorBuilder: (context, index) => SizedBox(
            height: 2.h,
          ),
          itemCount: state.getCart.length,
        );
      },
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
  final CartProductEntities product;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      alignment: Alignment.topRight,
      icon: const Icon(AppIcons.remove),
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
  }
}

class FavoriteIconButton extends StatelessWidget {
  const FavoriteIconButton({
    Key? key,
    required this.favorites,
    required this.product,
  }) : super(key: key);

  final Map<int, bool> favorites;
  final CartProductEntities product;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeBloc>(),
      child: BlocBuilder<HomeBloc, ShopState>(builder: (context, state) {
        return IconButton(
          icon: favorites[product.id] ?? true
              ? CircleAvatar(
                  radius: 20.0.r,
                  backgroundColor: AppColor.backgroundFavouriteIcon,
                  child: Icon(
                    AppIcons.favorite,
                    size: 16.0.w,
                    color: AppColor.white,
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
      }),
    );
  }
}

class CounterButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color color;

  const CounterButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 25.w,
      height: 25.h,
      child: MaterialButton(
        color: color,
        onPressed: onPressed,
        minWidth: 20.w,
        shape: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(8.r),
        ),
        padding: EdgeInsets.zero,
        child: Icon(
          icon,
          size: 17.w,
        ),
      ),
    );
  }
}
