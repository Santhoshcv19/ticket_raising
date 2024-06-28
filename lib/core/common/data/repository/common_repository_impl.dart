import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:ticket_raising_management/core/common/data/datasource/common.datasource.dart';
import 'package:ticket_raising_management/core/common/domain/usecase/params/attachmentsparams.dart';
import 'package:ticket_raising_management/core/common/domain/repository/common_repository.dart';
import 'package:ticket_raising_management/core/common/params/status_params.dart';

import 'package:ticket_raising_management/core/errors/failure.dart';

class CommonRepositoryImpl implements CommonRepository {
  final CommonDatasource _datasource;

  CommonRepositoryImpl({
    required CommonDatasource datasource,
  }) : _datasource = datasource;

  @override
  Future<Either<Failure, FilePickerResult?>> pickMultiImage() async {
    try {
      var data = await _datasource.pickMultiImage();
      return Right(data);
    } catch (e) {
      return Left(InternalFailure(msg: '$e'));
    }
  }

  @override
  Future<Either<Failure, FilePickerResult?>> pickImage() async {
    try {
      var data = await _datasource.pickImage();
      return Right(data);
    } catch (e) {
      return Left(InternalFailure(msg: '$e'));
    }
  }

  @override
  Future<Either<Failure, FilePickerResult?>> pickAudio() async {
    try {
      var data = await _datasource.pickAudio();
      return Right(data);
    } catch (e) {
      return Left(InternalFailure(msg: '$e'));
    }
  }

  @override
  Future<Either<Failure, FilePickerResult?>> pickFile() async {
    try {
      var data = await _datasource.pickFile();
      return Right(data);
    } catch (e) {
      return Left(InternalFailure(msg: '$e'));
    }
  }

  @override
  Future<Either<Failure, void>> addAttachments(AttachmentParams params) async {
    try {
      var data = await _datasource.addAttachments(params);
      return Right(data);
    } catch (e) {
      return Left(InternalFailure(msg: '$e'));
    }
  }

  @override
  Future<Either<Failure, void>> changeStatus(StatusParams params) async {
    try {
      var data = await _datasource.changeStatus(params);
      return Right(data);
    } catch (e) {
      return Left(InternalFailure(msg: '$e'));
    }
  }
}
