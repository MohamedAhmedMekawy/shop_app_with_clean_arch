
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/profile_entities/change_password.dart';

class ChangePasswordModel extends ChangePassword {
  const ChangePasswordModel({
    required super.status,
    required super.message,
  });

  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) {
    return ChangePasswordModel(
      status: json['status'],
      message: json['message'],
    );
  }
}
