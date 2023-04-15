

import 'package:shop_app_with_clean_arch/shop_app/home/data/model/profile_model/sign_out_data_model.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/profile_entities/sign_out.dart';

class SignOutModel extends SignOut {
  const SignOutModel({
    required super.status,
    required super.message,
    required super.signOutData,
  });

  factory SignOutModel.fromJson(Map<String, dynamic> json) {
    return SignOutModel(
      status: json['status'],
      message: json['message'],
      signOutData: SignOutDataModel.fromJson(json['data']),
    );
  }
}
