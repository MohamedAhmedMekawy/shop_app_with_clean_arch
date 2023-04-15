import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/categories_entities/categories.dart';

class CategoriesModel extends CategoriesEntities {
  CategoriesModel(
      {required super.id, required super.name, required super.image});

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      CategoriesModel(id: json['id'],
          name: json['name'], image: json['image']);
}
