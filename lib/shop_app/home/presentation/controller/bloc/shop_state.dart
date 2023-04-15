import 'package:equatable/equatable.dart';
import 'package:shop_app_with_clean_arch/core/utils/enum.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/address_entities/add_address_data_entities.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/address_entities/add_address_entities.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/banner_entities/banner.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/cart_entities/cart_item.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/cart_entities/cart_product.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/cart_entities/update.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/categories_entities/categories.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/faqs_entities/faqs.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/favorite_entities/add_favorite.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/favorite_entities/favorite.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/order_entities/add_order.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/order_entities/cancel_orders.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/order_entities/get_order_entities.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/product_entities/product.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/product_entities/product_details.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/profile_entities/change_password.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/profile_entities/get_profile.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/profile_entities/sign_out.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/profile_entities/update_profile.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/search_entities/search.dart';

class ShopState extends Equatable {
  final List<BannerEntities> bannerShop;
  final RequestState bannerState;
  final String bannerMessage;

  final List<SearchEntities> search;
  final RequestState searchState;
  final String searchMessage;

  final List<CategoriesEntities> categoriesShop;
  final RequestState categoriesState;
  final String categoriesMessage;

  final List<ProductEntities> categoriesDetailsShop;
  final RequestState categoriesDetailsState;
  final String categoriesDetailsMessage;

  final List<ProductEntities> productShop;
  final RequestState productState;
  final String productMessage;

  final List<Favorite> getFavorite;
  final RequestState favoriteState;
  final String favoriteMessage;

  final List<CartItemEntities> getCart;
  final RequestState cartState;
  final String cartMessage;

  final ProductItemFavorite? addOrRemoveFavoriteProducts;
  final RequestState addOrRemoveFavoritesState;
  final String addOrRemoveFavoriteErrorMessage;

  final CartProductEntities? addOrRemoveCartProducts;
  final RequestState addOrRemoveCartState;
  final String addOrRemoveCartErrorMessage;

  final ProductDetailsEntities? productDetailsShop;
  final RequestState productDetailsState;
  final String productDetailsMessage;

  final Update? updateCartProducts;
  final RequestState updateCartProductsState;
  final String updateCartProductsErrorMessage;

  final AddOrderEntities? addOrRemoveOrder;
  final RequestState addOrRemoveOrderState;
  final String message;

  final CancelOrder? cancelOrder;
  final RequestState cancelOrderState;
  final String cancelOrderMessage;

  final AddAddressEntities? addAddress;
  final RequestState addAddressState;
  final String addAddressMessage;

  final AddAddressEntities? updateAddress;
  final RequestState updateAddressState;
  final String updateAddressMessage;

  final AddAddressEntities? deleteAddress;
  final RequestState deleteAddressState;
  final String deleteAddressMessage;

  final List<AddAddressEntitiesData> getAddress;
  final RequestState getAddressState;
  final String getAddressMessage;

  final List<GetOrderEntities> getOrder;
  final RequestState getOrderState;
  final String getOrderMessage;

  final GetProfileEntities? getProfile;
  final RequestState getProfileState;
  final String getProfileMessage;

  final UpDateProfileEntities? updateProfile;
  final RequestState updateProfileState;
  final String updateProfileMessage;

  final ChangePassword? changePassword;
  final RequestState changePasswordState;
  final String changePasswordMessage;

  final List<FaqsEntities> getFaqs;
  final RequestState getFaqsState;
  final String getFaqsMessage;

  final SignOut? signOut;
  final RequestState? signOutState;
  final String? signOutErrorMessage;

