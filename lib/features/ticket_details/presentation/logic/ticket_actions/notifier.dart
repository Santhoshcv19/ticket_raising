import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/features/ticket_details/domain/usecase/add_comment.dart';
import 'package:ticket_raising_management/features/ticket_details/domain/usecase/child_link.dart';
import 'package:ticket_raising_management/features/ticket_details/domain/usecase/clone_ticket.dart';
import 'package:ticket_raising_management/features/ticket_details/domain/usecase/delete_children.dart';
import 'package:ticket_raising_management/features/ticket_details/domain/usecase/fetch_tickets.dart';
import 'package:ticket_raising_management/features/ticket_details/domain/usecase/lock.dart';
import 'package:ticket_raising_management/features/ticket_details/domain/usecase/params.dart';
import 'package:ticket_raising_management/features/ticket_details/domain/usecase/unlock.dart';
import 'package:ticket_raising_management/features/ticket_details/domain/usecase/update_resolution.dart';
import 'package:ticket_raising_management/features/ticket_details/domain/usecase/update_tech_assigned.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/ticket_actions/state.dart';

class TicketActionNotifier extends StateNotifier<TicketActionState> {
  final LockTicket _lockTicket;
  final UnLock _unLock;
  final CloneTicket _cloneTicket;
  final UpdateResolution _updateResolution;
  final AddComment _addComment;
  final LinkChild _linkChild;
  final UpdateTechAssigned _techAssigned;
  final DeleteChildren _deleteChildren;

  TicketActionNotifier({
    required DeleteChildren deleteChildren,
    required FetchTickets fetchTickets,
    required LockTicket lockTicket,
    required UnLock unLock,
    required CloneTicket cloneTicket,
    required UpdateResolution updateResolution,
    required AddComment addComment,
    required LinkChild linkChild,
    required UpdateTechAssigned techAssigned,
  })  : _lockTicket = lockTicket,
        _unLock = unLock,
        _cloneTicket = cloneTicket,
        _updateResolution = updateResolution,
        _addComment = addComment,
        _linkChild = linkChild,
        _techAssigned = techAssigned,
        _deleteChildren = deleteChildren,
        super(const TicketActionState.initial());

  Future<void> lock(TicketDetailsParams params) async {
    state = const TicketActionState.loading();
    final data = await _lockTicket.call(params);
    data.fold(
      (l) => state = const TicketActionState.error(),
      (r) => state = const TicketActionState.lock(),
    );
  }

  Future<void> unLock(String? id) async {
    state = const TicketActionState.loading();
    final data = await _unLock.call(id ?? '');
    data.fold(
      (l) => state = const TicketActionState.error(),
      (r) => state = const TicketActionState.unlock(),
    );
  }

  Future<void> updateResolution(TicketDetailsParams params) async {
    state = const TicketActionState.loading();
    final data = await _updateResolution.call(params);
    data.fold(
      (l) => state = const TicketActionState.error(),
      (r) => state = const TicketActionState.resolution(),
    );
  }

  Future<void> cloneTicket(String? id) async {
    state = const TicketActionState.loading();
    final data = await _cloneTicket.call(id ?? '');
    data.fold(
      (l) => state = const TicketActionState.error(),
      (r) => state = TicketActionState.cloned(id: r),
    );
  }

  Future<void> addComment(TicketDetailsParams params) async {
    final data = await _addComment.call(params);
    data.fold(
      (l) => state = const TicketActionState.error(),
      (r) => state = const TicketActionState.commented(),
    );
  }

  Future<void> linkParentChild(TicketDetailsParams params) async {
    state = const TicketActionState.loading();
    final data = await _linkChild.call(params);
    data.fold(
      (l) => state = const TicketActionState.error(),
      (r) => state = const TicketActionState.parentChild(),
    );
  }

  Future<void> updateTechAssigned(TicketDetailsParams params) async {
    state = const TicketActionState.loading();
    final data = await _techAssigned.call(params);
    data.fold(
      (l) => state = const TicketActionState.error(),
      (r) => state = const TicketActionState.techAssigned(),
    );
  }

  Future<void> deleteChildren(TicketDetailsParams params) async {
    state = const TicketActionState.loading();
    final data = await _deleteChildren.call(params);
    data.fold(
      (l) => state = const TicketActionState.error(),
      (r) => state = const TicketActionState.removeChildren(),
    );
  }
}
