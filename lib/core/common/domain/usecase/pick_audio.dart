import 'package:file_picker/file_picker.dart';
import 'package:ticket_raising_management/core/common/domain/repository/common_repository.dart';
import 'package:ticket_raising_management/core/errors/failure.dart';
import 'package:ticket_raising_management/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class PickAudio implements UseCase<FilePickerResult?, NoParams> {
  final CommonRepository _repository;

  PickAudio({
    required CommonRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, FilePickerResult?>> call(NoParams params) async {
    return await _repository.pickAudio();
  }
}
