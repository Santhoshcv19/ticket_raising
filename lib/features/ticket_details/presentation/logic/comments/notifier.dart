import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/common/data/model/ticket_model.dart';
import 'package:ticket_raising_management/features/ticket_details/domain/usecase/fetch_comments.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/comments/state.dart';

class CommentNotifier extends StateNotifier<CommentState> {
  final FetchComments _fetchComments;

  CommentNotifier({
    required FetchComments fetchComments,
  })  : _fetchComments = fetchComments,
        super(const CommentState.initial());

  Future<void> fetchComments(String id) async {
    state = const CommentState.loading();

    final data = await _fetchComments.call(id);

    data.fold((l) => state = const CommentState.error(), (r) {
      r.listen((item) {
        final list = item.docs.map((e) => CommentModel.fromJson(e)).toList();
        if (list.isEmpty) {
          state = const CommentState.empty();
          return;
        }
        state = CommentState.data(data: list);
      }, onError: (e) => state = const CommentState.error());
    });
  }
}
