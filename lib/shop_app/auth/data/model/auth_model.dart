import 'package:shop_app_with_clean_arch/shop_app/auth/data/model/data_model.dart';
import 'package:shop_app_with_clean_arch/shop_app/auth/domain/entities/auth.dart';

class AuthModel extends Auth {
  const AuthModel(
      {required super.status, required super.message, required super.data});

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
      status: json['status'], message: json['message'],
  data: json['data'] != null ? DataModel.fromJson(json['data']) : null,
  );
}
