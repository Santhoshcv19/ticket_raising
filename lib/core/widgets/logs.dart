import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/styles/dimenstions.style.dart';
import 'package:ticket_raising_management/core/widgets/log.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/provider.dart';

class Logs extends ConsumerWidget {
  const Logs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(logsNotifier);

    return state.maybeWhen(
      orElse: () => const CircularProgressIndicator(),
      empty: () => const SizedBox.shrink(),
      data: (data) => ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (_, i) => Log(data: data[i]),
        separatorBuilder: (_, i) => const SizedBox(height: Dimen.space),
        itemCount: data.length,
      ),
      error: () => const Text('Error'),
    );
  }
}
