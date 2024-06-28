import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/features/tickets/data/datasource/remotedata_source.dart';
import 'package:ticket_raising_management/features/tickets/data/repository/repository.dart';
import 'package:ticket_raising_management/features/tickets/domain/repository/repository.dart';

import 'package:ticket_raising_management/features/tickets/domain/usecase/add_ticket.dart';
import 'package:ticket_raising_management/features/tickets/domain/usecase/delete_ticket.dart';
import 'package:ticket_raising_management/features/tickets/domain/usecase/fetch_tickets.dart';
import 'package:ticket_raising_management/features/tickets/domain/usecase/update_ticket.dart';

import 'package:ticket_raising_management/features/tickets/presentation/logic/add_ticket/state.dart';
import 'package:ticket_raising_management/features/tickets/presentation/logic/add_ticket/notifier.dart';
import 'package:ticket_raising_management/features/tickets/presentation/logic/fetch_tickets/notifier.dart';
import 'package:ticket_raising_management/features/tickets/presentation/logic/fetch_tickets/state.dart';
import 'package:ticket_raising_management/features/tickets/presentation/logic/update_ticket.dart/notifier.dart';
import 'package:ticket_raising_management/features/tickets/presentation/logic/update_ticket.dart/state.dart';
import 'package:ticket_raising_management/services/provider.dart';

final _remoteDatasource = Provider<TicketRemoteDataSource>(
  (ref) =>
      TicketRemoteDataSourceImpl(firebaseService: ref.read(firebaseService)),
);

final _repository = Provider<TicketRepository>(
  (ref) => TicketRepositoryImpl(remoteDataSource: ref.read(_remoteDatasource)),
);

final _fetchTicket = Provider<FetchTickets>(
  (ref) => FetchTickets(repository: ref.read(_repository)),
);

final _addTicket = Provider<AddTicket>(
  (ref) => AddTicket(repository: ref.read(_repository)),
);

final _updateTicket = Provider<UpdateTicket>(
  (ref) => UpdateTicket(repository: ref.read(_repository)),
);

final _deleteTicket = Provider<DeleteTicket>(
  (ref) => DeleteTicket(repository: ref.read(_repository)),
);

final fetchTicketNotifier =
    StateNotifierProvider<FetchTicketNotifier, TicketState>(
  (ref) => FetchTicketNotifier(fetchTickets: ref.read(_fetchTicket)),
);

final addTicketNotifier =
    StateNotifierProvider<AddTicketNotifier, AddTicketState>(
  (ref) => AddTicketNotifier(addTicket: ref.read(_addTicket)),
);

final updateTicketNotifier =
    StateNotifierProvider<UpdateTicketNoti, UpdateTicketState>(
  (ref) => UpdateTicketNoti(
    updateTicket: ref.read(_updateTicket),
    deleteTicket: ref.read(_deleteTicket),
  ),
);
