

import 'package:shop_app_with_clean_arch/core/api/api_consumer.dart';
import 'package:shop_app_with_clean_arch/core/api/end_point.dart';
import 'package:shop_app_with_clean_arch/shop_app/auth/data/model/auth_model.dart';
import 'package:shop_app_with_clean_arch/shop_app/auth/domain/use_case/login_use_case.dart';
import 'package:shop_app_with_clean_arch/shop_app/auth/domain/use_case/register_use_case.dart';

abstract class BaseAuthDataSource{
Future<AuthModel> getLogin(LoginParameter loginParameter);
Future<AuthModel> getRegister(RegisterParameter registerParameter);
}

class AuthDataSource extends BaseAuthDataSource{
 final ApiConsumer apiConsumer;
 AuthDataSource(this.apiConsumer);
  @override
  Future<AuthModel> getLogin(LoginParameter loginParameter) async{
    final response = await apiConsumer.post(
      EndPoints.login,
      queryParameters: loginParameter.data
    );

    return AuthModel.fromJson(response);
  }

  @override
  Future<AuthModel> getRegister(RegisterParameter registerParameter) async{
    final response = await apiConsumer.post(
      EndPoints.register,
      queryParameters: registerParameter.data
    );
    return AuthModel.fromJson(response);
  }
}