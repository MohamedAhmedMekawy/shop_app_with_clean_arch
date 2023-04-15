import 'package:equatable/equatable.dart';

class GetOrderEntities extends Equatable {
  final int id;
  final dynamic total;
  final String date;
  final String status;

  const GetOrderEntities(
      {required this.id,
      required this.total,
      required this.date,
      required this.status});

  @override
  // TODO: implement props
  List<Object?> get props => [id, total, date, status];
}
