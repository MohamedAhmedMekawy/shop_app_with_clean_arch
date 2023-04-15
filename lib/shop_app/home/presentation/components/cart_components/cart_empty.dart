import 'package:flutter/material.dart';
import 'package:shop_app_with_clean_arch/config/global/localize/locale/app_localizations.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/empty_cart.png'),
          Text(AppLocalizations.of(context)!.translate('emptyCart')!,
              style: Theme.of(context).textTheme.labelMedium!),
        ],
      ),
    );
  }
}
