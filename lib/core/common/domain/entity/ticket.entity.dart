import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class TicketEntity extends Equatable {
  final DocumentReference? ref;

  final int? category;
  final int? channel;
  final int? client;
  final int? createdBy;
  final int? createdAt;
  final int? reportedDate;
  final int? priority;
  final int? sla;
  final int? startTime;
  final int? closedAt;
  final int? ticketStatus;
  final int? technicalAssingned;
  final String? ticketDescription;
  final String? ticketId;
  final String? clonedFrom;
  final String? title;
  final LockEntity? lock;
  final CommentEntity? comment;
  final String? resolution;
  final String? altFlow;
  final int? reOpenAt;
  final int? resolvedAt;
  final int? type;
  final bool? status;

  const TicketEntity({
    this.ref,
    this.channel,
    this.client,
    this.createdBy,
    this.createdAt,
    this.reportedDate,
    this.priority,
    this.sla,
    this.ticketStatus,
    this.startTime,
    this.closedAt,
    this.technicalAssingned,
    this.ticketDescription,
    this.ticketId,
    this.clonedFrom,
    this.title,
    this.category,
    this.lock,
    this.comment,
    this.resolution,
    this.altFlow,
    this.reOpenAt,
    this.resolvedAt,
    this.type,
    this.status,
  });

  @override
  List<Object?> get props => [ref, ticketId];
}

class LockEntity extends Equatable {
  final int? lockedBy;
  final int? lockedAt;

  const LockEntity({required this.lockedBy, required this.lockedAt});

  @override
  List<Object?> get props => [lockedBy, lockedAt];
}

class AttachmentEntity extends Equatable {
  final DocumentReference? ref;
  final String? url;
  final String? fileName;
  final int? type;

  const AttachmentEntity({
    required this.ref,
    required this.url,
    required this.fileName,
    required this.type,
  });

  @override
  List<Object?> get props => [ref];
}

class CommentEntity extends Equatable {
  final DocumentReference? ref;
  final int? createdAt;
  final int? commentedBy;
  final String? comment;

  const CommentEntity({
    required this.ref,
    required this.createdAt,
    this.commentedBy,
    this.comment,
  });

  @override
  List<Object?> get props => [ref, comment];
}

class ChildEntity extends Equatable {
  final DocumentReference? ref;
  final DocumentReference? ticketRef;
  final int? createdAt;
  final bool? status;

  const ChildEntity({
    required this.ref,
    required this.ticketRef,
    required this.createdAt,
    required this.status,
  });

  @override
  List<Object?> get props => [ref];
}

class LogEntity extends Equatable {
  final DocumentReference? ref;
  final String? log;
  final int? type;
  final int? createdAt;
  final bool? status;

  const LogEntity({this.ref, this.log, this.type, this.createdAt, this.status});

  @override
  List<Object?> get props => [log, type];
}

class ResolutionAttachmentEntity extends Equatable {
  final String? url;
  final int? type;

  const ResolutionAttachmentEntity({required this.url, required this.type});

  @override
  List<Object?> get props => [url];
}
