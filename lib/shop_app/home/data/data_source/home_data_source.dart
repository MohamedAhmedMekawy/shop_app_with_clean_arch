import 'dart:async';
import 'package:shop_app_with_clean_arch/core/api/api_consumer.dart';
import 'package:shop_app_with_clean_arch/core/api/end_point.dart';
import 'package:shop_app_with_clean_arch/core/error/exceptions.dart';
import 'package:shop_app_with_clean_arch/core/network/error_message_model.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/data/model/home_model/banner_model/banner_model.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/data/model/home_model/category_model/categories_model.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/data/model/home_model/product_model/product_details_model.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/data/model/home_model/product_model/product_model.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/data/model/search_model/search_model.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/categories_use_case/categories_details_use_case.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/product_use_case/product_details_use_case.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/search_use_case/search_use_case.dart';

abstract class BaseHomeDataSource {
  Future<List<BannerModel>> getBanner();

  Future<List<CategoriesModel>> getCategories();

  Future<List<ProductModel>> getProduct();

  Future<List<SearchModel>> getSearch(SearchParameters searchParameters);

  Future<List<ProductModel>> getCategoriesDetails(
      CategoriesDetailsParameters categoriesDetailsParameters);

  Future<ProductDetailsModel> getProductDetails(
      ProductDetailsParameters productDetailsParameters);
}

class HomeDataSource extends BaseHomeDataSource {
  final ApiConsumer apiConsumer;

  HomeDataSource(this.apiConsumer);

  @override
  Future<List<BannerModel>> getBanner() async {
    final response = await apiConsumer.get(EndPoints.home);
    return List<BannerModel>.from((response['data']['banners'] as List)
        .map((e) => BannerModel.fromJson(e)));
  }

  @override
  Future<List<CategoriesModel>> getCategories() async {
    final response = await apiConsumer.get(EndPoints.categories);
    return List<CategoriesModel>.from((response['data']['data'] as List)
        .map((e) => CategoriesModel.fromJson(e)));
  }

  @override
  Future<List<ProductModel>> getProduct() async {
    final response = await apiConsumer.get(EndPoints.home);
    return List<ProductModel>.from((response['data']['products'] as List)
        .map((e) => ProductModel.fromJson(e)));
  }

  @override
  Future<List<SearchModel>> getSearch(SearchParameters searchParameters) async {
    final response = await apiConsumer
        .post(EndPoints.search, body: {'text': searchParameters.text});
    if (response['status']) {
      return List<SearchModel>.from((response['data']['data'] as List)
          .map((e) => SearchModel.fromJson(e)));
    } else {
      throw ServiceExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(response));
    }
  }

  @override
  Future<List<ProductModel>> getCategoriesDetails(
      CategoriesDetailsParameters categoriesDetailsParameters) async {
    final response = await apiConsumer
        .get(EndPoints.categoriesDetails(categoriesDetailsParameters.id));

    return List<ProductModel>.from((response['data']['data'] as List)
        .map((e) => ProductModel.fromJson(e)));
  }

  @override
  Future<ProductDetailsModel> getProductDetails(
      ProductDetailsParameters productDetailsParameters) async {
    final response = await apiConsumer
        .get(EndPoints.productDetails(productDetailsParameters.id));
    return ProductDetailsModel.fromJson(response['data']);
  }
}
