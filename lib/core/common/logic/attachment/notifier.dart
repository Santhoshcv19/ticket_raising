import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/common/domain/usecase/params/attachmentsparams.dart';
import 'package:ticket_raising_management/core/common/domain/usecase/add_attachments.dart';
import 'package:ticket_raising_management/core/common/logic/attachment/state.dart';

class AttachmentsNotifier extends StateNotifier<AttachmentsState> {
  final AddAttachments _addAttachments;

  AttachmentsNotifier({required AddAttachments addAttachments})
      : _addAttachments = addAttachments,
        super(const AttachmentsState.initial());

  Future<void> addAttachments(AttachmentParams params) async {
    state = const AttachmentsState.loading();
    final data = await _addAttachments.call(params);
    data.fold(
      (l) => state = const AttachmentsState.error(),
      (r) => state = const AttachmentsState.data(),
    );
  }
}
