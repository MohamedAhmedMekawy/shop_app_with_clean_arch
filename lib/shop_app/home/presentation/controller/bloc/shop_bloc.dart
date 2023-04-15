import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_clean_arch/core/use_case/base_use_case.dart';
import 'package:shop_app_with_clean_arch/core/utils/enum.dart';
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
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/controller/bloc/shop_event.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/controller/bloc/shop_state.dart';

class HomeBloc extends Bloc<HomeEvent, ShopState> {
  AddOrRemoveFavoriteUseCase addOrRemoveFavoriteUseCase;
  BannerUseCase bannerUseCase;
  CategoriesUseCase categoriesUseCase;
  ProductDetailsUseCase productDetailsUseCase;
  ProductUseCase productUseCase;
  CategoriesDetailsUseCase categoriesDetailsUseCase;
  GetFavoriteUseCase getFavoriteUseCase;
  SearchUseCase searchUseCase;
  GetCartUseCase getCartUseCase;
  AddOrRemoveCartUseCase addOrRemoveCartUseCase;
  UpDateCartUseCase upDateCartUseCase;
  AddOrRemoveOrderUseCase addOrRemoveOrderUseCase;
  AddAddressUseCase addAddressUseCase;
  GetAddressUseCase getAddressUseCase;
  UpDateAddress upDateAddressUseCase;
  DeleteAddressUseCase deleteAddressUseCase;
  GetOrder getOrderUseCase;
  CancelOrderUseCase cancelOrderUseCase;
  GetProfileUseCase getProfileUseCase;
  UpDateProfileUseCase upDateProfileUseCase;
  ChangePasswordUseCase changePasswordUseCase;
  FaqsUseCase faqsUseCase;
  SignOutUseCase signOutUseCase;

