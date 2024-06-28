import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/controller/rights.controller.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';
import 'package:ticket_raising_management/core/utils/texts/body.text.dart';
import 'package:ticket_raising_management/core/utils/texts/sub_body.text.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/others/logic.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/widgets/actions/clone/clone_ticket.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/widgets/actions/email/emailcustomer.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/widgets/actions/lock_ticket/lock_ticket.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/widgets/actions/parent_child/link_parent_child.dart';

class TicketActions extends ConsumerWidget {
  const TicketActions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(ticketDetailsLogic);
    final data = ref.watch(ticketDetailsLogic).data;

    final hasRights = rightsController.hasTicketRights(data);

    if (!hasRights) return const SizedBox();

    final bool isLocked = data?.lock?.lockedBy != null;

    return PopupMenuButton(
      enabled: !isLocked,
      tooltip: isLocked ? 'This ticket is locked' : null,
      position: PopupMenuPosition.under,
      onSelected: (value) {
        provider.parent = provider.data;
        Widget? child;

        if (value == 1) {
          child = const ParentChild();
        } else if (value == 2) {
          child = const CloneTicket();
        } else if (value == 3) {
          child = const LockTicket();
        } else if (value == 4) {
          child = const EmailCustomer();
        }

        if (child == null) return;
        showDialog(context: context, builder: (context) => child!);
      },
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 1,
          child: AppBodyText(data: 'Link to Parent/Child Ticket'),
        ),
        const PopupMenuItem(
          value: 2,
          child: AppBodyText(data: 'Clone Ticket'),
        ),
        const PopupMenuItem(
          value: 3,
          child: AppBodyText(data: 'Lock Ticket'),
        ),
        const PopupMenuItem(
          value: 4,
          child: AppBodyText(data: 'Email Customer about Status'),
        ),
        const PopupMenuItem(
          value: 5,
          child: AppBodyText(data: 'Send CSAT Form'),
        ),
      ],
      child: const Row(children: [
        AppSubBodyText(data: 'Action', color: AppColors.primary),
        Icon(Icons.keyboard_arrow_down, color: AppColors.primary)
      ]),
    );
  }
}
