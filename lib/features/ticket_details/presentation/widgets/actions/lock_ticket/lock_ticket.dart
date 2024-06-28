import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/alerts/confirm_alert.dart';
import 'package:ticket_raising_management/core/controller/app_data.controller.dart';
import 'package:ticket_raising_management/core/utils/utils.dart';
import 'package:ticket_raising_management/features/ticket_details/domain/usecase/params.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/others/logic.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/provider.dart';

class LockTicket extends ConsumerWidget {
  const LockTicket({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.read(ticketDetailsLogic).data;
    final notifier = ref.read(ticketActionNotifier.notifier);

    return ConfirmAlert(
      onConfirm: () async {
        final user = appController.user;
        Utils.pop(context);
        final params = TicketDetailsParams(
          ticketId: data?.ref?.id,
          commentedBy: user?.iD,
        );
        await notifier.lock(params);
      },
      title: 'Are you sure you want to lock this Ticket ?',
    );
  }
}
