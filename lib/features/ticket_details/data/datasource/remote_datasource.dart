import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:ticket_raising_management/core/common/data/model/ticket_model.dart';
import 'package:ticket_raising_management/core/common/domain/entity/ticket.entity.dart';
import 'package:ticket_raising_management/core/constants/file.constants.dart';
import 'package:ticket_raising_management/core/utils/url.dart';
import 'package:ticket_raising_management/core/utils/utils.dart';
import 'package:ticket_raising_management/features/ticket_details/domain/usecase/params.dart';
import 'package:ticket_raising_management/services/api.service.dart';
import 'package:ticket_raising_management/services/firebase.service.dart';

abstract class TicketDetailsRemoteDatasource {
  Stream<QuerySnapshot> fetchTickets();
  Future<Stream<DocumentSnapshot>> fetchDetails(String id);
  Future<Map<String, QuerySnapshot>> fetchAttachments(String id);
  Future<Stream<QuerySnapshot>> fetchComments(String id);
  Future<Stream<QuerySnapshot>> fetchLogs(String id);
  Future<Stream<QuerySnapshot>> fetchChildren(String id);
  Future<void> lock(TicketDetailsParams params);
  Future<void> unLock(String id);
  Future<String> cloneTicket(String id);
  Future<void> updateResolution(TicketDetailsParams params);
  Future<void> addComment(TicketDetailsParams params);
  Future<void> linkParentChild(TicketDetailsParams params);
  Future<void> updateTechAssigned(TicketDetailsParams params);
  Future<void> sendEmail(TicketDetailsParams params);
  Future<void> deleteChildren(
    TicketDetailsParams params,
  );
}

class TicketDetailsRemoteDatasourceImpl extends TicketDetailsRemoteDatasource {
  final FirebaseService _firebaseService;
  final Apiservice _apiservice;

  TicketDetailsRemoteDatasourceImpl({
    required FirebaseService firebaseService,
    required Apiservice apiservice,
  })  : _firebaseService = firebaseService,
        _apiservice = apiservice;

  @override
  Stream<QuerySnapshot> fetchTickets() {
    try {
      var stream = _firebaseService.fetchTickets();
      return stream;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Stream<DocumentSnapshot>> fetchDetails(String id) async {
    try {
      var stream = await _firebaseService.fetchDetails(id);
      return stream;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, QuerySnapshot>> fetchAttachments(String id) {
    try {
      final data = _firebaseService.fetchAttachments(id);
      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Stream<QuerySnapshot>> fetchComments(String id) async {
    try {
      final data = await _firebaseService.fetchComments(id);
      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Stream<QuerySnapshot>> fetchLogs(String id) async {
    try {
      final data = _firebaseService.fetchLogs(id);
      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Stream<QuerySnapshot>> fetchChildren(String id) async {
    try {
      final data = _firebaseService.fetchChildren(id);
      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> lock(TicketDetailsParams params) async {
    try {
      final String id = params.ticketId ?? '';

      final data = Lock(
        lockedBy: params.commentedBy,
        lockedAt: Utils.getTimeStamp(),
      ).toJson();
      await _firebaseService.updateTicket(id, {'lock': data});
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> unLock(String id) async {
    try {
      await _firebaseService.updateTicket(id, {'lock': null});
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateResolution(TicketDetailsParams params) async {
    try {
      final String id = params.ticketId ?? '';

      await _firebaseService.updateTicket(id, {
        'resolution': params.resolution,
      });

      if ((params.attachments ?? []).isEmpty) return;

      for (PlatformFile file in params.attachments ?? []) {
        final path = 'images/${params.clientId}/${file.name}';
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
        await _firebaseService.addResolutionAttachments(id, attachment);
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> cloneTicket(String id) async {
    try {
      final data = await _firebaseService.cloneTicket(id);
      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> addComment(TicketDetailsParams params) async {
    try {
      final data = CommentModel(
        commentedBy: params.commentedBy,
        comment: params.comment,
        createdAt: Utils.getTimeStamp(),
      ).toJson();
      await _firebaseService.addComment(params.ticketId, data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> linkParentChild(TicketDetailsParams params) async {
    try {
      final createdAt = Utils.getTimeStamp();
      for (TicketEntity items in params.children ?? []) {
        var data = ChildModel(ref: items.ref, createdAt: createdAt).toJson();
        await _firebaseService.linkParentChild(params.ticketId, data);
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateTechAssigned(TicketDetailsParams params) async {
    try {
      final data = {'technicalAssingned': params.technicalAssingned};
      await _firebaseService.updateTicket(params.ticketId, data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> sendEmail(TicketDetailsParams params) async {
    try {
      final String url = Url.sendEmail;
      Map<String, dynamic> data = {};

      data['emailId'] = params.emailId;
      data['ticketId'] = params.ticketId;
      data['subject'] = params.subject;
      data['description'] = params.description;
      data['createdAt'] = params.ticketDateTime;

      await _apiservice.post(url, data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteChildren(TicketDetailsParams params) async {
    try {
      await _firebaseService.deleteChildren(params.ticketId, params.id);
    } catch (e) {
      rethrow;
    }
  }
}
