import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app_with_clean_arch/config/global/localize/locale/app_localizations.dart';
import 'package:shop_app_with_clean_arch/config/global/theme/app_color/app_color.dart';
import 'package:shop_app_with_clean_arch/config/global/theme/app_color/app_color_light.dart';
import 'package:shop_app_with_clean_arch/core/utils/app_icons.dart';
import 'package:shop_app_with_clean_arch/core/utils/enum.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/favorite_entities/add_favorite.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/controller/bloc/shop_bloc.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/controller/bloc/shop_event.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/controller/bloc/shop_state.dart';


class FavoriteItem extends StatelessWidget {
  final Map<int, bool> favorites;

  const FavoriteItem({
    Key? key,
    this.favorites = const {},
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, ShopState>(
      builder: (context, state) {
        //print('favorite state $state');

        switch (state.favoriteState) {
          case RequestState.loading:
            return const Center(child: CircularProgressIndicator());
          case RequestState.loaded:
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  height: 140,
                  width: double.infinity,
                  child: Stack(children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CachedNetworkImage(
                          height: 140,
                          width: 140,
                          imageUrl: state
                              .getFavorite[index].productItemFavorite!.image!,
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
                        const SizedBox(
                          width: 7,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.getFavorite[index].productItemFavorite!
                                    .name!,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  Text(
                                    '${state.getFavorite[index].productItemFavorite!.price}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  if (state.getFavorite[index]
                                          .productItemFavorite!.discount !=
                                      0)
                                    Text(
                                        '${state.getFavorite[index].productItemFavorite!.oldPrice}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall),
                                  const Spacer(),
                                  FavoriteIconButton(
                                      data: state.getFavorite[index]
                                          .productItemFavorite!,
                                      favorites: favorites),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    if (state
                            .getFavorite[index].productItemFavorite!.discount !=
                        0)
                      Align(
                        alignment: AlignmentDirectional.topStart,
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
                  ]),
                ),
              ),
              separatorBuilder: (context, index) => SizedBox(
                height: 2.h,
              ),
              itemCount: state.getFavorite.length,
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
    required this.data,
    required this.favorites,
  }) : super(key: key);

  final ProductItemFavorite data;
  final Map<int, bool> favorites;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.read<HomeBloc>().add(
              ChangeFavoriteStatusEvent(
                productId: data.id,
                products: favorites,
              ),
            );
        context.read<HomeBloc>().add(
              AddOrRemoveFavoriteProductsEvent(
                data.id,
              ),
            );
      },
      icon: CircleAvatar(
        radius: 15.0.r,
        backgroundColor: AppColor.backgroundFavouriteIcon,
        child: Icon(
          AppIcons.favorite,
          size: 17.0.w,
          color: AppColorLight.favouriteIconColor,
        ),
      ),
    );
  }
}
