import 'package:shop_app_with_clean_arch/core/network/error_message_model.dart';

class ServiceExceptions implements Exception{
  final ErrorMessageModel errorMessageModel;

  ServiceExceptions({required this.errorMessageModel});
}

class LocalExceptions implements Exception{
  final String message;

  LocalExceptions({required this.message});
}