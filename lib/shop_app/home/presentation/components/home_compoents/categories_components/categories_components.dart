import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app_with_clean_arch/core/utils/app_icons.dart';
import 'package:shop_app_with_clean_arch/core/utils/component_in_general.dart';
import 'package:shop_app_with_clean_arch/core/utils/enum.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/components/home_compoents/categories_components/categories_details_components.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/controller/bloc/shop_bloc.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/controller/bloc/shop_state.dart';

class CategoriesComponent extends StatelessWidget {
  final Map<int, bool> favorites;
  final Map<int, bool> cart;

  const CategoriesComponent(
      {Key? key, required this.favorites, required this.cart})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, ShopState>(
      buildWhen: (previous, current) =>
          previous.categoriesShop != current.categoriesShop,
      builder: (context, state) {
        switch (state.categoriesState) {
          case RequestState.loading:
            return const SizedBox(
              height: 157,
              child: Center(child: CircularProgressIndicator()),
            );
          case RequestState.loaded:
            return SizedBox(
              height: 157,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: state.categoriesShop.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    navigateTo(
                        context,
                        CategoriesDetailsScreen(
                          cart: cart,
                          favorites: favorites,
                          id: state.categoriesShop[index].id,
                        ));
                  },
                  child: Column(
                    children: [
                      SizedBox(
                          height: 96.h,
                          width: 108.w,
                          child: CachedNetworkImage(
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            imageUrl: state.categoriesShop[index].image,
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) =>
                                    CircularProgressIndicator(
                                        value: downloadProgress.progress),
                            errorWidget: (context, url, error) =>
                                const Icon(AppIcons.error),
                            fit: BoxFit.cover,
                          )),
                      SizedBox(
                        height: 6.h,
                      ),
                      Expanded(
                        child: Text(
                          state.categoriesShop[index].name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  width: 20,
                ),
              ),
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
