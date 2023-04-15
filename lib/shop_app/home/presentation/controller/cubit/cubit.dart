import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/controller/cubit/state.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/screens/cart_screen.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/screens/favourite_screen.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/screens/home_screen.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/screens/settings.dart';
class HomeCubit extends Cubit<HomeState> {


  HomeCubit(): super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;


  String? selectedValue;
  List<Widget> screen = [
     HomeScreen(),
     const FavouriteScreen(),
     const CartScreen(),
    const SettingScreen(),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }

  List<String> dropdown = [
   'ffff',
    'gggg'
  ];
  void dropdownValueChanged(String value){
    value = selectedValue!;
    emit(DropDownState());
  }
  bool expansionIcon = false;
  void changeExpansionIcon(bool value){
    expansionIcon = value;
    emit(ShopLayoutChangeExpansionIconStates());
  }
}
