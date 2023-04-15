
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/faqs_entities/faqs.dart';

class FaqsModel extends FaqsEntities {
  const FaqsModel(
      {required super.id, required super.question, required super.answer});

  factory FaqsModel.fromJson(Map<String, dynamic> json) => FaqsModel(
      id: json['id'], question: json['question'], answer: json['answer']);
}
