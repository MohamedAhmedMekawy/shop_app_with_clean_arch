
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/profile_entities/update_profile.dart';

class UpDateProfileModel extends UpDateProfileEntities {
  const UpDateProfileModel(
      {required super.name, required super.email, required super.phone});

  factory UpDateProfileModel.fromJson(Map<String, dynamic> json) =>
      UpDateProfileModel(
          name: json['name'], email: json['email'], phone: json['phone']);
}
