import 'package:equatable/equatable.dart';

class StatusParams extends Equatable {
  final String? ticketId;
  final int? status;
  final int? startTime;
  final int? closedAt;
  final int? reOpenAt;
  final int? resolvedAt;

  const StatusParams({
    required this.startTime,
    required this.ticketId,
    required this.status,
    required this.closedAt,
    required this.reOpenAt,
    required this.resolvedAt,
  });

  @override
  List<Object?> get props => [];
}
