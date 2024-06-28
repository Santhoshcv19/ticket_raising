import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ticket_raising_management/core/errors/failure.dart';
import 'package:ticket_raising_management/features/ticket_details/data/datasource/remote_datasource.dart';
import 'package:ticket_raising_management/features/ticket_details/domain/repository/repository.dart';
import 'package:ticket_raising_management/features/ticket_details/domain/usecase/params.dart';

class TicketDetailsRepositoryImpl extends TicketDetailsRepository {
  final TicketDetailsRemoteDatasource _remoteDatasource;

  TicketDetailsRepositoryImpl({
    required TicketDetailsRemoteDatasource remoteDatasource,
  }) : _remoteDatasource = remoteDatasource;

  @override
  Either<Failure, Stream<QuerySnapshot>> fetchTickets() {
    try {
      var data = _remoteDatasource.fetchTickets();
      return Right(data);
    } on FirebaseException catch (e) {
      return Left(InternalFailure(msg: e.message));
    } catch (e) {
      return Left(InternalFailure(msg: '$e'));
    }
  }

  @override
  Future<Either<Failure, Stream<DocumentSnapshot>>> fetchDetails(
    String id,
  ) async {
    try {
      var data = await _remoteDatasource.fetchDetails(id);
      return Right(data);
    } on FirebaseException catch (e) {
      return Left(InternalFailure(msg: e.message));
    } catch (e) {
      return Left(InternalFailure(msg: '$e'));
    }
  }

  @override
  Future<Either<Failure, Map<String, QuerySnapshot>>> fetchAttachments(
    String id,
  ) async {
    try {
      var data = await _remoteDatasource.fetchAttachments(id);
      return Right(data);
    } on FirebaseException catch (e) {
      return Left(InternalFailure(msg: e.message));
    } catch (e) {
      return Left(InternalFailure(msg: '$e'));
    }
  }

  @override
  Future<Either<Failure, Stream<QuerySnapshot>>> fetchComments(
    String id,
  ) async {
    try {
      var data = await _remoteDatasource.fetchComments(id);
      return Right(data);
    } on FirebaseException catch (e) {
      return Left(InternalFailure(msg: e.message));
    } catch (e) {
      return Left(InternalFailure(msg: '$e'));
    }
  }

  @override
  Future<Either<Failure, Stream<QuerySnapshot>>> fetchLogs(
    String id,
  ) async {
    try {
      var data = await _remoteDatasource.fetchLogs(id);
      return Right(data);
    } on FirebaseException catch (e) {
      return Left(InternalFailure(msg: e.message));
    } catch (e) {
      return Left(InternalFailure(msg: '$e'));
    }
  }

  @override
  Future<Either<Failure, Stream<QuerySnapshot>>> fetchChildren(
    String id,
  ) async {
    try {
      var data = await _remoteDatasource.fetchChildren(id);
      return Right(data);
    } on FirebaseException catch (e) {
      return Left(InternalFailure(msg: e.message));
    } catch (e) {
      return Left(InternalFailure(msg: '$e'));
    }
  }

  @override
  Future<Either<Failure, void>> lock(TicketDetailsParams params) async {
    try {
      var data = await _remoteDatasource.lock(params);
      return Right(data);
    } on FirebaseException catch (e) {
      return Left(InternalFailure(msg: e.message));
    } catch (e) {
      return Left(InternalFailure(msg: '$e'));
    }
  }

  @override
  Future<Either<Failure, void>> unLock(String id) async {
    try {
      var data = await _remoteDatasource.unLock(id);
      return Right(data);
    } on FirebaseException catch (e) {
      return Left(InternalFailure(msg: e.message));
    } catch (e) {
      return Left(InternalFailure(msg: '$e'));
    }
  }

  @override
  Future<Either<Failure, void>> updateResolution(
    TicketDetailsParams params,
  ) async {
    try {
      var data = await _remoteDatasource.updateResolution(params);
      return Right(data);
    } on FirebaseException catch (e) {
      return Left(InternalFailure(msg: e.message));
    } catch (e) {
      return Left(InternalFailure(msg: '$e'));
    }
  }

  @override
  Future<Either<Failure, String>> cloneTicket(String id) async {
    try {
      var data = await _remoteDatasource.cloneTicket(id);
      return Right(data);
    } on FirebaseException catch (e) {
      return Left(InternalFailure(msg: e.message));
    } catch (e) {
      return Left(InternalFailure(msg: '$e'));
    }
  }

  @override
  Future<Either<Failure, void>> linkParentChild(
    TicketDetailsParams params,
  ) async {
    try {
      var data = await _remoteDatasource.linkParentChild(params);
      return Right(data);
    } on FirebaseException catch (e) {
      return Left(InternalFailure(msg: e.message));
    } catch (e) {
      return Left(InternalFailure(msg: '$e'));
    }
  }

  @override
  Future<Either<Failure, void>> addComment(TicketDetailsParams params) async {
    try {
      var data = await _remoteDatasource.addComment(params);
      return Right(data);
    } on FirebaseException catch (e) {
      return Left(InternalFailure(msg: e.message));
    } catch (e) {
      return Left(InternalFailure(msg: '$e'));
    }
  }

  @override
  Future<Either<Failure, void>> updateTechAssigned(
    TicketDetailsParams params,
  ) async {
    try {
      var data = await _remoteDatasource.updateTechAssigned(params);
      return Right(data);
    } on FirebaseException catch (e) {
      return Left(InternalFailure(msg: e.message));
    } catch (e) {
      return Left(InternalFailure(msg: '$e'));
    }
  }

  @override
  Future<Either<Failure, void>> sendEmail(TicketDetailsParams params) async {
    try {
      var data = await _remoteDatasource.sendEmail(params);
      return Right(data);
    } on FirebaseException catch (e) {
      return Left(InternalFailure(msg: e.message));
    } catch (e) {
      return Left(InternalFailure(msg: '$e'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteChildren(
      TicketDetailsParams params) async {
    try {
      var data = await _remoteDatasource.deleteChildren(params);
      return Right(data);
    } on FirebaseException catch (e) {
      return Left(InternalFailure(msg: e.message));
    } catch (e) {
      return Left(InternalFailure(msg: '$e'));
    }
  }
}
