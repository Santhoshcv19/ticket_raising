import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ticket_raising_management/core/errors/failure.dart';
import 'package:ticket_raising_management/features/tickets/data/datasource/remotedata_source.dart';
import 'package:ticket_raising_management/features/tickets/domain/repository/repository.dart';
import 'package:ticket_raising_management/features/tickets/domain/usecase/params.dart';

class TicketRepositoryImpl extends TicketRepository {
  final TicketRemoteDataSource _remoteDataSource;

  TicketRepositoryImpl({
    required TicketRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  @override
  Either<Failure, Stream<QuerySnapshot>> fetchTickets() {
    try {
      final data = _remoteDataSource.fetchTickets();
      return Right(data);
    } on FirebaseException catch (e) {
      return Left(DatabaseFailure(msg: e.message));
    } catch (e) {
      return Left(InternalFailure(msg: '$e'));
    }
  }

  @override
  Future<Either<Failure, void>> addTicket(TicketParams params) async {
    try {
      final data = await _remoteDataSource.addTicket(params);
      return Right(data);
    } on FirebaseException catch (e) {
      return Left(DatabaseFailure(msg: e.message));
    } catch (e) {
      return Left(InternalFailure(msg: '$e'));
    }
  }

  @override
  Future<Either<Failure, void>> updateTicket(TicketParams params) async {
    try {
      final data = await _remoteDataSource.updateTicket(params);
      return Right(data);
    } on FirebaseException catch (e) {
      return Left(DatabaseFailure(msg: e.message));
    } catch (e) {
      return Left(InternalFailure(msg: '$e'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteTicket(TicketParams params) async {
    try {
      final data = await _remoteDataSource.deleteTicket(params);
      return Right(data);
    } on FirebaseException catch (e) {
      return Left(DatabaseFailure(msg: e.message));
    } catch (e) {
      return Left(InternalFailure(msg: '$e'));
    }
  }
}
