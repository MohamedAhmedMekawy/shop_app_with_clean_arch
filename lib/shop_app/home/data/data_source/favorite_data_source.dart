import 'package:shop_app_with_clean_arch/core/api/api_consumer.dart';
import 'package:shop_app_with_clean_arch/core/api/end_point.dart';
import 'package:shop_app_with_clean_arch/core/error/exceptions.dart';
import 'package:shop_app_with_clean_arch/core/network/error_message_model.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/data/model/favorite_model/add_favorite_model.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/data/model/favorite_model/favorite_model.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/favorite_use_case/add_favorite_use_case.dart';

abstract class BaseFavoriteDataSource {
  Future<List<GetFavoriteModel>> getFavoriteItem();

  Future<ProductItemFavoriteModel> addFavorite(
      AddOrRemoveFavoriteParameter addOrRemoveFavoriteParameter);

}
  class FavoriteDataSource extends BaseFavoriteDataSource {
  final ApiConsumer apiConsumer;

  FavoriteDataSource(this.apiConsumer);
  @override
  Future<List<GetFavoriteModel>> getFavoriteItem() async {
    final response = await apiConsumer.get(
        EndPoints.getFavorite
    );
    if(response['status'])
    {
      return List<GetFavoriteModel>.from((response['data']['data']as List).map((e) => GetFavoriteModel.fromJson(e)));
    }else
    {
      throw ServiceExceptions(errorMessageModel: ErrorMessageModel.fromJson(response));
    }
  }

  @override
  Future<ProductItemFavoriteModel> addFavorite(
      AddOrRemoveFavoriteParameter addOrRemoveFavoriteParameter) async {
    final response = await apiConsumer.post(EndPoints.favorites, body: {
      'product_id': addOrRemoveFavoriteParameter.id,
    });
    if (response['status']) {
      return ProductItemFavoriteModel.fromJson(response['data']['product']);
    } else {
      throw ServiceExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(response));
    }
  }
}