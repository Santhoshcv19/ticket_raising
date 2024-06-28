import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/common/data/model/ticket_model.dart';
import 'package:ticket_raising_management/features/ticket_details/domain/usecase/fetch_attachments.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/attachments/state.dart';
import 'package:ticket_raising_management/services/file.service.dart';

class AttachmentsNotifier extends StateNotifier<AttachmentsState> {
  final FetchAttachments _fetchAttachments;
  final FileService _fileService;

  AttachmentsNotifier({
    required FetchAttachments fetchAttachments,
    required FileService fileService,
  })  : _fetchAttachments = fetchAttachments,
        _fileService = fileService,
        super(const AttachmentsState.initial());

  Future<void> fetchAttachments(String? id) async {
    state = const AttachmentsState.loading();

    if (id == null) return;

    final data = await _fetchAttachments.call(id);

    data.fold((l) => state = const AttachmentsState.error(), (r) {
      final attachments = r['attachments']?.docs ?? [];
      final resolution = r['resolution']?.docs ?? [];

      var attachmentsList = attachments.map((e) => AttachmentModel.fromJson(e));
      var resolutionList = resolution.map((e) => AttachmentModel.fromJson(e));

      state = AttachmentsState.data(
        attachemnts: attachmentsList.toList(),
        resolution: resolutionList.toList(),
      );
    });
  }

  Future<void> fetchAttachmentFiles(String? id) async {
    state = const AttachmentsState.loading();

    if (id == null) return;

    final data = await _fetchAttachments.call(id);

    data.fold((l) => state = const AttachmentsState.error(), (r) async {
      final attachments = r['attachments']?.docs ?? [];

      var attachmentsList = attachments.map((e) => AttachmentModel.fromJson(e));

      final List<PlatformFile> list = [];

      for (var item in attachmentsList) {
        final file = await _fileService.downloadFile(item.url);
        String type = '';

        if (item.type == 1) {
          type = '.jpg';
        } else if (item.type == 2) {
          type = '.mp4';
        } else if (item.type == 3) {
          type = '.mp3';
        } else if (item.type == 4) {
          type = '.pdf';
        }

        final platformFile = PlatformFile(
          name: item.fileName ?? 'File.$type',
          size: 0,
          bytes: file,
        );
        list.add(platformFile);
      }

      state = AttachmentsState.files(
        data: list,
        attachemnts: attachmentsList.toList(),
      );
    });
  }
}
