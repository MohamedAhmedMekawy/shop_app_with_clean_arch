import 'package:equatable/equatable.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/order_entities/add_order_data.dart';

 class AddOrderEntities extends Equatable {
  final bool? status;
  final String? message;
  final AddOrderData addOrderData;

  const AddOrderEntities(
      {required this.status,
      required this.message,
      required this.addOrderData});

  @override
  List<Object?> get props => [status, message, addOrderData];
}
