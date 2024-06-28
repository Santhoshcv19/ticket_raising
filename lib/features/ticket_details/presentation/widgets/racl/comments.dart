import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/styles/dimenstions.style.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/provider.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/widgets/comment.dart';

class Comments extends ConsumerWidget {
  const Comments({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(commentsNotifier);

    return state.maybeWhen(
      orElse: () => const CircularProgressIndicator(),
      empty: () => const SizedBox.shrink(),
      error: () => const Text('Error'),
      data: (data) => ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (_, i) {
          return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const CircleAvatar(
              radius: Dimen.icon * .75,
              child: Icon(Icons.person, size: Dimen.icon * .75),
            ),
            const SizedBox(width: Dimen.space),
            Expanded(child: Comment(data: data[i])),
          ]);
        },
        separatorBuilder: (_, i) => const SizedBox(height: Dimen.space),
        itemCount: data.length,
      ),
    );
  }
}
