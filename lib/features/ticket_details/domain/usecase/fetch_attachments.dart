import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ticket_raising_management/core/errors/failure.dart';
import 'package:ticket_raising_management/core/usecases/usecase.dart';
import 'package:ticket_raising_management/features/ticket_details/domain/repository/repository.dart';

class FetchAttachments implements UseCase<Map<String, QuerySnapshot>, String> {
  final TicketDetailsRepository _repository;

  FetchAttachments({
    required TicketDetailsRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, Map<String, QuerySnapshot>>> call(String id) async {
    final data = await _repository.fetchAttachments(id);
    return data;
  }
}
