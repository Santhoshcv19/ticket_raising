import 'package:ticket_raising_management/core/common/data/datasource/common.datasource.dart';
import 'package:ticket_raising_management/core/common/data/repository/common_repository_impl.dart';
import 'package:ticket_raising_management/core/common/domain/repository/common_repository.dart';
import 'package:ticket_raising_management/core/common/domain/usecase/add_attachments.dart';
import 'package:ticket_raising_management/core/common/domain/usecase/pick_audio.dart';
import 'package:ticket_raising_management/core/common/domain/usecase/pick_file.dart';
import 'package:ticket_raising_management/core/common/domain/usecase/pick_image.dart';
import 'package:ticket_raising_management/core/common/domain/usecase/pick_multi_image.dart';
import 'package:ticket_raising_management/core/common/domain/usecase/status.dart';
import 'package:ticket_raising_management/core/common/logic/attachment/notifier.dart';
import 'package:ticket_raising_management/core/common/logic/attachment/state.dart';
import 'package:ticket_raising_management/core/common/logic/change_status/notifier.dart';
import 'package:ticket_raising_management/core/common/logic/change_status/state.dart';
import 'package:ticket_raising_management/core/common/logic/file_state/file_state.dart';
import 'package:ticket_raising_management/core/common/logic/file_state/file_state_notifier.dart';
import 'package:ticket_raising_management/services/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _datasource = Provider<CommonDatasource>(
  (ref) => CommonDatasourceImpl(
    fileService: ref.read(fileService),
    firebaseService: ref.read(firebaseService),
  ),
);

final _repository = Provider<CommonRepository>(
  (ref) => CommonRepositoryImpl(datasource: ref.read(_datasource)),
);

final _pickMultiImage = Provider<PickMultiImage>(
  (ref) => PickMultiImage(repository: ref.read(_repository)),
);

final _pickImage = Provider<PickImage>(
  (ref) => PickImage(repository: ref.read(_repository)),
);

final _pickAudio = Provider<PickAudio>(
  (ref) => PickAudio(repository: ref.read(_repository)),
);

final _pickFile = Provider<PickFile>(
  (ref) => PickFile(repository: ref.read(_repository)),
);

final _addAttachments = Provider<AddAttachments>(
  (ref) => AddAttachments(commonRepository: ref.read(_repository)),
);

final _statusChange = Provider<ChangeStatus>(
  (ref) => ChangeStatus(repository: ref.read(_repository)),
);

final fileNotifier = StateNotifierProvider<FileNotifier, FileState>(
  (ref) => FileNotifier(
    pickMultiImage: ref.read(_pickMultiImage),
    pickImage: ref.read(_pickImage),
    pickAudio: ref.read(_pickAudio),
    pickFile: ref.read(_pickFile),
  ),
);

final addAttachmentNotifierProvider =
    StateNotifierProvider<AttachmentsNotifier, AttachmentsState>(
  (ref) => AttachmentsNotifier(addAttachments: ref.read(_addAttachments)),
);

final statusChangeProvider =
    StateNotifierProvider<ChangeStatusNotifier, ChangeStatusState>(
  (ref) => ChangeStatusNotifier(changeStatus: ref.read(_statusChange)),
);
