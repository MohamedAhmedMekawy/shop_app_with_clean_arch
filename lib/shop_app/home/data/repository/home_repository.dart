import 'package:dartz/dartz.dart';
import 'package:shop_app_with_clean_arch/core/error/exceptions.dart';
import 'package:shop_app_with_clean_arch/core/error/failure.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/data/data_source/home_data_source.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/base_repository/base_home_repository.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/banner_entities/banner.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/categories_entities/categories.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/product_entities/product.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/product_entities/product_details.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/search_entities/search.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/categories_use_case/categories_details_use_case.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/product_use_case/product_details_use_case.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/search_use_case/search_use_case.dart';

class HomeRepository extends BaseHomeRepository {
  final BaseHomeDataSource baseHomeDataSource;

  HomeRepository(this.baseHomeDataSource);

  @override
  Future<Either<Failure, List<BannerEntities>>> getBanner() async {
    try {
      final result = await baseHomeDataSource.getBanner();
      print(result);
      return Right(result);
    } on ServiceExceptions catch (failure) {
      return Left(ServiceFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, List<CategoriesEntities>>> getCategories() async {
    try {
      final result = await baseHomeDataSource.getCategories();
      return Right(result);
    } on ServiceExceptions catch (failure) {
      return Left(ServiceFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntities>>> getProducts() async {
    try {
      final result = await baseHomeDataSource.getProduct();
      return Right(result);
    } on ServiceExceptions catch (failure) {
      return Left(ServiceFailure(failure.errorMessageModel.message));
    }
  }




  @override
  Future<Either<Failure, List<SearchEntities>>> getSearch(
      SearchParameters searchParameters) async {
    try {
      final result = await baseHomeDataSource.getSearch(searchParameters);
      return Right(result);
    }
    on ServiceExceptions catch (failure) {
      return Left(ServiceFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntities>>> getDetailsCategories(
      CategoriesDetailsParameters categoriesDetailsParameters) async {
    try {
      final result = await baseHomeDataSource.getCategoriesDetails(
          categoriesDetailsParameters);
      return Right(result);
    } on ServiceExceptions catch (failure) {
      return Left(ServiceFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, ProductDetailsEntities>> getProductDetails(
      ProductDetailsParameters productDetailsParameters) async {
    try {
      final result = await baseHomeDataSource.getProductDetails(
          productDetailsParameters);
      return Right(result);
    } on ServiceExceptions catch (failure) {
      return Left(ServiceFailure(failure.errorMessageModel.message));
    }
  }


}