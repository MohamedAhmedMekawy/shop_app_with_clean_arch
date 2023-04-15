import 'package:equatable/equatable.dart';

class GetProfileEntities extends Equatable {
  final int id;
  final String name;
  final String image;
  final String email;
  final String phone;

  const GetProfileEntities(
      {required this.id,
      required this.name,
      required this.image,
      required this.email,
      required this.phone});

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, image, email, phone];
}
