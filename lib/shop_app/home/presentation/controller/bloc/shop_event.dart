import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetBannerDataEvent extends HomeEvent {}

class HomeTapSelect extends HomeEvent {}

class FavoriteTapSelect extends HomeEvent {}

class CartTapSelect extends HomeEvent {}

class SettingsTapSelect extends HomeEvent {}

class GetCategoriesEvent extends HomeEvent {}

class GetProductEvent extends HomeEvent {}

class GetOrderEvent extends HomeEvent {}

class GetCategoryProductsEvent extends HomeEvent {
  final int id;

  const GetCategoryProductsEvent(this.id);

  @override
  List<Object> get props => [id];
}

class GetProductDetailsEvent extends HomeEvent {
  final int id;

  const GetProductDetailsEvent(this.id);
}

class SearchProductsEvent extends HomeEvent {
  final String title;

  const SearchProductsEvent(this.title);

  @override
  List<Object> get props => [title];
}

class GetFavoriteProductEvent extends HomeEvent {}

class AddOrRemoveFavoriteProductsEvent extends HomeEvent {
  final int productId;

  const AddOrRemoveFavoriteProductsEvent(this.productId);

  @override
  List<Object> get props => [productId];
}

class ChangeFavoriteStatusEvent extends HomeEvent {
  final int productId;
  final Map<int, bool> products;

  const ChangeFavoriteStatusEvent({
    required this.productId,
    required this.products,
  });

  @override
  List<Object> get props => [productId, products];
}

class GetCartProductEvent extends HomeEvent {}

class AddOrRemoveCartProductsEvent extends HomeEvent {
  final int productId;

  const AddOrRemoveCartProductsEvent(this.productId);

  @override
  List<Object> get props => [productId];
}

class ChangeCartStatusEvent extends HomeEvent {
  final int productId;
  final Map<int, bool> products;

  const ChangeCartStatusEvent({
    required this.productId,
    required this.products,
  });

  @override
  List<Object> get props => [productId, products];
}

class UpdateCartProductEvent extends HomeEvent {
  final int cartId;
  final int quantity;

  const UpdateCartProductEvent({
    required this.cartId,
    required this.quantity,
  });
}

class AddOrRemoveOrderEvent extends HomeEvent {
  final int addressId;

  const AddOrRemoveOrderEvent({required this.addressId});

  @override
  List<Object> get props => [addressId];
}

class CancelOrderEvent extends HomeEvent {
  final int orderId;

  const CancelOrderEvent({required this.orderId});

  @override
  List<Object> get props => [orderId];
}

class AddAddressEvent extends HomeEvent {
  final String name;
  final String city;
  final String region;
  final String details;
  final String notes;

  const AddAddressEvent({
    required this.name,
    required this.city,
    required this.region,
    required this.details,
    required this.notes,
  });
}

class UpDateAddressEvent extends HomeEvent {
  final int addressId;
  final String name;
  final String city;
  final String region;
  final String details;
  final String notes;

  const UpDateAddressEvent({
    required this.addressId,
    required this.name,
    required this.city,
    required this.region,
    required this.details,
    required this.notes,
  });
}

class GetAddressEvent extends HomeEvent {}

class DeleteAddressEvent extends HomeEvent {
  final int addressId;

  const DeleteAddressEvent(this.addressId);
}

class GetProfileEvent extends HomeEvent {}

class UpDateProfileEvent extends HomeEvent {
  final String name;
  final String email;
  final String phone;

  const UpDateProfileEvent(
      {required this.name, required this.email, required this.phone});
}


class ChangePasswordEvent extends HomeEvent {
  final String currentPassword;
  final String newPassword;

  const ChangePasswordEvent({
    required this.currentPassword,
    required this.newPassword,
  });
}

class GetFaqsEvent extends HomeEvent {}



class SignOutEvent extends HomeEvent {
  final String token;
  const SignOutEvent({
    required this.token,
  });
}