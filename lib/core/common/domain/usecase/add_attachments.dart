import 'package:dartz/dartz.dart';
import 'package:ticket_raising_management/core/common/domain/usecase/params/attachmentsparams.dart';
import 'package:ticket_raising_management/core/common/domain/repository/common_repository.dart';
import 'package:ticket_raising_management/core/errors/failure.dart';
import 'package:ticket_raising_management/core/usecases/usecase.dart';

class AddAttachments extends UseCase<void, AttachmentParams> {
  final CommonRepository _commonRepository;

  AddAttachments({required CommonRepository commonRepository})
      : _commonRepository = commonRepository;

  @override
  Future<Either<Failure, void>> call(AttachmentParams params) async {
    final data = await _commonRepository.addAttachments(params);
    return data;
  }
}
