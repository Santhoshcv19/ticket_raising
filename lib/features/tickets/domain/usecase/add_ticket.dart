import 'package:dartz/dartz.dart';
import 'package:ticket_raising_management/core/errors/failure.dart';
import 'package:ticket_raising_management/core/usecases/usecase.dart';
import 'package:ticket_raising_management/features/tickets/domain/repository/repository.dart';
import 'package:ticket_raising_management/features/tickets/domain/usecase/params.dart';

class AddTicket implements UseCase<void, TicketParams> {
  final TicketRepository _repository;

  AddTicket({required TicketRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, void>> call(TicketParams params) async {
    final data = await _repository.addTicket(params);
    return data;
  }
}
