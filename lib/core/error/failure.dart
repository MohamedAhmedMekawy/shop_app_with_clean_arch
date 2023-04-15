import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

class ServiceFailure extends Failure {
  const ServiceFailure(super.message);
}

class LocalFailure extends Failure {
  const LocalFailure(super.message);
}
