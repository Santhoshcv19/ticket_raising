import 'package:file_picker/file_picker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ticket_raising_management/core/common/domain/entity/ticket.entity.dart';

part 'state.freezed.dart';

@freezed
class AttachmentsState with _$AttachmentsState {
  const factory AttachmentsState.initial() = AttachmentsStateInitial;
  const factory AttachmentsState.loading() = AttachmentsStateLoading;
  const factory AttachmentsState.data({
    required List<AttachmentEntity> attachemnts,
    required List<AttachmentEntity> resolution,
  }) = AttachmentsStateData;
  const factory AttachmentsState.files({
    required List<PlatformFile> data,
    required List<AttachmentEntity> attachemnts,
  }) = AttachmentsStateFile;
  const factory AttachmentsState.error() = AttachmentsStateError;
}
