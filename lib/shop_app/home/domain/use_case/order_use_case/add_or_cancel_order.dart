import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app_with_clean_arch/core/error/failure.dart';
import 'package:shop_app_with_clean_arch/core/use_case/base_use_case.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/base_repository/base_order_repository.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/order_entities/add_order.dart';

class AddOrRemoveOrderUseCase
    extends BaseUseCase<AddOrderEntities, AddOrRemoveOrderUseCaseParameters> {
  final BaseOrderRepository baseOrderRepository;

  AddOrRemoveOrderUseCase(this.baseOrderRepository);

  @override
  Future<Either<Failure, AddOrderEntities>> call(
      AddOrRemoveOrderUseCaseParameters parameters) async {
    return await baseOrderRepository.addOrCancelOrder(parameters);
  }
}

class AddOrRemoveOrderUseCaseParameters extends Equatable {
  final int addressId;

  const AddOrRemoveOrderUseCaseParameters({
    required this.addressId,
  });

  @override
  List<Object> get props => [addressId];
}
