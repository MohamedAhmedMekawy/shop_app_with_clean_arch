import 'package:dartz/dartz.dart';
import 'package:shop_app_with_clean_arch/core/error/failure.dart';
import 'package:shop_app_with_clean_arch/core/use_case/base_use_case.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/base_repository/base_order_repository.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/order_entities/get_order_entities.dart';

class GetOrder extends BaseUseCase<List<GetOrderEntities>, NoParameters> {
  final BaseOrderRepository baseOrderRepository;

  GetOrder(this.baseOrderRepository);

  @override
  Future<Either<Failure, List<GetOrderEntities>>> call(
      NoParameters parameters) async {
    return await baseOrderRepository.getOrder();
  }
}
