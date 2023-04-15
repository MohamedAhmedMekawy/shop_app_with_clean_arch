import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app_with_clean_arch/config/global/theme/cubit/state.dart';
import 'package:shop_app_with_clean_arch/core/services/service_locator.dart';

class ThemeCubit extends Cubit<ThemeStates>{
  ThemeCubit():super(InitThemeState());
  late CacheHelper cacheHelper;
  bool isDark= false;
  String _isDarkKey= 'isDark';
  static ThemeCubit get(context)=>BlocProvider.of(context);

  Future<void> saveTheme() async {
    cacheHelper = sl<CacheHelper>();
    isDark=cacheHelper.getBoolean(key: _isDarkKey)??false;
    emit(ChangeThemeMode());
  }

  void changeAppTheme(){
    isDark =! isDark;
    cacheHelper.putBoolean(key: _isDarkKey, value: isDark).then((value) {
      emit(ChangeThemeMode());
    });
  }
}
class CacheHelper{
  final SharedPreferences sharedPreferences;
  CacheHelper({required this.sharedPreferences});

  Future<bool>putBoolean ({
    required String key,
    required bool value
  })async{
    return await sharedPreferences.setBool(key, value);
  }
  bool? getBoolean({required String key}){
    return  sharedPreferences.getBool(key);
  }
}