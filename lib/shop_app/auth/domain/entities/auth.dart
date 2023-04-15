import 'package:equatable/equatable.dart';
import 'package:shop_app_with_clean_arch/shop_app/auth/domain/entities/user_data.dart';

class Auth extends Equatable {
  final bool status;
  final String message;
  final UserData? data;

  const Auth(
      {required this.status, required this.message, required this.data});

  @override
  // TODO: implement props
  List<Object?> get props => [status, message, data];
}
