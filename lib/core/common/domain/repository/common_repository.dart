import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:ticket_raising_management/core/common/domain/usecase/params/attachmentsparams.dart';
import 'package:ticket_raising_management/core/common/params/status_params.dart';
import 'package:ticket_raising_management/core/errors/failure.dart';

abstract class CommonRepository {
  Future<Either<Failure, FilePickerResult?>> pickMultiImage();
  Future<Either<Failure, FilePickerResult?>> pickImage();
  Future<Either<Failure, FilePickerResult?>> pickAudio();
  Future<Either<Failure, FilePickerResult?>> pickFile();
  Future<Either<Failure, void>> addAttachments(AttachmentParams params);
  Future<Either<Failure, void>> changeStatus(StatusParams params);
}
