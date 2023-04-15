import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app_with_clean_arch/core/error/failure.dart';
import 'package:shop_app_with_clean_arch/core/use_case/base_use_case.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/base_repository/base_order_repository.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/order_entities/cancel_orders.dart';

class CancelOrderUseCase extends BaseUseCase<CancelOrder, CancelOrderParameter>{
  final BaseOrderRepository baseOrderRepository;

  CancelOrderUseCase(this.baseOrderRepository);
  @override
  Future<Either<Failure, CancelOrder>> call(CancelOrderParameter parameters) async{
     return await baseOrderRepository.cancelOrder(parameters);
  }

}

class CancelOrderParameter extends Equatable{
  final int orderId;

  const CancelOrderParameter({required this.orderId});

  @override
  // TODO: implement props
  List<Object?> get props => [orderId];
}