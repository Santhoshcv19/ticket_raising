import 'package:ticket_raising_management/core/common/domain/entity/ticket.entity.dart';

class TicketModel extends TicketEntity {
  const TicketModel({
    super.ref,
    super.category,
    super.channel,
    super.client,
    super.createdBy,
    super.createdAt,
    super.reportedDate,
    super.priority,
    super.sla,
    super.status,
    super.technicalAssingned,
    super.ticketDescription,
    super.ticketId,
    super.clonedFrom,
    super.title,
    super.resolution,
    super.altFlow,
    super.lock,
    super.comment,
    super.startTime,
    super.ticketStatus,
    super.closedAt,
    super.reOpenAt,
    super.resolvedAt,
    super.type,
  });

  factory TicketModel.fromJson(data) {
    Map<String, dynamic> json = data.data() as Map<String, dynamic>;

    return TicketModel(
      ref: data.reference,
      ticketId: json['ticketId'],
      category: json['category'],
      channel: json['channel'],
      client: json['client'],
      createdBy: json['createdBy'],
      createdAt: json['createdAt'],
      reportedDate: json['reportedDate'],
      priority: json['priority'],
      sla: json['sla'],
      ticketStatus: json['ticketStatus'],
      technicalAssingned: json['technicalAssingned'],
      ticketDescription: json['ticketDescription'],
      clonedFrom: json['clonedFrom'],
      title: json['title'],
      lock: Lock.fromJson(json['lock'] ?? {}),
      resolution: json['resolution'],
      altFlow: json['altFlow'],
      startTime: json['startTime'],
      closedAt: json['closedAt'],
      reOpenAt: json['reopenedAt'],
      resolvedAt: json['resolvedAt'],
      type: json['type'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};

    data['category'] = category;
    data['channel'] = channel;
    data['client'] = client;
    data['createdBy'] = createdBy;
    data['createdAt'] = createdAt;
    data['reportedDate'] = reportedDate;
    data['priority'] = priority;
    data['sla'] = sla;
    data['ticketStatus'] = ticketStatus;
    data['technicalAssingned'] = technicalAssingned;
    data['ticketDescription'] = ticketDescription;
    data['ticketId'] = ticketId;
    data['title'] = title;
    data['resolution'] = resolution;
    data['altFlow'] = altFlow;
    data['lock'] = null;
    data['altFlow'] = altFlow;
    data['startTime'] = startTime;
    data['closedAt'] = closedAt;
    data['reopenedAt'] = reOpenAt;
    data['resolvedAt'] = resolvedAt;
    data['type'] = type;
    data['status'] = status ?? true;

    return data;
  }

  Map<String, dynamic> toClone() {
    Map<String, dynamic> data = <String, dynamic>{};

    data['clonedFrom'] = clonedFrom;
    data['title'] = title;
    data['ticketId'] = ticketId;
    data['ticketStatus'] = 1;
    data['startTime'] = null;
    data['closedAt'] = null;
    data['reopenedAt'] = null;
    data['resolvedAt'] = null;
    data['createdAt'] = createdAt;

    return data;
  }
}

class Lock extends LockEntity {
  const Lock({super.lockedAt, super.lockedBy});

  factory Lock.fromJson(Map<String, dynamic> json) {
    return Lock(
      lockedBy: json['lockedBy'],
      lockedAt: json['lockedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};

    data['lockedBy'] = lockedBy;
    data['lockedAt'] = lockedAt;

    return data;
  }
}

class CommentModel extends CommentEntity {
  const CommentModel({
    super.comment,
    super.commentedBy,
    super.createdAt,
    super.ref,
  });

  factory CommentModel.fromJson(data) {
    Map<String, dynamic> json = data.data() as Map<String, dynamic>;

    return CommentModel(
      ref: data.reference,
      commentedBy: json['commentedBy'],
      createdAt: json['createdAt'],
      comment: json['comment'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};

    data['commentedBy'] = commentedBy;
    data['createdAt'] = createdAt;
    data['comment'] = comment;

    return data;
  }
}

class AttachmentModel extends AttachmentEntity {
  const AttachmentModel({super.ref, super.type, super.url, super.fileName});

  factory AttachmentModel.fromJson(data) {
    final json = data.data() as Map<String, dynamic>;

    return AttachmentModel(
      ref: data.reference,
      url: json['url'],
      fileName: json['fileName'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};

    data['url'] = url;
    data['fileName'] = fileName;
    data['type'] = type;

    return data;
  }
}

class ChildModel extends ChildEntity {
  const ChildModel({super.createdAt, super.ref, super.ticketRef, super.status});

  factory ChildModel.fromJson(data) {
    final json = data.data() as Map<String, dynamic>;

    return ChildModel(
      ref: data.reference,
      createdAt: json['createdAt'],
      ticketRef: json['ref'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};

    data['ref'] = ref;
    data['createdAt'] = createdAt;
    data['status'] = true;

    return data;
  }
}

class ResolutionAttachmentModel extends ResolutionAttachmentEntity {
  const ResolutionAttachmentModel({super.type, super.url});
  factory ResolutionAttachmentModel.fromJson(Map<String, dynamic> json) {
    return ResolutionAttachmentModel(
      url: json['url'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};

    data['url'] = url;
    data['type'] = type;

    return data;
  }
}

class LogModel extends LogEntity {
  const LogModel({
    super.ref,
    super.log,
    super.type,
    super.createdAt,
    super.status,
  });

  factory LogModel.fromJson(data) {
    final json = data.data() as Map<String, dynamic>;

    return LogModel(
      ref: data.reference,
      log: json['log'],
      type: json['type'],
      createdAt: json['createdAt'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};

    data['log'] = log;
    data['type'] = type;
    data['createdAt'] = createdAt;
    data['status'] = status;

    return data;
  }
}
