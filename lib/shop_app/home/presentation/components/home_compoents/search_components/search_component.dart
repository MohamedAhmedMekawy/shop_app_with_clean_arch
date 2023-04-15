import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app_with_clean_arch/config/global/localize/locale/app_localizations.dart';
import 'package:shop_app_with_clean_arch/config/global/theme/app_color/app_color.dart';
import 'package:shop_app_with_clean_arch/core/utils/app_icons.dart';
import 'package:shop_app_with_clean_arch/core/utils/component_in_general.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/components/home_compoents/search_components/search_screen_component.dart';


class SearchComponent extends StatelessWidget {
  const SearchComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateTo(context, SearchScreen());
      },
      child: Container(
        width: 300.h,
        height: 42.h,
        decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(24.r),
            boxShadow: const [
              BoxShadow(
                  offset: Offset(1, 1),
                  blurRadius: 6,
                  color: Color(0xffbeb198)),
            ]),
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 20).r,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Theme(
                data: ThemeData(
                    iconTheme: const IconThemeData(color: Colors.black)),
                child: const Icon(
                  AppIcons.search,
                ),
              ),
              SizedBox(
                width: 18.w,
              ),
              Text(
                AppLocalizations.of(context)!.translate('search')!,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
