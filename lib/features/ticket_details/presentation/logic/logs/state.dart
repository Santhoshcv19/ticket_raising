import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ticket_raising_management/core/common/domain/entity/ticket.entity.dart';

part 'state.freezed.dart';

@freezed
class LogState with _$LogState {
  const factory LogState.initial() = LogStateInitial;
  const factory LogState.loading() = LogStateLoading;
  const factory LogState.data({required List<LogEntity> data}) = LogStatedata;
  const factory LogState.empty() = LogStateEmpty;
  const factory LogState.error() = LogStateError;
}
