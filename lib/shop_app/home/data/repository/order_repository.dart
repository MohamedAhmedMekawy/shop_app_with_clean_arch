import 'package:dartz/dartz.dart';
import 'package:shop_app_with_clean_arch/core/error/exceptions.dart';
import 'package:shop_app_with_clean_arch/core/error/failure.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/data/data_source/order_data_source.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/base_repository/base_order_repository.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/order_entities/add_order.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/order_entities/cancel_orders.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/order_entities/get_order_entities.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/order_use_case/add_or_cancel_order.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/order_use_case/cancel_order_use_case.dart';

class OrderRepository extends BaseOrderRepository {
  final BaseOrderDataSource baseOrderDataSource;

  OrderRepository(this.baseOrderDataSource);

  @override
  Future<Either<Failure, AddOrderEntities>> addOrCancelOrder(
      AddOrRemoveOrderUseCaseParameters parameters) async {
    try {
      final result = await baseOrderDataSource.addOrRemoveOrder(parameters);
      return Right(result);
    } on ServiceExceptions catch (failure) {
      return Left(ServiceFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, List<GetOrderEntities>>> getOrder() async{
    try{
      final result = await baseOrderDataSource.getOrder();
      return Right(result);
    }on ServiceExceptions catch(failure){
      return Left(ServiceFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, CancelOrder>> cancelOrder(CancelOrderParameter parameters)async {
    try{
      final result = await baseOrderDataSource.cancelOrder(parameters);
      return Right(result);
    }on ServiceExceptions catch(failure){
      return Left(ServiceFailure(failure.errorMessageModel.message));
    }
  }
}
