import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ticket_raising_management/core/errors/failure.dart';
import 'package:ticket_raising_management/core/usecases/usecase.dart';
import 'package:ticket_raising_management/features/ticket_details/domain/repository/repository.dart';

class FetchComments implements UseCase<Stream<QuerySnapshot>, String> {
  final TicketDetailsRepository _repository;

  FetchComments({
    required TicketDetailsRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, Stream<QuerySnapshot>>> call(String params) async {
    final data = await _repository.fetchComments(params);
    return data;
  }
}
