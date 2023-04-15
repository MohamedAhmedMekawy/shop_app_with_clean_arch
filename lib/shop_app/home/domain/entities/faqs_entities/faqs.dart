import 'package:equatable/equatable.dart';

class FaqsEntities extends Equatable {
  final int? id;
  final String? question;
  final String? answer;

  const FaqsEntities(
      {required this.id, required this.question, required this.answer});

  @override
  // TODO: implement props
  List<Object?> get props => [id, question, answer];
}