  HomeBloc(
      this.deleteAddressUseCase,
      this.signOutUseCase,
      this.faqsUseCase,
      this.changePasswordUseCase,
      this.upDateProfileUseCase,
      this.getProfileUseCase,
      this.cancelOrderUseCase,
      this.getOrderUseCase,
      this.upDateAddressUseCase,
      this.getAddressUseCase,
      this.addOrRemoveOrderUseCase,
      this.addAddressUseCase,
      this.upDateCartUseCase,
      this.addOrRemoveCartUseCase,
      this.getCartUseCase,
      this.searchUseCase,
      this.getFavoriteUseCase,
      this.categoriesDetailsUseCase,
      this.addOrRemoveFavoriteUseCase,
      this.bannerUseCase,
      this.categoriesUseCase,
      this.productUseCase,
      this.productDetailsUseCase)
      : super(const ShopState()) {
    on<GetBannerDataEvent>((event, emit) async {
      final result = await bannerUseCase(const NoParameters());
      result.fold(
          (l) => emit(state.copyWith(
                bannerState: RequestState.error,
                bannerMessage: l.message,
              )),
          (r) => emit(
              state.copyWith(bannerState: RequestState.loaded, bannerShop: r)));
    });
    on<SearchProductsEvent>((event, emit) async {
      final result = await searchUseCase(SearchParameters(text: event.title));
      result.fold(
          (l) => emit(state.copyWith(
                searchState: RequestState.error,
                searchMessage: l.message,
              )),
          (r) => emit(
              state.copyWith(searchState: RequestState.loaded, search: r)));
    });
    on<GetCategoriesEvent>((event, emit) async {
      final result = await categoriesUseCase(const NoParameters());
      result.fold(
          (l) => emit(state.copyWith(
              categoriesState: RequestState.error,
              categoriesMessage: l.message)),
          (r) => emit(state.copyWith(
              categoriesShop: r, categoriesState: RequestState.loaded)));
    });
    on<GetCategoryProductsEvent>((event, emit) async {
      final result = await categoriesDetailsUseCase(
          CategoriesDetailsParameters(id: event.id));
      result.fold(
          (l) => emit(state.copyWith(
              categoriesDetailsState: RequestState.error,
              categoriesDetailsMessage: l.message)),
          (r) => emit(state.copyWith(
              categoriesDetailsState: RequestState.loaded,
              categoriesDetailsShop: r)));
    });
    on<GetProductEvent>((event, emit) async {
      final result = await productUseCase(const NoParameters());
      result.fold(
          (l) => emit(state.copyWith(
              productState: RequestState.error, productMessage: l.message)),
          (r) => emit(state.copyWith(
              productShop: r, productState: RequestState.loaded)));
    });
    on<GetProductDetailsEvent>((event, emit) async {
      final result =
          await productDetailsUseCase(ProductDetailsParameters(id: event.id));
      result.fold(
          (l) => emit(state.copyWith(
              productDetailsState: RequestState.error,
              productDetailsMessage: l.message)), (r) {
        emit(state.copyWith(
            productDetailsShop: r, productDetailsState: RequestState.loaded));
        print(r);
      });
    });
    on<GetFavoriteProductEvent>((event, emit) async {
      final result = await getFavoriteUseCase(const NoParameters());
      result.fold(
        (l) {
          emit(state.copyWith(
            favoriteMessage: l.message,
            favoriteState: RequestState.error,
          ));
        },
        (r) {
          emit(state.copyWith(
            getFavorite: r,
            favoriteState: RequestState.loaded,
          ));
        },
      );
    });
    on<AddOrRemoveFavoriteProductsEvent>((event, emit) async {
      final result = await addOrRemoveFavoriteUseCase(
        AddOrRemoveFavoriteParameter(id: event.productId),
      );
      result.fold(
        (l) {
          emit(state.copyWith(
            addOrRemoveFavoriteErrorMessage: l.message,
            addOrRemoveFavoritesState: RequestState.error,
          ));
        },
        (r) {
          emit(state.copyWith(
            addOrRemoveFavoriteProducts: r,
            addOrRemoveFavoritesState: RequestState.loaded,
          ));
        },
      );
      add(GetFavoriteProductEvent());
    });
    on<ChangeFavoriteStatusEvent>((event, emit) async {
      event.products[event.productId] = !event.products[event.productId]!;
      emit(ChangeFavoriteStatus());
    });
    on<GetCartProductEvent>((event, emit) async {
      final result = await getCartUseCase(const NoParameters());
      result.fold(
          (l) => emit(state.copyWith(
              cartMessage: l.message, cartState: RequestState.error)),
          (r) =>
              emit(state.copyWith(getCart: r, cartState: RequestState.loaded)));
    });
    on<AddOrRemoveCartProductsEvent>((event, emit) async {
      final result = await addOrRemoveCartUseCase(
          AddOrRemoveCartParameter(id: event.productId));
      result.fold(
          (l) => emit(state.copyWith(
              addOrRemoveCartErrorMessage: l.message,
              addOrRemoveCartState: RequestState.error)),
          (r) => emit(state.copyWith(
              addOrRemoveCartState: RequestState.loaded,
              addOrRemoveCartProducts: r)));
      add(GetCartProductEvent());
    });
    on<ChangeCartStatusEvent>((event, emit) async {
      event.products[event.productId] = !event.products[event.productId]!;
      emit(ChangeCartStatus());
    });
    on<UpdateCartProductEvent>((event, emit) async {
      emit(state.copyWith(updateCartProductsState: RequestState.loading));

      final result = await upDateCartUseCase(
        UpdateCartParameter(
          cartId: event.cartId,
          quantity: event.quantity,
        ),
      );
      result.fold((l) {
        emit(state.copyWith(
          updateCartProductsErrorMessage: l.message,
          updateCartProductsState: RequestState.error,
        ));
      }, (r) {
        emit(state.copyWith(
          updateCartProducts: r,
          updateCartProductsState: RequestState.loaded,
        ));
        add(GetCartProductEvent());
      });
    });
    on<AddOrRemoveOrderEvent>((event, emit) async {
      final result = await addOrRemoveOrderUseCase(
          AddOrRemoveOrderUseCaseParameters(addressId: event.addressId));
      result.fold(
        (l) => emit(state.copyWith(
            addOrRemoveCartState: RequestState.error, message: l.message)),
        (r) => emit(state.copyWith(
            addOrRemoveOrder: r, addOrRemoveOrderState: RequestState.loaded)),
      );
      print(result);
    });
    on<AddAddressEvent>((event, emit) async {
      final result = await addAddressUseCase(AddAddressParameter(
          name: event.name,
          city: event.city,
          region: event.region,
          details: event.details,
          notes: event.notes));
      result.fold(
          (l) => emit(state.copyWith(
              addAddressState: RequestState.error,
              addAddressMessage: l.message)),
          (r) => emit(state.copyWith(
              addAddress: r, addAddressState: RequestState.loaded)));
      print(result);
    });
    on<GetAddressEvent>((event, emit) async {
      final result = await getAddressUseCase(const NoParameters());
      result.fold(
          (l) => emit(state.copyWith(
              getAddressState: RequestState.error,
              getAddressMessage: l.message)),
          (r) => emit(state.copyWith(
              getAddress: r, getAddressState: RequestState.loaded)));
      print(result);
    });
    on<UpDateAddressEvent>((event, emit) async {
      final result = await upDateAddressUseCase(UpDateAddressParameter(
          addressId: event.addressId,
          name: event.name,
          city: event.city,
          region: event.region,
          details: event.details,
          notes: event.notes));
      result.fold(
          (l) => emit(state.copyWith(
              updateAddressState: RequestState.error,
              updateAddressMessage: l.message)),
          (r) => emit(state.copyWith(
              updateAddress: r, updateAddressState: RequestState.loaded)));
    });
    on<DeleteAddressEvent>((event, emit) async {
      final result =
          await deleteAddressUseCase(DeleteAddressParameter(event.addressId));
      result.fold(
          (l) => emit(state.copyWith(
              deleteAddressMessage: l.message,
              deleteAddressState: RequestState.error)),
          (r) => emit(state.copyWith(
              deleteAddressState: RequestState.loaded, deleteAddress: r)));
    });
    on<GetOrderEvent>((event, emit) async {
      final result = await getOrderUseCase(const NoParameters());
      result.fold(
          (l) => emit(state.copyWith(
              getOrderMessage: l.message, getOrderState: RequestState.error)),
          (r) => emit(
              state.copyWith(getOrderState: RequestState.loaded, getOrder: r)));
    });
    on<CancelOrderEvent>((event, emit) async {
      final result = await cancelOrderUseCase(
          CancelOrderParameter(orderId: event.orderId));
      result.fold(
          (l) => emit(state.copyWith(
                cancelOrderState: RequestState.error,
                cancelOrderMessage: l.message,
              )),
          (r) => emit(state.copyWith(
              cancelOrder: r, cancelOrderState: RequestState.loaded)));
    });
    on<GetProfileEvent>((event, emit) async {
      final result = await getProfileUseCase(const NoParameters());
      result.fold(
          (l) => emit(state.copyWith(
              getProfileState: RequestState.error,
              getProfileMessage: l.message)),
          (r) => emit(state.copyWith(
              getProfile: r, getProfileState: RequestState.loaded)));
    });
    on<UpDateProfileEvent>((event, emit) async {
      final result = await upDateProfileUseCase(UpDateProfileParameter(
          name: event.name, email: event.email, phone: event.phone));
      result.fold(
          (l) => emit(state.copyWith(
              updateProfileMessage: l.message,
              updateProfileState: RequestState.error)),
          (r) => emit(state.copyWith(
              updateProfile: r, updateProfileState: RequestState.loaded)));
    });
    on<ChangePasswordEvent>((event, emit) async {
      final result = await changePasswordUseCase(ChangePasswordParameter(
          currentPassword: event.currentPassword,
          newPassword: event.newPassword));
      result.fold(
          (l) => emit(state.copyWith(
              changePasswordMessage: l.message,
              changePasswordState: RequestState.error)),
          (r) => emit(state.copyWith(
              changePassword: r, changePasswordState: RequestState.loaded)));
    });
    on<GetFaqsEvent>((event, emit) async {
      final result = await faqsUseCase(const NoParameters());
      result.fold(
          (l) => emit(state.copyWith(
              favoriteMessage: l.message, getFaqsState: RequestState.error)),
          (r) {
            emit(
                state.copyWith(getFaqs: r, getFaqsState: RequestState.loaded));
            print(r);
          });
    });
    on<SignOutEvent>((event, emit) async {
      final result =
          await signOutUseCase(SignOutUseCaseParameters(token: event.token));
      result.fold(
          (l) => emit(state.copyWith(
              signOutErrorMessage: l.message,
              signOutState: RequestState.error)),
          (r) => emit(
              state.copyWith(signOutState: RequestState.loaded, signOut: r)));
    });
  }
}
