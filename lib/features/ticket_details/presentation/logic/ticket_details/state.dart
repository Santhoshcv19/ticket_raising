import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ticket_raising_management/core/common/domain/entity/ticket.entity.dart';

part 'state.freezed.dart';

@freezed
class TicketDetailsState with _$TicketDetailsState {
  const factory TicketDetailsState.initial() = _TicketDetailsStateInitial;
  const factory TicketDetailsState.loading() = _TicketDetailsStateLoading;
  const factory TicketDetailsState.data({
    required TicketEntity data,
  }) = _TicketDetailsStateData;
  const factory TicketDetailsState.error() = _TicketDetailsStateError;
}
