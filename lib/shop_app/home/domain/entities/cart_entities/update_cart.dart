import 'package:equatable/equatable.dart';

class UpdateCart extends Equatable
{
 final int id;
 final dynamic quantity;


  const UpdateCart({required this.id, required this.quantity});

  @override
  List<Object?> get props =>
      [
        quantity,
        id
      ];


}