
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/profile_entities/get_profile.dart';

class GetProfileModel extends GetProfileEntities {
  const GetProfileModel(
      {required super.id,
      required super.name,
      required super.image,
      required super.email,
      required super.phone});

  factory GetProfileModel.fromJson(Map<String, dynamic> json) =>
      GetProfileModel(
          id: json['id'],
          name: json['name'],
          image: json['image'],
          email: json['email'],
          phone: json['phone']);
}
