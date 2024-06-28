import 'package:dartz/dartz.dart';
import 'package:ticket_raising_management/core/errors/failure.dart';
import 'package:ticket_raising_management/core/usecases/usecase.dart';
import 'package:ticket_raising_management/features/ticket_details/domain/repository/repository.dart';
import 'package:ticket_raising_management/features/ticket_details/domain/usecase/params.dart';

class UpdateTechAssigned implements UseCase<void, TicketDetailsParams> {
  final TicketDetailsRepository _repository;

  UpdateTechAssigned({
    required TicketDetailsRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, void>> call(params) async {
    final data = await _repository.updateTechAssigned(params);
    return data;
  }
}
