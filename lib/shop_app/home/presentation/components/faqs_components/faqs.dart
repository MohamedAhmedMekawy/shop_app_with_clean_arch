import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_clean_arch/core/services/service_locator.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/controller/bloc/shop_bloc.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/controller/bloc/shop_event.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/controller/bloc/shop_state.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/controller/cubit/cubit.dart';

class FaqsComponents extends StatelessWidget {
  const FaqsComponents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeBloc>()..add(GetFaqsEvent()),
      child: BlocBuilder<HomeBloc, ShopState>(builder: (context, state) {
        return ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: ExpansionTile(
                  backgroundColor: Colors.grey[50],
                  iconColor: Colors.blueGrey,
                  tilePadding: const EdgeInsets.symmetric(horizontal: 10),
                  controlAffinity: ListTileControlAffinity.trailing,
                  trailing: HomeCubit.get(context).expansionIcon
                      ? const Icon(Icons.keyboard_arrow_up)
                      : const Icon(Icons.keyboard_arrow_down),
                  title: Row(
                    children: [
                      const Icon(
                        Icons.add_card_outlined,
                        size: 24,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        state.getFaqs[index].question ?? '',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      )
                    ],
                  ),
                  children: [
                    Text(
                      state.getFaqs[index].answer ?? '',
                    )
                  ],
                  onExpansionChanged: (value) {
                    HomeCubit.get(context).changeExpansionIcon(value);
                  },
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
            itemCount: state.getFaqs.length);
      }),
    );
  }
}
