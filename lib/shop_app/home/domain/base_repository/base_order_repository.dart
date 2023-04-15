import 'package:dartz/dartz.dart';
import 'package:shop_app_with_clean_arch/core/error/failure.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/order_entities/add_order.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/order_entities/cancel_orders.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/order_entities/get_order_entities.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/order_use_case/add_or_cancel_order.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/order_use_case/cancel_order_use_case.dart';

abstract class BaseOrderRepository{
  Future<Either<Failure, AddOrderEntities>> addOrCancelOrder(AddOrRemoveOrderUseCaseParameters parameters);
  Future<Either<Failure, CancelOrder>> cancelOrder(CancelOrderParameter parameters);
  Future<Either<Failure, List<GetOrderEntities>>> getOrder();
}