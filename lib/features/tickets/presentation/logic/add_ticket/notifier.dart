import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/features/tickets/domain/usecase/add_ticket.dart';
import 'package:ticket_raising_management/features/tickets/domain/usecase/params.dart';
import 'package:ticket_raising_management/features/tickets/presentation/logic/add_ticket/state.dart';

class AddTicketNotifier extends StateNotifier<AddTicketState> {
  final AddTicket _addTicket;

  AddTicketNotifier({
    required AddTicket addTicket,
  })  : _addTicket = addTicket,
        super(const AddTicketState.initial());

  Future<void> addTicket(TicketParams params) async {
    state = const AddTicketState.loading();
    final data = await _addTicket.call(params);
    data.fold(
      (l) => state = const AddTicketState.error(),
      (r) => state = const AddTicketState.data(),
    );
  }
}
