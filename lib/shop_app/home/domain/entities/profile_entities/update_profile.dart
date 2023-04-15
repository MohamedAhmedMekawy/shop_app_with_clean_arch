import 'package:equatable/equatable.dart';

class UpDateProfileEntities extends Equatable {
  final String name;
  final String email;
  final String phone;

  const UpDateProfileEntities(
      {required this.name, required this.email, required this.phone});

  @override
  // TODO: implement props
  List<Object?> get props => [name,email,phone];
}
