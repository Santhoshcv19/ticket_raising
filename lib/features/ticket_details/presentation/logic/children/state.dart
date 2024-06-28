import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ticket_raising_management/core/common/domain/entity/ticket.entity.dart';
part 'state.freezed.dart';

@freezed
class ChildrenState with _$ChildrenState {
  const factory ChildrenState.initial() = ChildrenStateInitial;
  const factory ChildrenState.loading() = ChildrenStateLoading;
  const factory ChildrenState.data({
    required List<ChildEntity> data,
  }) = ChildrenStatedata;
  const factory ChildrenState.empty() = ChildrenStateEmpty;
  const factory ChildrenState.error() = ChildrenStateError;
}
