import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/styles/dimenstions.style.dart';
import 'package:ticket_raising_management/features/tickets/presentation/logic/others/logic.dart';
import 'package:ticket_raising_management/features/tickets/presentation/logic/provider.dart';
import 'package:ticket_raising_management/features/tickets/presentation/widgets/no_tickets.dart';
import 'package:ticket_raising_management/features/tickets/presentation/widgets/ticket.dart';

class TicketData extends ConsumerWidget {
  const TicketData({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(fetchTicketNotifier);
    final logic = ref.watch(ticketLogic);

    return state.maybeWhen(
      orElse: () => const Center(child: CircularProgressIndicator()),
      data: (data) {
        if (logic.all.isEmpty) {
          return const Expanded(flex: 2, child: HmsNoTickets());
        }

        return Expanded(
          child: TabBarView(controller: logic.controller, children: [
            ListView.separated(
              padding: Dimen.scaffoldMargin,
              itemBuilder: (_, i) => HmsTicket(data: logic.all[i]),
              separatorBuilder: (_, i) => const SizedBox(height: Dimen.space),
              itemCount: logic.all.length,
            ),
            ListView.separated(
              padding: Dimen.scaffoldMargin,
              itemBuilder: (_, i) => HmsTicket(data: logic.open[i]),
              separatorBuilder: (_, i) => const SizedBox(height: Dimen.space),
              itemCount: logic.open.length,
            ),
            ListView.separated(
              padding: Dimen.scaffoldMargin,
              itemBuilder: (_, i) => HmsTicket(data: logic.resolved[i]),
              separatorBuilder: (_, i) => const SizedBox(height: Dimen.space),
              itemCount: logic.resolved.length,
            ),
            ListView.separated(
              padding: Dimen.scaffoldMargin,
              itemBuilder: (_, i) => HmsTicket(data: logic.closed[i]),
              separatorBuilder: (_, i) => const SizedBox(height: Dimen.space),
              itemCount: logic.closed.length,
            ),
          ]),
        );
      },
    );
  }
}
