import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
class EmailState with _$EmailState {
  const factory EmailState.initial() = EmailStateInitial;
  const factory EmailState.loading() = EmailStateLoading;
  const factory EmailState.empty() = EmailStateEmpty;
  const factory EmailState.data() = EmailStateData;
  const factory EmailState.error() = EmailStateErrror;
}
