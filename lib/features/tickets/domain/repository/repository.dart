import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ticket_raising_management/core/errors/failure.dart';
import 'package:ticket_raising_management/features/tickets/domain/usecase/params.dart';

abstract class TicketRepository {
  Either<Failure, Stream<QuerySnapshot>> fetchTickets();
  Future<Either<Failure, void>> addTicket(TicketParams params);
  Future<Either<Failure, void>> updateTicket(TicketParams params);
  Future<Either<Failure, void>> deleteTicket(TicketParams params);
}
