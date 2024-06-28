import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:ticket_raising_management/core/common/data/model/ticket_model.dart';
import 'package:ticket_raising_management/core/common/domain/entity/ticket.entity.dart';
import 'package:ticket_raising_management/core/constants/file.constants.dart';
import 'package:ticket_raising_management/features/tickets/domain/usecase/params.dart';
import 'package:ticket_raising_management/services/firebase.service.dart';

abstract class TicketRemoteDataSource {
  Stream<QuerySnapshot> fetchTickets();
  Future<void> addTicket(TicketParams params);
  Future<void> updateTicket(TicketParams params);
  Future<void> deleteTicket(TicketParams params);
}

class TicketRemoteDataSourceImpl implements TicketRemoteDataSource {
  final FirebaseService _firebaseService;

  TicketRemoteDataSourceImpl({
    required FirebaseService firebaseService,
  }) : _firebaseService = firebaseService;

  @override
  Stream<QuerySnapshot> fetchTickets() {
    try {
      final data = _firebaseService.fetchTickets();
      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> addTicket(TicketParams params) async {
    try {
      final ticketId = await _firebaseService.getTicketId(params.client);

      var data = TicketModel(
        ticketId: ticketId,
        title: params.title,
        priority: params.priority,
        category: params.category,
        technicalAssingned: params.technicalAssingned,
        client: params.client,
        sla: params.sla,
        ticketStatus: params.ticketStatus,
        ticketDescription: params.ticketDescription,
        createdAt: params.createdAt,
        channel: params.channel,
        altFlow: params.altflow,
        type: params.type,
        createdBy: params.createdBy,
      ).toJson();

      final id = await _firebaseService.addTicket(data);

      if ((params.attachments ?? []).isEmpty) return;

      for (PlatformFile file in params.attachments ?? []) {
        final path = 'images/${params.client}/${file.name}';
        final url = await _firebaseService.uploadFiles(file, path);
        int fileType;
        final type = file.name.split('.').last;
        if (FileConstants.images.contains(type)) {
          fileType = 1;
        } else if (FileConstants.video.contains(type)) {
          fileType = 2;
        } else if (FileConstants.audio.contains(type)) {
          fileType = 3;
        } else if (FileConstants.files.contains(type)) {
          fileType = 4;
        } else {
          fileType = 5;
        }
        final attachment = AttachmentModel(
          url: url,
          fileName: file.name,
          type: fileType,
        ).toJson();
        await _firebaseService.addAttachments(id, attachment);
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateTicket(TicketParams params) async {
    try {
      var data = TicketModel(
        ticketId: params.ticketId,
        title: params.title,
        priority: params.priority,
        category: params.category,
        technicalAssingned: params.technicalAssingned,
        client: params.client,
        sla: params.sla,
        ticketStatus: params.ticketStatus,
        ticketDescription: params.ticketDescription,
        createdAt: params.createdAt,
        channel: params.channel,
        altFlow: params.altflow,
        type: params.type,
      ).toJson();

      await _firebaseService.updateTicket(params.documentId, data);

      for (AttachmentEntity item in params.updateAttachments ?? []) {
        await _firebaseService.deleteFile(item.url);
        await item.ref?.delete();
      }

      for (PlatformFile file in params.attachments ?? []) {
        final path = 'images/${params.client}/${file.name}';
        final url = await _firebaseService.uploadFiles(file, path);
        int fileType;
        final type = file.name.split('.').last;
        if (FileConstants.images.contains(type)) {
          fileType = 1;
        } else if (FileConstants.video.contains(type)) {
          fileType = 2;
        } else if (FileConstants.audio.contains(type)) {
          fileType = 3;
        } else if (FileConstants.files.contains(type)) {
          fileType = 4;
        } else {
          fileType = 5;
        }
        final attachment = AttachmentModel(url: url, type: fileType).toJson();
        await _firebaseService.addAttachments(params.documentId, attachment);
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteTicket(TicketParams params) async {
    try {
      await _firebaseService.deleteTicket(params.documentId);
    } catch (e) {
      rethrow;
    }
  }
}
