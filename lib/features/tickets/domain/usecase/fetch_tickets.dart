import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ticket_raising_management/core/errors/failure.dart';
import 'package:ticket_raising_management/core/usecases/usecase.dart';
import 'package:ticket_raising_management/features/tickets/domain/repository/repository.dart';

class FetchTickets
    implements UseCaseWithoutFuture<Stream<QuerySnapshot>, NoParams> {
  final TicketRepository _repository;

  FetchTickets({
    required TicketRepository repository,
  }) : _repository = repository;

  @override
  Either<Failure, Stream<QuerySnapshot>> call(NoParams params) {
    final data = _repository.fetchTickets();
    return data;
  }
}
