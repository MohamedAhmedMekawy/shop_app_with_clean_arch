import 'package:flutter/material.dart';
import 'package:shop_app_with_clean_arch/config/global/localize/locale/app_localizations.dart';

class EmptyAddress extends StatelessWidget {
  const EmptyAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/empty_address.png'),
            Text(AppLocalizations.of(context)!.translate('emptyAddress')!,
                style: Theme.of(context).textTheme.labelMedium!),
          ],
        ),
      ),
    );
  }
}
