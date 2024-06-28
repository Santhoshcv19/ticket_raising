import 'package:freezed_annotation/freezed_annotation.dart';
part 'state.freezed.dart';

@freezed
class UpdateTicketState with _$UpdateTicketState {
  const factory UpdateTicketState.initial() = UpdateTicketStateInitial;
  const factory UpdateTicketState.loading() = UpdateTicketStateLoading;
  const factory UpdateTicketState.data() = UpdateTicketStateData;
  const factory UpdateTicketState.error() = UpdateTicketStateError;
}
