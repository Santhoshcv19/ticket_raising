import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ticket_raising_management/core/common/domain/entity/ticket.entity.dart';

part 'state.freezed.dart';

@freezed
class CommentState with _$CommentState {
  const factory CommentState.initial() = CommentStateInitial;
  const factory CommentState.loading() = CommentStateLoading;
  const factory CommentState.data({
    required List<CommentEntity> data,
  }) = CommentStatedata;
  const factory CommentState.empty() = CommentStateEmpty;
  const factory CommentState.error() = CommentStateError;
}
