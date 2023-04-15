import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_clean_arch/config/global/localize/locale/app_localizations.dart';
import 'package:shop_app_with_clean_arch/config/global/theme/app_color/app_color.dart';
import 'package:shop_app_with_clean_arch/core/services/service_locator.dart';
import 'package:shop_app_with_clean_arch/core/utils/app_strings.dart';
import 'package:shop_app_with_clean_arch/core/utils/component_in_general.dart';
import 'package:shop_app_with_clean_arch/core/utils/enum.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/components/address_components/add_addres_screen.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/components/cart_components/cart_empty.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/components/cart_components/cart_item.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/controller/bloc/shop_bloc.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/controller/bloc/shop_event.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/controller/bloc/shop_state.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<HomeBloc>()..add(GetCartProductEvent()),
        child: BlocConsumer<HomeBloc, ShopState>(listener: (context, state) {
          if (state.addOrRemoveOrder?.status ?? false) {
            customSnakeBar(
                context: context,
                widget: Text(state.addOrRemoveOrder!.message!),
                backgroundColor: AppColor.snackBarSuccess);
            navigateTo(context, AddAddressScreen());
          }
        }, builder: (context, state) {
          return state.cartState == RequestState.loading
              ? const Center(child: CircularProgressIndicator())
              : state.getCart.isEmpty
                  ? const EmptyCart()
                  : Scaffold(
                      bottomNavigationBar: BottomAppBar(
                        height: 205,
                        elevation: .9,
                        child: Padding(
                          padding: const EdgeInsetsDirectional.only(
                              start: 8.0, end: 8, bottom: 4),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context)!
                                    .translate('orderInfo')!,
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                              SizedBox(
                                height: 160,
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        start: 4.0, end: 4, bottom: 8),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              AppLocalizations.of(context)!
                                                  .translate('total')!,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge!,
                                            ),
                                            const Spacer(),
                                            Row(
                                              children: [
                                                Text(
                                                  '${state.updateCartProducts?.total ?? ''} ',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineMedium!,
                                                ),
                                                Text(
                                                  'LE',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineSmall!,
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              AppLocalizations.of(context)!
                                                  .translate('subtotal')!,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge!,
                                            ),
                                            const Spacer(),
                                            Row(
                                              children: [
                                                Text(
                                                  '${state.updateCartProducts?.subTotal ?? ''} ',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineMedium!,
                                                ),
                                                Text(
                                                  'LE',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineSmall!,
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        Container(
                                          width: double.infinity,
                                          decoration: const BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(12),
                                              bottomLeft: Radius.circular(12),
                                            ),
                                          ),
                                          child: MaterialButton(
                                            onPressed: () {
                                              context.read<HomeBloc>().add(
                                                    AddOrRemoveOrderEvent(
                                                      addressId: state
                                                          .addOrRemoveOrder
                                                          .hashCode,
                                                    ),
                                                  );
                                            },
                                            child: Text(
                                              AppLocalizations.of(context)!
                                                  .translate('checkout')!,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineMedium!,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      body: CartItem(
                        favorite: favorites,
                      ));
        }));
  }
}
