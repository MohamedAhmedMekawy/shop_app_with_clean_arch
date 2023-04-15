import 'package:dartz/dartz.dart';
import 'package:shop_app_with_clean_arch/core/error/failure.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/banner_entities/banner.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/categories_entities/categories.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/product_entities/product.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/product_entities/product_details.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/search_entities/search.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/categories_use_case/categories_details_use_case.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/product_use_case/product_details_use_case.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/search_use_case/search_use_case.dart';

abstract class BaseHomeRepository {
  Future<Either<Failure, List<BannerEntities>>> getBanner();

  Future<Either<Failure, List<CategoriesEntities>>> getCategories();

  Future<Either<Failure, List<ProductEntities>>> getProducts();

  Future<Either<Failure, List<SearchEntities>>> getSearch(
      SearchParameters searchParameters);

  Future<Either<Failure, List<ProductEntities>>> getDetailsCategories(
      CategoriesDetailsParameters categoriesDetailsParameters);

  Future<Either<Failure, ProductDetailsEntities>> getProductDetails(
      ProductDetailsParameters productDetailsParameters);
}
