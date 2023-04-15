import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_clean_arch/config/global/localize/locale/app_localizations.dart';
import 'package:shop_app_with_clean_arch/config/global/theme/app_color/app_color.dart';
import 'package:shop_app_with_clean_arch/config/global/theme/app_color/app_color_dark.dart';
import 'package:shop_app_with_clean_arch/config/global/theme/app_color/app_color_light.dart';
import 'package:shop_app_with_clean_arch/core/services/service_locator.dart';
import 'package:shop_app_with_clean_arch/core/utils/app_icons.dart';
import 'package:shop_app_with_clean_arch/core/utils/component_in_general.dart';
import 'package:shop_app_with_clean_arch/core/utils/enum.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/controller/bloc/shop_bloc.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/controller/bloc/shop_event.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/controller/bloc/shop_state.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeBloc>()..add(GetOrderEvent()),
      child: BlocBuilder<HomeBloc, ShopState>(
        builder: (context, state) => Scaffold(
            appBar: AppBar(
              title: Text(AppLocalizations.of(context)!.translate('order')!),
              leading: IconButton(
                icon: const Icon(AppIcons.back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: state.getOrderState == RequestState.loading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.getOrder.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? AppColorDark.containerColor
                              : AppColorLight.containerColor,
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)!
                                            .translate('orderId')!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(state.getOrder[index].id.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .displaySmall),
                                    ],
                                  ),
                                  Text(state.getOrder[index].date,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge),
                                ],
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                          AppLocalizations.of(context)!
                                              .translate('totalAmount')!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .displaySmall),
                                      Text("${state.getOrder[index].total} LE",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Row(
                                children: [
                                  Text("${state.getOrder[index].status} ",
                                      style: TextStyle(
                                        color: state.getOrder[index].status ==
                                                "New"
                                            ? AppColor.defaultColor
                                            : AppColor.cancelled,
                                      )),
                                  const Spacer(),
                                  Expanded(
                                    child: defaultMaterialButton(
                                        text: AppLocalizations.of(context)!
                                            .translate('cancel')!,
                                        height: 30,
                                        textColor: Colors.white,
                                        fontSize: 12,
                                        onPressed: () {
                                          context.read<HomeBloc>().add(
                                              CancelOrderEvent(
                                                  orderId: state
                                                      .getOrder[index].id));
                                          context
                                              .read<HomeBloc>()
                                              .add(GetOrderEvent());
                                        },
                                        background: AppColor.defaultColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )),
      ),
    );
  }
}
