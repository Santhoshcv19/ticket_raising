import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/others/logic.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/provider.dart';

class LockedTicket extends ConsumerWidget {
  const LockedTicket({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logic = ref.watch(ticketDetailsLogic);
    final notifier = ref.read(ticketActionNotifier.notifier);

    if (logic.data?.lock?.lockedBy == null) return const SizedBox();

    return IconButton(
      icon: const Icon(Icons.lock),
      color: AppColors.grey,
      onPressed: () => notifier.unLock(logic.data?.ref?.id),
    );
  }
}
