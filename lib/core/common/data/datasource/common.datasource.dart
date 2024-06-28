import 'package:file_picker/file_picker.dart';
import 'package:ticket_raising_management/core/common/data/model/ticket_model.dart';
import 'package:ticket_raising_management/core/common/domain/usecase/params/attachmentsparams.dart';
import 'package:ticket_raising_management/core/common/params/status_params.dart';
import 'package:ticket_raising_management/services/file.service.dart';
import 'package:ticket_raising_management/services/firebase.service.dart';

abstract class CommonDatasource {
  Future<FilePickerResult?> pickMultiImage();
  Future<FilePickerResult?> pickImage();
  Future<FilePickerResult?> pickAudio();
  Future<FilePickerResult?> pickFile();
  Future<void> addAttachments(AttachmentParams params);
  Future<void> changeStatus(StatusParams params);
}

class CommonDatasourceImpl implements CommonDatasource {
  final FileService _fileService;
  final FirebaseService _firebaseService;

  CommonDatasourceImpl({
    required FirebaseService firebaseService,
    required FileService fileService,
  })  : _fileService = fileService,
        _firebaseService = firebaseService;

  @override
  Future<FilePickerResult?> pickMultiImage() async {
    try {
      var data = await _fileService.pickMultiImage();
      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<FilePickerResult?> pickImage() async {
    try {
      var data = await _fileService.pickImage();
      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<FilePickerResult?> pickAudio() async {
    try {
      var data = await _fileService.pickAudio();
      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<FilePickerResult?> pickFile() async {
    try {
      var data = await _fileService.pickFile();
      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> addAttachments(AttachmentParams params) async {
    try {
      var data = AttachmentModel(
        url: params.url,
        type: params.type,
      ).toJson();
      await _firebaseService.addAttachments(params.ticketId ?? '', data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> changeStatus(StatusParams params) async {
    try {
      Map<String, dynamic> data = {};

      data['ticketStatus'] = params.status;

      if (params.startTime != null) data['startTime'] = params.startTime;
      if (params.closedAt != null) data['closedAt'] = params.closedAt;
      if (params.reOpenAt != null) data['reopenedAt'] = params.reOpenAt;
      if (params.resolvedAt != null) data['resolvedAt'] = params.resolvedAt;

      await _firebaseService.updateTicketStatus(params.ticketId, data);
    } catch (e) {
      rethrow;
    }
  }
}
