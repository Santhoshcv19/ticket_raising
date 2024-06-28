import 'package:dartz/dartz.dart';
import 'package:ticket_raising_management/core/common/domain/repository/common_repository.dart';
import 'package:ticket_raising_management/core/common/params/status_params.dart';
import 'package:ticket_raising_management/core/errors/failure.dart';
import 'package:ticket_raising_management/core/usecases/usecase.dart';

class ChangeStatus implements UseCase<void, StatusParams> {
  final CommonRepository _repository;

  ChangeStatus({
    required CommonRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, void>> call(StatusParams params) async {
    final data = await _repository.changeStatus(params);
    return data;
  }
}
