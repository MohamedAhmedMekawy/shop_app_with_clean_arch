import 'package:equatable/equatable.dart';

abstract class AddAddressEntitiesData extends Equatable {
  final String name;
  final String city;
  final String region;
  final String details;
  final String notes;
  final dynamic latitude;
  final dynamic longitude;
  final int id;

  const AddAddressEntitiesData(
      {required this.name,
      required this.city,
      required this.region,
      required this.details,
      required this.notes,
      this.latitude,
      this.longitude,
      required this.id});

  @override
  List<Object?> get props =>
      [id, region, latitude, longitude, details, notes, city, name];
}
