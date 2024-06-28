import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/alerts/confirm_alert.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/others/logic.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/provider.dart';

class CloneTicket extends ConsumerWidget {
  const CloneTicket({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.read(ticketDetailsLogic).data;
    final notifier = ref.read(ticketActionNotifier.notifier);

    return ConfirmAlert(
      onConfirm: () => notifier.cloneTicket(data?.ref?.id),
      title: 'Do you want to clone this ticket ?',
    );
  }
}
