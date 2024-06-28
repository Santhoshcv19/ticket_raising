import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/features/tickets/domain/usecase/fetch_tickets.dart';
import 'package:ticket_raising_management/features/tickets/presentation/logic/fetch_tickets/state.dart';
import 'package:ticket_raising_management/core/usecases/usecase.dart';
import 'package:ticket_raising_management/core/common/data/model/ticket_model.dart';

class FetchTicketNotifier extends StateNotifier<TicketState> {
  final FetchTickets _fetchTickets;

  FetchTicketNotifier({
    required FetchTickets fetchTickets,
  })  : _fetchTickets = fetchTickets,
        super(const TicketState.initial());

  void fetchTickets() {
    state = const TicketState.loading();
    final data = _fetchTickets.call(NoParams());

    data.fold((l) => state = const TicketState.error(), (r) {
      r.listen((event) async {
        final data = event.docs.map((e) => TicketModel.fromJson(e)).toList();

        if (data.isEmpty) {
          state = const TicketState.empty();
          return;
        }

        state = TicketState.data(data: data);
      });
    });
  }
}