  const ShopState({
    this.bannerShop = const [],
    this.bannerState = RequestState.loading,
    this.bannerMessage = '',
    this.search = const [],
    this.searchState = RequestState.loading,
    this.searchMessage = '',
    this.categoriesShop = const [],
    this.categoriesState = RequestState.loading,
    this.categoriesMessage = '',
    this.categoriesDetailsShop = const [],
    this.categoriesDetailsState = RequestState.loading,
    this.categoriesDetailsMessage = '',
    this.productShop = const [],
    this.productState = RequestState.loading,
    this.productMessage = '',
    this.productDetailsShop,
    this.productDetailsState = RequestState.loading,
    this.productDetailsMessage = '',
    this.getFavorite = const [],
    this.favoriteState = RequestState.loading,
    this.favoriteMessage = '',
    this.getCart = const [],
    this.cartState = RequestState.loading,
    this.cartMessage = '',
    this.addOrRemoveFavoriteProducts,
    this.addOrRemoveFavoritesState = RequestState.loading,
    this.addOrRemoveFavoriteErrorMessage = '',
    this.addOrRemoveCartProducts,
    this.addOrRemoveCartState = RequestState.loading,
    this.addOrRemoveCartErrorMessage = '',
    this.updateCartProducts,
    this.updateCartProductsState = RequestState.loading,
    this.updateCartProductsErrorMessage = '',
    this.addOrRemoveOrder,
    this.addOrRemoveOrderState = RequestState.loading,
    this.message = '',
    this.cancelOrder,
    this.cancelOrderState = RequestState.loading,
    this.cancelOrderMessage = '',
    this.addAddress,
    this.addAddressState = RequestState.loading,
    this.addAddressMessage = '',
    this.updateAddress,
    this.updateAddressState = RequestState.loading,
    this.updateAddressMessage = '',
    this.deleteAddress,
    this.deleteAddressState = RequestState.loading,
    this.deleteAddressMessage = '',
    this.getAddress = const [],
    this.getAddressState = RequestState.loading,
    this.getAddressMessage = '',
    this.getOrder = const [],
    this.getOrderState = RequestState.loading,
    this.getOrderMessage = '',
    this.getProfile,
    this.getProfileMessage = '',
    this.getProfileState = RequestState.loading,
    this.updateProfile,
    this.updateProfileMessage = '',
    this.updateProfileState = RequestState.loading,
    this.changePassword,
    this.changePasswordMessage = '',
    this.changePasswordState = RequestState.loading,
    this.getFaqs = const [],
    this.getFaqsMessage = '',
    this.getFaqsState = RequestState.loading,
    this.signOut,
    this.signOutState,
    this.signOutErrorMessage,
  });

