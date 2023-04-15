import 'package:equatable/equatable.dart';

class AddOrderData extends Equatable {
  final String? paymentMethod;
  final String? date;
  final int? cost;
  final double? vat;
  final int? discount;
  final dynamic total;
  final int id;

  const AddOrderData({
    required this.date,
    required this.paymentMethod,
    required this.cost,
    required this.vat,
    required this.discount,
    required this.total,
    required this.id,
  });

  @override
  List<Object?> get props {
    return [
      paymentMethod,
      cost,
      date,
      vat,
      discount,
      total,
      id,
    ];
  }
}
