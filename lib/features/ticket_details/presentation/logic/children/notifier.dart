import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/common/data/model/ticket_model.dart';
import 'package:ticket_raising_management/features/ticket_details/domain/usecase/fetch_children.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/children/state.dart';

class ChildrenNotifier extends StateNotifier<ChildrenState> {
  final FetchChildren _fetchChildren;

  ChildrenNotifier({
    required FetchChildren fetchChildren,
  })  : _fetchChildren = fetchChildren,
        super(const ChildrenState.initial());

  Future<void> fetchChildren(String? id) async {
    state = const ChildrenState.loading();

    if (id == null) return;

    final data = await _fetchChildren.call(id);

    data.fold((l) => state = const ChildrenState.error(), (r) {
      r.listen((event) {
        final docs = event.docs;
        if (docs.isEmpty) {
          state = const ChildrenState.empty();
          return;
        }
        final data = docs.map((e) => ChildModel.fromJson(e)).toList();
        state = ChildrenState.data(data: data);
      });
    });
  }
}
