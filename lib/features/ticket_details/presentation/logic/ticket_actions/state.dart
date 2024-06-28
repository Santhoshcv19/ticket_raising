import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ticket_raising_management/core/common/domain/entity/ticket.entity.dart';
part 'state.freezed.dart';

@freezed
class TicketActionState with _$TicketActionState {
  const factory TicketActionState.initial() = TicketActionStateInitial;
  const factory TicketActionState.loading() = TicketActionStateLoading;
  const factory TicketActionState.tickets({
    required List<TicketEntity> data,
  }) = TicketActionStateTickets;
  const factory TicketActionState.lock() = TicketActionStatedata;
  const factory TicketActionState.unlock() = TicketActionStatenodata;
  const factory TicketActionState.cloned({
    String? id,
  }) = TicketActionStateCloned;
  const factory TicketActionState.resolution() = TicketActionStateResolution;
  const factory TicketActionState.commented() = TicketActionStateCommeted;
  const factory TicketActionState.parentChild() = TicketActionStateParentChild;
  const factory TicketActionState.data({String? id}) = TicketActionStateData;
  const factory TicketActionState.techAssigned() = TicketActionStateTechAssign;
  const factory TicketActionState.removeChildren() =
      TicketActionStateRemoveChildren;

  const factory TicketActionState.error() = TicketActionStateError;
}
