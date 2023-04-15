import 'package:shop_app_with_clean_arch/core/api/api_consumer.dart';
import 'package:shop_app_with_clean_arch/core/api/end_point.dart';
import 'package:shop_app_with_clean_arch/core/error/exceptions.dart';
import 'package:shop_app_with_clean_arch/core/network/error_message_model.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/data/model/profile_model/change_password_model.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/data/model/profile_model/get_profile_model.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/data/model/profile_model/sing_out_model.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/data/model/profile_model/update_model.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/profile_use_case/change_use_case.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/profile_use_case/sign_out_usecase.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/profile_use_case/update_profile_use_case.dart';

abstract class BaseProfileDataSource{
  Future<GetProfileModel> getProfile();
  Future<UpDateProfileModel> updateProfile(UpDateProfileParameter parameter);
  Future<ChangePasswordModel> changePassword(ChangePasswordParameter parameter);
  Future<SignOutModel> signOut(SignOutUseCaseParameters parameters);

}
class ProfileDataSource extends BaseProfileDataSource{
  final ApiConsumer apiConsumer;

  ProfileDataSource(this.apiConsumer);

  @override
  Future<GetProfileModel> getProfile() async{
   final response = await apiConsumer.get(
     EndPoints.profile
   );
   if(response['status']){
    return GetProfileModel.fromJson(response['data']);
   }else{
     throw ServiceExceptions(errorMessageModel: ErrorMessageModel.fromJson(response));
   }
  }

  @override
  Future<UpDateProfileModel> updateProfile(UpDateProfileParameter parameter)async {
    final response = await apiConsumer.put(
      EndPoints.updateProfile,
      body: {
        'name': parameter.name,
        'phone': parameter.phone,
        'email': parameter.email,
      },
    );
    if(response['status']){
      return UpDateProfileModel.fromJson(response['data']);
    } else{
      throw ServiceExceptions(errorMessageModel: ErrorMessageModel.fromJson(response));
    }
  }

  @override
  Future<ChangePasswordModel> changePassword(ChangePasswordParameter parameter)async {
    final response = await apiConsumer.post(
      EndPoints.changePassword,
      body: {
        'current_password': parameter.currentPassword,
        'new_password': parameter.newPassword,
      }
    );
    if(response['status']){
      return ChangePasswordModel.fromJson(response);
    } else{
      throw ServiceExceptions(errorMessageModel: ErrorMessageModel.fromJson(response));
    }
  }

  @override
  Future<SignOutModel> signOut(SignOutUseCaseParameters parameters)async {
   final response = await apiConsumer.post(
     EndPoints.logout,
     body: {
       'fcm_token': parameters.token,
     }
   );
   if(response['status']){
     return SignOutModel.fromJson(response);
   } else{
     throw ServiceExceptions(errorMessageModel: ErrorMessageModel.fromJson(response));
   }
  }
}