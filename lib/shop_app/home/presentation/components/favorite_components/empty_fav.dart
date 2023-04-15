import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app_with_clean_arch/config/global/localize/locale/app_localizations.dart';

class EmptyFavorite extends StatelessWidget {
  const EmptyFavorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 33, right: 33, top: 75, bottom: 65).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/images/empty favourite.svg'),
              Text(AppLocalizations.of(context)!.translate('emptyFavorite')!,
                  style: Theme.of(context).textTheme.labelMedium!),
            ],
          ),
        ),
      ),
    );
  }
}
