import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_clean_arch/core/services/service_locator.dart';
import 'package:shop_app_with_clean_arch/core/utils/app_strings.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/components/home_compoents/banner_components/banner_components.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/components/home_compoents/categories_components/categories_components.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/components/home_compoents/product_components/product_components.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/components/home_compoents/search_components/search_component.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/controller/bloc/shop_bloc.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/controller/bloc/shop_event.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/controller/bloc/shop_state.dart';

class HomeScreen extends StatelessWidget {
  final Map<int, bool> cart = {};

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeBloc>()
        ..add(GetProductEvent())
        ..add(GetBannerDataEvent())
        ..add(GetCategoriesEvent()),
      child: BlocBuilder<HomeBloc, ShopState>(builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsetsDirectional.only(
                  start: 10.0, end: 10, top: 5),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const SearchComponent(),
                    const SizedBox(
                      height: 20,
                    ),
                    const BannerComponents(),
                    const SizedBox(
                      height: 30,
                    ),
                    CategoriesComponent(
                      favorites: favorites,
                      cart: cart,
                    ),
                    ProductComponents(
                      favorites: favorites,
                      cart: cart,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
