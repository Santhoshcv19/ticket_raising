import 'package:file_picker/file_picker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_state.freezed.dart';

@freezed
class FileState with _$FileState {
  const factory FileState.initial() = _FileStateInitial;
  const factory FileState.loading() = _FileStateLoading;
  const factory FileState.data() = _FileStateData;
  const factory FileState.multiImage({
    FilePickerResult? data,
  }) = _FileStateMultiFile;
  const factory FileState.singleImage({
    FilePickerResult? data,
  }) = _FileStateSingleFile;
  const factory FileState.audio({FilePickerResult? data}) = _FileStateAudio;
  const factory FileState.file({List<PlatformFile>? data}) = _FileStateFile;
  const factory FileState.error({String? e}) = _FileStateError;
}
