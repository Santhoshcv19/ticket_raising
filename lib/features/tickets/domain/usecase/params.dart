import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:ticket_raising_management/core/common/domain/entity/ticket.entity.dart';

class TicketParams extends Equatable {
  final int? category;
  final int? channel;
  final int? client;
  final int? createdBy;
  final int? createdAt;
  final int? reportedDate;
  final int? priority;
  final int? sla;
  final int? ticketStatus;
  final int? technicalAssingned;
  final String? ticketDescription;
  final String? ticketId;
  final String? title;
  final int? type;
  final List<PlatformFile>? attachments;
  final List<AttachmentEntity>? updateAttachments;
  final String? documentId;

  final String? altflow;

  const TicketParams({
    this.documentId,
    this.channel,
    this.client,
    this.createdBy,
    this.createdAt,
    this.reportedDate,
    this.priority,
    this.sla,
    this.ticketStatus,
    this.technicalAssingned,
    this.ticketDescription,
    this.ticketId,
    this.title,
    this.category,
    this.attachments,
    this.updateAttachments,
    this.altflow,
    this.type,
  });

  @override
  List<Object?> get props => [documentId];
}
