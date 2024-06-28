import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:ticket_raising_management/core/errors/failure.dart';

abstract class UseCase<Type, Params> {
  /// Callable class method
  Future<Either<Failure, Type>> call(Params params);
}

abstract class UseCaseWithoutFuture<Type, Params> {
  /// Callable class method
  Either<Failure, Type> call(Params params);
}

abstract class UseCaseWithoutFuture1<Type, Params> {
  /// Callable class method
  Either<Failure, Type> call(
      Params params, Map<String, dynamic> data1, Map<String, dynamic> data2);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
