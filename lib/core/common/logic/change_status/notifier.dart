import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/common/domain/usecase/status.dart';
import 'package:ticket_raising_management/core/common/logic/change_status/state.dart';
import 'package:ticket_raising_management/core/common/params/status_params.dart';

class ChangeStatusNotifier extends StateNotifier<ChangeStatusState> {
  final ChangeStatus _changeStatus;

  ChangeStatusNotifier({required ChangeStatus changeStatus})
      : _changeStatus = changeStatus,
        super(const ChangeStatusState.initial());

  Future<void> changeStatus(StatusParams params) async {
    state = const ChangeStatusState.loading();
    final data = await _changeStatus.call(params);

    data.fold((l) => state = const ChangeStatusState.error(),
        (r) => state = const ChangeStatusState.data());
  }
}
