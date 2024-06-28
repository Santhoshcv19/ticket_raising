import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/common/data/model/ticket_model.dart';
import 'package:ticket_raising_management/features/ticket_details/domain/usecase/fetch_logs.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/logs/state.dart';

class LogNotifier extends StateNotifier<LogState> {
  final FetchLogs _fetchLogs;

  LogNotifier({
    required FetchLogs fetchLogs,
  })  : _fetchLogs = fetchLogs,
        super(const LogState.initial());

  Future<void> fetchLogs(String id) async {
    state = const LogState.loading();

    final data = await _fetchLogs.call(id);

    data.fold((l) => state = const LogState.error(), (r) {
      r.listen((item) {
        final list = item.docs.map((e) => LogModel.fromJson(e)).toList();

        if (list.isEmpty) {
          state = const LogState.empty();
          return;
        }
        state = LogState.data(data: list);
      }, onError: (e) => state = const LogState.error());
    });
  }
}
