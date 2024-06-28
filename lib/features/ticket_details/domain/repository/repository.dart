import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ticket_raising_management/core/errors/failure.dart';
import 'package:ticket_raising_management/features/ticket_details/domain/usecase/params.dart';

abstract class TicketDetailsRepository {
  Either<Failure, Stream<QuerySnapshot>> fetchTickets();
  Future<Either<Failure, Stream<DocumentSnapshot>>> fetchDetails(String id);
  Future<Either<Failure, Map<String, QuerySnapshot>>> fetchAttachments(
    String id,
  );
  Future<Either<Failure, Stream<QuerySnapshot>>> fetchComments(String id);
  Future<Either<Failure, Stream<QuerySnapshot>>> fetchLogs(String id);
  Future<Either<Failure, Stream<QuerySnapshot>>> fetchChildren(String id);
  Future<Either<Failure, void>> lock(TicketDetailsParams params);
  Future<Either<Failure, void>> unLock(String id);
  Future<Either<Failure, void>> updateResolution(TicketDetailsParams params);
  Future<Either<Failure, String>> cloneTicket(String id);
  Future<Either<Failure, void>> addComment(TicketDetailsParams params);
  Future<Either<Failure, void>> linkParentChild(TicketDetailsParams params);
  Future<Either<Failure, void>> updateTechAssigned(TicketDetailsParams params);
  Future<Either<Failure, void>> sendEmail(TicketDetailsParams params);
  Future<Either<Failure, void>> deleteChildren(TicketDetailsParams params);
}
