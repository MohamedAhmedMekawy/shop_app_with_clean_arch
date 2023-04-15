

import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/profile_entities/sign_out_data.dart';

class SignOutDataModel extends SignOutData {
  const SignOutDataModel({
    required super.id,
    required super.token,
  });

  factory SignOutDataModel.fromJson(Map<String, dynamic> json) {
    return SignOutDataModel(
      id: json['id'],
      token: json['token'],
    );
  }
}
