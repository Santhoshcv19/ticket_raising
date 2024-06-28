import 'package:dartz/dartz.dart';
import 'package:ticket_raising_management/core/errors/failure.dart';
import 'package:ticket_raising_management/core/usecases/usecase.dart';
import 'package:ticket_raising_management/features/ticket_details/domain/repository/repository.dart';

class UnLock implements UseCase<void, String> {
  final TicketDetailsRepository _repository;

  UnLock({
    required TicketDetailsRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, void>> call(String id) async {
    final data = await _repository.unLock(id);
    return data;
  }
}