  ShopState copyWith({
    List<BannerEntities>? bannerShop,
    RequestState? bannerState,
    String? bannerMessage,
    List<SearchEntities>? search,
    RequestState? searchState,
    String? searchMessage,
    List<CategoriesEntities>? categoriesShop,
    RequestState? categoriesState,
    String? categoriesMessage,
    List<ProductEntities>? categoriesDetailsShop,
    RequestState? categoriesDetailsState,
    String? categoriesDetailsMessage,
    List<ProductEntities>? productShop,
    RequestState? productState,
    String? productMessage,
    ProductDetailsEntities? productDetailsShop,
    RequestState? productDetailsState,
    String? productDetailsMessage,
    List<Favorite>? getFavorite,
    RequestState? favoriteState,
    String? favoriteMessage,
    List<CartItemEntities>? getCart,
    RequestState? cartState,
    String? cartMessage,
    ProductItemFavorite? addOrRemoveFavoriteProducts,
    RequestState? addOrRemoveFavoritesState,
    String? addOrRemoveFavoriteErrorMessage,
    CartProductEntities? addOrRemoveCartProducts,
    RequestState? addOrRemoveCartState,
    String? addOrRemoveCartErrorMessage,
    Update? updateCartProducts,
    RequestState? updateCartProductsState,
    String? updateCartProductsErrorMessage,
    AddOrderEntities? addOrRemoveOrder,
    RequestState? addOrRemoveOrderState,
    String? message,
    CancelOrder? cancelOrder,
    RequestState? cancelOrderState,
    String? cancelOrderMessage,
    AddAddressEntities? addAddress,
    RequestState? addAddressState,
    String? addAddressMessage,
    AddAddressEntities? updateAddress,
    RequestState? updateAddressState,
    String? updateAddressMessage,
    AddAddressEntities? deleteAddress,
    RequestState? deleteAddressState,
    String? deleteAddressMessage,
    List<AddAddressEntitiesData>? getAddress,
    RequestState? getAddressState,
    String? getAddressMessage,
    List<GetOrderEntities>? getOrder,
    RequestState? getOrderState,
    String? getOrderMessage,
    GetProfileEntities? getProfile,
    RequestState? getProfileState,
    String? getProfileMessage,
    UpDateProfileEntities? updateProfile,
    RequestState? updateProfileState,
    String? updateProfileMessage,
    ChangePassword? changePassword,
    RequestState? changePasswordState,
    String? changePasswordMessage,
    List<FaqsEntities>? getFaqs,
    RequestState? getFaqsState,
    String? getFaqsMessage,
    SignOut? signOut,
    RequestState? signOutState,
    String? signOutErrorMessage,
  }) {
    return ShopState(
      bannerShop: bannerShop ?? this.bannerShop,
      bannerState: bannerState ?? this.bannerState,
      bannerMessage: bannerMessage ?? this.bannerMessage,
      search: search ?? this.search,
      searchState: searchState ?? this.searchState,
      searchMessage: searchMessage ?? this.searchMessage,
      categoriesShop: categoriesShop ?? this.categoriesShop,
      categoriesState: categoriesState ?? this.categoriesState,
      categoriesMessage: categoriesMessage ?? this.categoriesMessage,
      categoriesDetailsShop:
          categoriesDetailsShop ?? this.categoriesDetailsShop,
      categoriesDetailsState:
          categoriesDetailsState ?? this.categoriesDetailsState,
      categoriesDetailsMessage:
          categoriesDetailsMessage ?? this.categoriesDetailsMessage,
      productShop: productShop ?? this.productShop,
      productState: productState ?? this.productState,
      productMessage: productMessage ?? this.productMessage,
      productDetailsShop: productDetailsShop ?? this.productDetailsShop,
      productDetailsState: productDetailsState ?? this.productDetailsState,
      productDetailsMessage:
          productDetailsMessage ?? this.productDetailsMessage,
      getFavorite: getFavorite ?? this.getFavorite,
      favoriteState: favoriteState ?? this.favoriteState,
      favoriteMessage: favoriteMessage ?? this.favoriteMessage,
      getCart: getCart ?? this.getCart,
      cartState: cartState ?? this.cartState,
      cartMessage: cartMessage ?? this.cartMessage,
      addOrRemoveFavoriteProducts:
          addOrRemoveFavoriteProducts ?? this.addOrRemoveFavoriteProducts,
      addOrRemoveFavoritesState:
          addOrRemoveFavoritesState ?? this.addOrRemoveFavoritesState,
      addOrRemoveFavoriteErrorMessage: addOrRemoveFavoriteErrorMessage ??
          this.addOrRemoveFavoriteErrorMessage,
      addOrRemoveCartProducts:
          addOrRemoveCartProducts ?? this.addOrRemoveCartProducts,
      addOrRemoveCartState: addOrRemoveCartState ?? this.addOrRemoveCartState,
      addOrRemoveCartErrorMessage:
          addOrRemoveCartErrorMessage ?? this.addOrRemoveCartErrorMessage,
      updateCartProducts: updateCartProducts ?? this.updateCartProducts,
      updateCartProductsState:
          updateCartProductsState ?? this.updateCartProductsState,
      updateCartProductsErrorMessage:
          updateCartProductsErrorMessage ?? this.updateCartProductsErrorMessage,
      addOrRemoveOrder: addOrRemoveOrder ?? this.addOrRemoveOrder,
      addOrRemoveOrderState:
          addOrRemoveOrderState ?? this.addOrRemoveOrderState,
      message: message ?? this.message,
      addAddress: addAddress ?? this.addAddress,
      addAddressState: addAddressState ?? this.addAddressState,
      addAddressMessage: addAddressMessage ?? this.addAddressMessage,
      updateAddress: updateAddress ?? this.updateAddress,
      updateAddressState: updateAddressState ?? this.updateAddressState,
      updateAddressMessage: updateAddressMessage ?? this.updateAddressMessage,
      getAddress: getAddress ?? this.getAddress,
      getAddressState: getAddressState ?? this.getAddressState,
      getAddressMessage: getAddressMessage ?? this.getAddressMessage,
      deleteAddress: deleteAddress ?? this.deleteAddress,
      deleteAddressState: deleteAddressState ?? this.deleteAddressState,
      deleteAddressMessage: deleteAddressMessage ?? this.deleteAddressMessage,
      getOrder: getOrder ?? this.getOrder,
      getOrderState: getOrderState ?? this.getOrderState,
      getOrderMessage: getOrderMessage ?? this.getOrderMessage,
      cancelOrder: cancelOrder ?? this.cancelOrder,
      cancelOrderState: cancelOrderState ?? this.cancelOrderState,
      cancelOrderMessage: cancelOrderMessage ?? this.cancelOrderMessage,
      getProfile: getProfile ?? this.getProfile,
      getProfileState: getProfileState ?? this.getProfileState,
      getProfileMessage: getProfileMessage ?? this.getProfileMessage,
      updateProfile: updateProfile ?? this.updateProfile,
      updateProfileState: updateProfileState ?? this.updateProfileState,
      updateProfileMessage: updateProfileMessage ?? this.updateProfileMessage,
      changePassword: changePassword ?? this.changePassword,
      changePasswordState: changePasswordState ?? this.changePasswordState,
      changePasswordMessage:
          changePasswordMessage ?? this.changePasswordMessage,
      getFaqs: getFaqs ?? this.getFaqs,
      getFaqsState: getFaqsState ?? this.getFaqsState,
      getFaqsMessage: getFaqsMessage ?? this.getFaqsMessage,
      signOut: signOut ?? this.signOut,
      signOutState: signOutState ?? this.signOutState,
      signOutErrorMessage: signOutErrorMessage ?? this.signOutErrorMessage,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        bannerShop,
        bannerState,
        bannerMessage,
        search,
        searchState,
        searchMessage,
        categoriesShop,
        categoriesState,
        categoriesMessage,
        productShop,
        productState,
        productMessage,
        productDetailsState,
        productDetailsShop,
        productDetailsMessage,
        getFavorite,
        favoriteState,
        favoriteMessage,
        addOrRemoveFavoriteProducts,
        addOrRemoveFavoritesState,
        addOrRemoveFavoriteErrorMessage,
        getCart,
        cartMessage,
        cartState,
        addOrRemoveCartProducts,
        addOrRemoveCartErrorMessage,
        addOrRemoveCartState,
        updateCartProducts,
        updateCartProductsState,
        updateCartProductsErrorMessage,
        addOrRemoveOrder,
        addOrRemoveOrderState,
        message,
        addAddress,
        addAddressState,
        addAddressMessage,
        getAddress,
        getAddressMessage,
        getAddressMessage,
        updateAddress,
        updateAddressMessage,
        updateAddressState,
        deleteAddress,
        deleteAddressMessage,
        deleteAddressState,
        getOrder,
        getOrderState,
        getOrderMessage,
        cancelOrder,
        cancelOrderState,
        cancelOrderMessage,
        getProfileMessage,
        getProfileState,
        getProfile,
        changePassword,
        changePasswordMessage,
        changePasswordState,
        getFaqsMessage,
        getFaqs,
        getFaqsState,
        signOut,
        signOutState,
        signOutErrorMessage
      ];
}

class ChangeFavoriteStatus extends ShopState {}

class ChangeCartStatus extends ShopState {}

class UpdateProductQuantity extends ShopState {}
