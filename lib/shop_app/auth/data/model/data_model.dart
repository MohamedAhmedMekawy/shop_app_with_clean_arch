import 'package:shop_app_with_clean_arch/shop_app/auth/domain/entities/user_data.dart';

class DataModel extends UserData {
  const DataModel({
    required super.id,
    required super.name,
    required super.email,
    required super.phone,
    required super.image,
    required super.points,
    required super.credit,
    required super.token,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      DataModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        image: json['image'],
        points: json['points'],
        credit: json['credit'],
        token: json['token'],
      );
}
