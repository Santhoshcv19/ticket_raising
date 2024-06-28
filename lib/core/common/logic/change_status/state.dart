import 'package:freezed_annotation/freezed_annotation.dart';
part 'state.freezed.dart';

@freezed
class ChangeStatusState with _$ChangeStatusState {
  const factory ChangeStatusState.initial() = ChangeStatusStateInitial;
  const factory ChangeStatusState.loading() = ChangeStatusStateLoading;
  const factory ChangeStatusState.error() = ChangeStatusStateError;
  const factory ChangeStatusState.data() = ChangeStatusStateData;
}
