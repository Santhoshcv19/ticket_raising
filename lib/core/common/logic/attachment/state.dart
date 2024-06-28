import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'state.freezed.dart';

@freezed
class AttachmentsState with _$AttachmentsState {
  const factory AttachmentsState.loading() = AttachmentsStateloading;
  const factory AttachmentsState.initial() = AttachmentsStateinitial;
  const factory AttachmentsState.data() = AttachmentsStatedata;
  const factory AttachmentsState.error() = AttachmentsStateerror;
  const factory AttachmentsState.empty() = AttachmentsStateempty;
}
