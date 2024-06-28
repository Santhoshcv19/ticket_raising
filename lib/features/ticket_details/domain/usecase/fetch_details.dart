import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ticket_raising_management/core/errors/failure.dart';
import 'package:ticket_raising_management/core/usecases/usecase.dart';
import 'package:ticket_raising_management/features/ticket_details/domain/repository/repository.dart';

class FetchDetails implements UseCase<Stream<DocumentSnapshot>, String> {
  final TicketDetailsRepository _repository;

  FetchDetails({
    required TicketDetailsRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, Stream<DocumentSnapshot>>> call(String id) async {
    final data = await _repository.fetchDetails(id);
    return data;
  }
}
