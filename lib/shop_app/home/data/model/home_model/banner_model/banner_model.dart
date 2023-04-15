import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/banner_entities/banner.dart';

class BannerModel extends BannerEntities {
  BannerModel({required super.id, required super.image});

  factory BannerModel.fromJson(Map<String, dynamic> json) =>
     BannerModel(id: json['id'], image: json['image']);
}
