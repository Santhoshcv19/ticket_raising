import 'package:dartz/dartz.dart';
import 'package:ticket_raising_management/core/errors/failure.dart';
import 'package:ticket_raising_management/core/usecases/usecase.dart';
import 'package:ticket_raising_management/features/ticket_details/domain/repository/repository.dart';

class CloneTicket implements UseCase<String, String> {
  final TicketDetailsRepository _repository;

  CloneTicket({
    required TicketDetailsRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, String>> call(String id) async {
    final data = await _repository.cloneTicket(id);
    return data;
  }
}
