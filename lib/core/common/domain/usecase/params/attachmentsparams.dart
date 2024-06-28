import 'package:equatable/equatable.dart';

class AttachmentParams extends Equatable {
  final String? url;
  final int? type;
  final String? ticketId;

  const AttachmentParams({
    required this.url,
    required this.type,
    required this.ticketId,
  });

  @override
  List<Object?> get props => [];
}
