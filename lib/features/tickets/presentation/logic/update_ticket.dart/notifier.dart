import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/features/tickets/domain/usecase/delete_ticket.dart';
import 'package:ticket_raising_management/features/tickets/domain/usecase/params.dart';
import 'package:ticket_raising_management/features/tickets/domain/usecase/update_ticket.dart';

import 'package:ticket_raising_management/features/tickets/presentation/logic/update_ticket.dart/state.dart';

class UpdateTicketNoti extends StateNotifier<UpdateTicketState> {
  final UpdateTicket _updateTicket;
  final DeleteTicket _deleteTicket;

  UpdateTicketNoti({
    required UpdateTicket updateTicket,
    required DeleteTicket deleteTicket,
  })  : _updateTicket = updateTicket,
        _deleteTicket = deleteTicket,
        super(const UpdateTicketState.initial());

  Future<void> updateTicket(TicketParams params) async {
    state = const UpdateTicketState.loading();
    final data = await _updateTicket.call(params);
    data.fold(
      (l) => state = const UpdateTicketState.error(),
      (r) => state = const UpdateTicketState.data(),
    );
  }

  Future<void> deleteTicket(TicketParams params) async {
    state = const UpdateTicketState.loading();
    final data = await _deleteTicket.call(params);
    data.fold(
      (l) => state = const UpdateTicketState.error(),
      (r) => state = const UpdateTicketState.data(),
    );
  }
}
