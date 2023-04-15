import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_clean_arch/config/global/localize/locale/app_localizations.dart';
import 'package:shop_app_with_clean_arch/core/services/service_locator.dart';
import 'package:shop_app_with_clean_arch/core/utils/app_icons.dart';
import 'package:shop_app_with_clean_arch/core/utils/app_size.dart';
import 'package:shop_app_with_clean_arch/core/utils/component_in_general.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/components/home_compoents/search_components/search_result.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/controller/bloc/shop_bloc.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/controller/bloc/shop_event.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/controller/bloc/shop_state.dart';

class SearchScreen extends StatelessWidget {
  final Map<int, bool> favorites = {};
  final Map<int, bool> cart = {};
  TextEditingController searchController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        body: Form(
          key: formKey,
          child: BlocProvider(
            create: (context) => sl<HomeBloc>(),
            child: BlocBuilder<HomeBloc, ShopState>(
                buildWhen: (previous, current) =>
                    previous.search != current.search,
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsetsDirectional.only(
                        top: 26.0, start: 20, end: 20),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          defaultFormField(
                            controller: searchController,
                            text: AppLocalizations.of(context)!
                                .translate('search')!,
                            prefix: AppIcons.search,
                            borderRadius: AppSize.borderRadiusFormField,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return AppLocalizations.of(context)!
                                    .translate('enterText')!;
                              }
                            },
                            type: TextInputType.text,
                            borderWidth: AppSize.borderWidthFormField,
                            onSubmit: (value) {
                              if (formKey.currentState!.validate()) {
                                context.read<HomeBloc>().add(
                                    SearchProductsEvent(searchController.text));
                              }
                            },
                          ),
                          SearchResult(favorites: favorites, cart: cart),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
