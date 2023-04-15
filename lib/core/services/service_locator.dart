import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app_with_clean_arch/config/global/localize/localization/data/data_source/lang_locale_data_source.dart';
import 'package:shop_app_with_clean_arch/config/global/localize/localization/data/repository/lang_repository.dart';
import 'package:shop_app_with_clean_arch/config/global/localize/localization/domain/repository/base_lang_repository.dart';
import 'package:shop_app_with_clean_arch/config/global/localize/localization/domain/use_case/change_lang_use_case.dart';
import 'package:shop_app_with_clean_arch/config/global/localize/localization/domain/use_case/save_lang.dart';
import 'package:shop_app_with_clean_arch/config/global/localize/localization/presentation/controller/locale_cubit.dart';
import 'package:shop_app_with_clean_arch/config/global/theme/cubit/cubit.dart';
import 'package:shop_app_with_clean_arch/core/api/api_consumer.dart';
import 'package:shop_app_with_clean_arch/core/api/app_interceptor.dart';
import 'package:shop_app_with_clean_arch/core/api/dio_consumer.dart';
import 'package:shop_app_with_clean_arch/shop_app/auth/data/data_source/auth_data_source.dart';
import 'package:shop_app_with_clean_arch/shop_app/auth/data/repository/auth_repository.dart';
import 'package:shop_app_with_clean_arch/shop_app/auth/domain/repository/base_auth_repository.dart';
import 'package:shop_app_with_clean_arch/shop_app/auth/domain/use_case/login_use_case.dart';
import 'package:shop_app_with_clean_arch/shop_app/auth/domain/use_case/register_use_case.dart';
import 'package:shop_app_with_clean_arch/shop_app/auth/presentation/controller/login_bloc.dart';
import 'package:shop_app_with_clean_arch/shop_app/auth/presentation/controller/register_cubit.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/data/data_source/add_address_data_source.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/data/data_source/cart_data_source.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/data/data_source/faqs_data_source.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/data/data_source/favorite_data_source.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/data/data_source/home_data_source.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/data/data_source/order_data_source.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/data/data_source/profile_data_source.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/data/repository/address_repository.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/data/repository/cart_repository.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/data/repository/faqs_repository.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/data/repository/favorite_repository.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/data/repository/home_repository.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/data/repository/order_repository.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/data/repository/profile_repository.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/base_repository/base_address_repository.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/base_repository/base_cart_repository.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/base_repository/base_faqs_repository.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/base_repository/base_favorite_repository.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/base_repository/base_home_repository.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/base_repository/base_order_repository.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/base_repository/base_profile_repository.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/address_use_case/add_address_use_case.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/address_use_case/delete_address.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/address_use_case/get_address.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/address_use_case/update_address.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/banner_use_case/banner_home_use_case.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/cart_use_case/add_cart_use_case.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/cart_use_case/add_or_remove_cart.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/cart_use_case/update_cart.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/categories_use_case/categories_details_use_case.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/categories_use_case/categories_use_case.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/faqs_use_case/faqs.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/favorite_use_case/add_favorite_use_case.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/favorite_use_case/get_favorite_use_case.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/order_use_case/add_or_cancel_order.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/order_use_case/cancel_order_use_case.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/order_use_case/get_order.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/product_use_case/product_details_use_case.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/product_use_case/products_use_case.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/profile_use_case/change_use_case.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/profile_use_case/get_profile_use_case.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/profile_use_case/sign_out_usecase.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/profile_use_case/update_profile_use_case.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/search_use_case/search_use_case.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/controller/bloc/shop_bloc.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/controller/cubit/cubit.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/controller/favorites/favorites_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  Future<void> init() async {
    // Blocs
    sl.registerFactory(() => LoginCubit(sl()));
    sl.registerFactory(() => RegisterCubit(sl()));
    sl.registerFactory(
        () => HomeCubit());
    sl.registerFactory(() => HomeBloc(sl(), sl(), sl(), sl(), sl(), sl(), sl(),
        sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl(),sl(),sl(),sl(),sl(),sl(),sl()));
    sl.registerFactory(() => FavoritesBloc(sl(), sl()));

    sl.registerFactory(() => ThemeCubit());
    sl.registerFactory<LocaleCubit>(
        () => LocaleCubit(getSavedLangUseCase: sl(), changeLangUseCase: sl()));

    sl.registerLazySingleton(() => LoginUseCase(sl()));
    sl.registerLazySingleton(() => RegisterUseCase(sl()));
    sl.registerLazySingleton(() => BannerUseCase(sl()));
    sl.registerLazySingleton(() => CategoriesUseCase(sl()));
    sl.registerLazySingleton(() => ProductUseCase(sl()));
    sl.registerLazySingleton(() => AddOrRemoveFavoriteUseCase(sl()));
    sl.registerLazySingleton(() => GetCartUseCase(sl()));
    sl.registerLazySingleton(() => SearchUseCase(sl()));
    sl.registerLazySingleton(() => CategoriesDetailsUseCase(sl()));
    sl.registerLazySingleton(() => ProductDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetFavoriteUseCase(sl()));
    sl.registerLazySingleton(() => AddOrRemoveCartUseCase(sl()));
    sl.registerLazySingleton(() => UpDateCartUseCase(sl()));
    sl.registerLazySingleton(() => AddOrRemoveOrderUseCase(sl()));
    sl.registerLazySingleton(() => AddAddressUseCase(sl()));
    sl.registerLazySingleton(() => GetAddressUseCase(sl()));
    sl.registerLazySingleton(() => UpDateAddress(sl()));
    sl.registerLazySingleton(() => DeleteAddressUseCase(sl()));
    sl.registerLazySingleton(() => GetOrder(sl()));
    sl.registerLazySingleton(() => CancelOrderUseCase(sl()));
    sl.registerLazySingleton(() => GetProfileUseCase(sl()));
    sl.registerLazySingleton(() => UpDateProfileUseCase(sl()));
    sl.registerLazySingleton(() => ChangePasswordUseCase(sl()));
    sl.registerLazySingleton(() => FaqsUseCase(sl()));
    sl.registerLazySingleton(() => SignOutUseCase(sl()));

    sl.registerLazySingleton<GetSavedLangUseCase>(
        () => GetSavedLangUseCase(langRepository: sl()));
    sl.registerLazySingleton<ChangeLangUseCase>(
        () => ChangeLangUseCase(langRepository: sl()));

    sl.registerLazySingleton<BaseAuthRepository>(() => AuthRepository(sl()));
    sl.registerLazySingleton<BaseHomeRepository>(() => HomeRepository(sl()));
    sl.registerLazySingleton<BaseCartRepository>(() => CartRepository(sl()));
    sl.registerLazySingleton<BaseFavoriteRepository>(
        () => FavoriteRepository(sl()));
    sl.registerLazySingleton<BaseOrderRepository>(() => OrderRepository(sl()));
    sl.registerLazySingleton<BaseAddressRepository>(
        () => AddressRepository(sl()));
    sl.registerLazySingleton<BaseFaqsRepository>(
        () => FaqsRepository(sl()));
    sl.registerLazySingleton<BaseProfileRepository>(
        () => ProfileRepository(sl()));
    sl.registerLazySingleton<LangRepository>(
        () => LangRepositoryImpl(langLocalDataSource: sl()));

    sl.registerLazySingleton<BaseAuthDataSource>(() => AuthDataSource(sl()));
    sl.registerLazySingleton<BaseHomeDataSource>(() => HomeDataSource(sl()));
    sl.registerLazySingleton<BaseCartDataSource>(() => CartDataSource(sl()));
    sl.registerLazySingleton<BaseFavoriteDataSource>(
        () => FavoriteDataSource(sl()));
    sl.registerLazySingleton<BaseOrderDataSource>(() => OrderDataSource(sl()));
    sl.registerLazySingleton<BaseAddAddressDataSource>(
        () => AddAddressDataSource(sl()));
    sl.registerLazySingleton<BaseProfileDataSource>(
        () => ProfileDataSource(sl()));
    sl.registerLazySingleton<BaseFaqsDataSource>(
        () => FaqsDataSource(sl()));
    sl.registerLazySingleton<LangLocalDataSource>(
        () => LangLocalDataSourceImpl(sharedPreferences: sl()));
    sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));
    sl.registerLazySingleton(() => AppIntercepters(sl()));
    sl.registerLazySingleton(() => LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        error: true));
    sl.registerLazySingleton(() => Dio());

    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton(() => sharedPreferences);
    final cacheHelper = CacheHelper(sharedPreferences: sl());
    sl.registerLazySingleton(() => cacheHelper);
  }
}
