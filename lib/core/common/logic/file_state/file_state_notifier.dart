import 'package:file_picker/file_picker.dart';
import 'package:ticket_raising_management/core/common/domain/usecase/pick_audio.dart';
import 'package:ticket_raising_management/core/common/domain/usecase/pick_file.dart';
import 'package:ticket_raising_management/core/common/domain/usecase/pick_image.dart';
import 'package:ticket_raising_management/core/common/domain/usecase/pick_multi_image.dart';
import 'package:ticket_raising_management/core/common/logic/file_state/file_state.dart';
import 'package:ticket_raising_management/core/usecases/usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FileNotifier extends StateNotifier<FileState> {
  final PickMultiImage _pickMultiImage;
  final PickImage _pickImage;
  final PickAudio _pickAudio;
  final PickFile _pickFile;

  FileNotifier({
    required PickMultiImage pickMultiImage,
    required PickImage pickImage,
    required PickAudio pickAudio,
    required PickFile pickFile,
  })  : _pickMultiImage = pickMultiImage,
        _pickImage = pickImage,
        _pickAudio = pickAudio,
        _pickFile = pickFile,
        super(const FileState.initial());

  final List<PlatformFile> _list = [];

  Future<void> pickMultiImages() async {
    state = const FileState.loading();

    var data = await _pickMultiImage.call(NoParams());

    data.fold(
      (l) => state = FileState.error(e: l.msg),
      (r) => state = FileState.multiImage(data: r),
    );
  }

  Future<void> pickImage() async {
    state = const FileState.loading();

    var data = await _pickImage.call(NoParams());

    data.fold(
      (l) => state = FileState.error(e: l.msg),
      (r) => state = FileState.singleImage(data: r),
    );
  }

  Future<void> pickAudio() async {
    state = const FileState.loading();

    var data = await _pickAudio.call(NoParams());

    data.fold(
      (l) => state = FileState.error(e: l.msg),
      (r) => state = FileState.audio(data: r),
    );
  }

  Future<void> pickFile() async {
    var data = await _pickFile.call(NoParams());

    data.fold((l) => state = FileState.error(e: l.msg), (r) {
      _list.addAll(r?.files ?? []);
      state = FileState.file(data: _list);
    });
  }

  void addFile(List<PlatformFile> data) {
    _list.addAll(data);
    state = FileState.file(data: data);
  }

  void addSingleImage(PlatformFile image) {
    state = FileState.singleImage(data: FilePickerResult([image]));
  }

  void remove(PlatformFile data) {
    _list.remove(data);
    state = FileState.file(data: _list);
  }

  void removeAll() {
    _list.clear();
    state = FileState.file(data: _list);
  }
}
