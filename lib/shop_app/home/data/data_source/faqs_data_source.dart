import 'package:shop_app_with_clean_arch/core/api/api_consumer.dart';
import 'package:shop_app_with_clean_arch/core/api/end_point.dart';
import 'package:shop_app_with_clean_arch/core/error/exceptions.dart';
import 'package:shop_app_with_clean_arch/core/network/error_message_model.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/data/model/faqs_model/faqs.dart';

abstract class BaseFaqsDataSource{
  Future<List<FaqsModel>> getFaqs();
}

class FaqsDataSource extends BaseFaqsDataSource{
  final ApiConsumer apiConsumer;

  FaqsDataSource(this.apiConsumer);
  @override
  Future<List<FaqsModel>> getFaqs()async {
    final response = await apiConsumer.get(
        EndPoints.faqs
    );
   if(response['status']){
     return List<FaqsModel>.from((response['data']['data'] as List).map((e) =>
         FaqsModel.fromJson(response)));
   }else{
     throw ServiceExceptions(errorMessageModel: ErrorMessageModel.fromJson(response));
   }
  }
}