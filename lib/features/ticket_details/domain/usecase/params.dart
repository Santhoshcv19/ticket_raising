import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:ticket_raising_management/core/common/domain/entity/ticket.entity.dart';

class TicketDetailsParams extends Equatable {
  final String? id;
  final String? ticketId;
  final int? clientId;
  final String? comment;
  final int? commentedBy;
  final int? commemtedOn;
  final List<TicketEntity>? children;
  final List<PlatformFile>? attachments;
  final String? resolution;
  final int? technicalAssingned;
  final String? emailId;
  final String? subject;
  final String? description;
  final int? createdAt;
  final String? ticketDateTime;

  const TicketDetailsParams({
    this.id,
    this.ticketId,
    this.clientId,
    this.comment,
    this.commemtedOn,
    this.commentedBy,
    this.children,
    this.attachments,
    this.resolution,
    this.technicalAssingned,
    this.emailId,
    this.subject,
    this.description,
    this.createdAt,
    this.ticketDateTime,
  });

  @override
  List<Object?> get props => [ticketId];
}
