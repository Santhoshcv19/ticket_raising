import 'package:freezed_annotation/freezed_annotation.dart';
part 'state.freezed.dart';

@freezed
class AddTicketState with _$AddTicketState {
  const factory AddTicketState.initial() = AddTicketStateInitial;
  const factory AddTicketState.error() = AddTicketStateError;
  const factory AddTicketState.loading() = AddTicketStateLoading;
  const factory AddTicketState.data() = AddTicketStateData;
}
