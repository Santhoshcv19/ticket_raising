import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ticket_raising_management/core/common/domain/entity/ticket.entity.dart';

part 'state.freezed.dart';

@freezed
class TicketState with _$TicketState {
  const factory TicketState.initial() = TicketStateInitial;
  const factory TicketState.loading() = TicketStateLoading;
  const factory TicketState.data({
    required List<TicketEntity> data,
  }) = TicketStateData;
  const factory TicketState.empty() = TicketStateEmpty;
  const factory TicketState.error() = TicketStateError;
}
