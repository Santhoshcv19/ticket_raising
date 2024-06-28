import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String? msg;

  const Failure({required this.msg});

  @override
  List<Object?> get props => [msg];

  get message => null;
}

// General failures

class DatabaseFailure extends Failure {
  const DatabaseFailure({super.msg});
}

class InternalFailure extends Failure {
  const InternalFailure({super.msg});
}

class CacheFailure extends Failure {
  const CacheFailure({super.msg});
}
