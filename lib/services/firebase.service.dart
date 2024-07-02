import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:ticket_raising_management/core/common/data/model/ticket_model.dart';
import 'package:ticket_raising_management/core/controller/master.controller.dart' as trm;
import 'package:get/get.dart';
import 'package:ticket_raising_management/core/utils/utils.dart';
// import 'package:ticket_raising_management/features/users/data/model/user.model.dart';
// import 'package:ticket_raising_management/features/users/data/model/user.model.dart';
// import 'package:ticket_raising_management/features/users/domain/entity/user.entity.dart';

abstract class FirebaseService {
  Stream<QuerySnapshot> fetchTickets();
  Map<String, Stream<QuerySnapshot>> fetchMasters();

  Future<void> addAttachments(String? id, Map<String, dynamic> data);
  Future<String> uploadFiles(PlatformFile file, String path);
  Future<String> getTicketId(int? id);

  Future<String> addTicket(Map<String, dynamic> data);
  Future<void> updateTicket(String? id, Map<String, dynamic> data);
  Future<void> updateTicketStatus(String? id, Map<String, dynamic> data);

  Future<Stream<DocumentSnapshot>> fetchDetails(String id);
  Future<Map<String, QuerySnapshot>> fetchAttachments(String id);
  Future<Stream<QuerySnapshot>> fetchComments(String id);
  Future<Stream<QuerySnapshot>> fetchLogs(String id);
  Future<Stream<QuerySnapshot>> fetchChildren(String id);

  Future<String> cloneTicket(String? id);
  Future<void> addComment(String? id, Map<String, dynamic> data);
  Future<void> linkParentChild(String? id, Map<String, dynamic> data);
  Future<void> addResolutionAttachments(String? id, Map<String, dynamic> data);

  Future<void> deleteTicket(String? id);

  Future<void> deleteFile(String? url);

  Future<void> deleteChildren(String? id, String? ticketId);
  Stream<QuerySnapshot> fetchUsers();
}

class FirebaseServiceImpl implements FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  CollectionReference get _masterCollection {
    return _firestore.collection('Masters');
  }

  CollectionReference get _ticketCollection {
    return _firestore.collection('Tickets');
  }

  CollectionReference get _clientCollections {
    return _firestore.collection('Clients');
  }

  CollectionReference get _userCollection {
    return _firestore.collection('Users');
  }

  CollectionReference get _foodCollection {
    return _firestore.collection('Food');
  }

  CollectionReference get _orderCollection {
    return _firestore.collection('Orders');
  }

  CollectionReference get _complaints {
    return _firestore.collection('Complaints');
  }

  Future<DocumentSnapshot> fetchUser(String? id) async {
    final document = await _userCollection.doc(id).get();

    if (document.exists) return document;
    throw false;
  }

  @override
  Stream<QuerySnapshot> fetchUsers() {
    final data = _userCollection.orderBy('id');
    return data.snapshots();
  }

  @override
  Future<void> addAttachments(String? id, Map<String, dynamic> data) async {
    try {
      final collection = _ticketCollection.doc(id).collection('attachments');
      await collection.add(data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Stream<DocumentSnapshot>> fetchDetails(String id) async {
    try {
      final query = _ticketCollection.where('ticketId', isEqualTo: id);
      var collection = await query.limit(1).get();
      if (collection.docs.isEmpty) throw 'No Document found';
      var documentId = collection.docs.first.id;
      return _ticketCollection.doc(documentId).snapshots();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, QuerySnapshot>> fetchAttachments(String id) async {
    try {
      final query = _ticketCollection.where('ticketId', isEqualTo: id);
      var collection = await query.limit(1).get();
      if (collection.docs.isEmpty) throw 'No Document found';
      var documentId = collection.docs.first.id;

      final doc = _ticketCollection.doc(documentId);

      var attachments = await doc.collection('attachments').get();
      var resolution = await doc.collection('resolutionAttachments').get();

      Map<String, QuerySnapshot> data = {};

      data['attachments'] = attachments;
      data['resolution'] = resolution;

      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Map<String, Stream<QuerySnapshot>> fetchMasters() {
    var priority = _masterCollection.doc('priority').collection('data');
    var ticketStatus = _masterCollection.doc('ticketStatus').collection('data');
    var category = _masterCollection.doc('category').collection('data');
    var type = _masterCollection.doc('type').collection('data');
    // var channel = _masterCollection.doc('channel').collection('data');
    // var compCategory = _masterCollection.doc('complaints').collection('data');
    // var channel = _masterCollection.doc('channel').collection('data');
    // var compCategory = _masterCollection.doc('complaints').collection('data');

    Map<String, Stream<QuerySnapshot>> data = {};

    data['masters'] = _masterCollection.orderBy('id').snapshots();

    data['priority'] =
        priority.where('status', isEqualTo: true).orderBy('id').snapshots();

    data['ticketStatus'] =
        ticketStatus.where('status', isEqualTo: true).orderBy('id').snapshots();

    data['category'] =
        category.where('status', isEqualTo: true).orderBy('id').snapshots();

    data['type'] =
        type.where('status', isEqualTo: true).orderBy('id').snapshots();

    // data['channel'] =
    //     channel.where('status', isEqualTo: true).orderBy('id').snapshots();

    final collection = _userCollection.where('status', isEqualTo: true);
    data['techAssigned'] = collection.orderBy('id').snapshots();

    // final query1 = compCategory.where('status', isEqualTo: true);
    // data['complaint'] = query1.orderBy('id').snapshots();

    final query2 = _clientCollections.where('status', isEqualTo: true);
    data['clients'] = query2.orderBy('id').snapshots();

    return data;
  }

  @override
  Future<void> deleteChildren(String? ticketId, String? id) async {
    try {
      var data = _ticketCollection.doc(ticketId).collection('children').doc(id);
      await data.delete();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Stream<QuerySnapshot>> fetchComments(String id) async {
    final query = _ticketCollection.where('ticketId', isEqualTo: id);
    var collection = await query.limit(1).get();
    if (collection.docs.isEmpty) throw 'No Document found';
    var documentId = collection.docs.first.id;

    final doc = _ticketCollection.doc(documentId);
    final stream = doc.collection('comments').orderBy('createdAt').snapshots();
    return stream;
  }

  @override
  Future<Stream<QuerySnapshot>> fetchChildren(String id) async {
    final query = _ticketCollection.where('ticketId', isEqualTo: id);
    var collection = await query.limit(1).get();
    if (collection.docs.isEmpty) throw 'No Document found';
    var documentId = collection.docs.first.id;

    final doc = _ticketCollection.doc(documentId);
    final stream = doc.collection('children').snapshots();
    return stream;
  }

  @override
  Future<Stream<QuerySnapshot>> fetchLogs(String id) async {
    final query = _ticketCollection.where('ticketId', isEqualTo: id);
    var collection = await query.limit(1).get();
    if (collection.docs.isEmpty) throw 'No Document found';
    var documentId = collection.docs.first.id;

    final doc = _ticketCollection.doc(documentId);
    final stream = doc.collection('logs').orderBy('createdAt').snapshots();
    return stream;
  }

  @override
  Stream<QuerySnapshot> fetchTickets() {
    final collection = _ticketCollection.orderBy('createdAt', descending: true);
    return collection.where('status', isEqualTo: true).snapshots();
  }

  @override
  Future<String> addTicket(Map<String, dynamic> data) async {
    try {
      var doc = await _ticketCollection.add(data);
      return doc.id;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteTicket(String? id) async {
    if (id == null) throw 'Invalid Id';
    final doc = _ticketCollection.doc(id);

    final lis1 = await doc.collection('resolutionAttachments').get();
    final list2 = await doc.collection('attachments').get();

    final data1 = lis1.docs.map((e) => AttachmentModel.fromJson(e));
    final data2 = list2.docs.map((e) => AttachmentModel.fromJson(e));

    for (var item in data1) {
      if (item.url == null) continue;
      final ref = _storage.refFromURL(item.url!);
      await ref.delete();
    }

    for (var item in data2) {
      if (item.url == null) continue;
      final ref = _storage.refFromURL(item.url!);
      await ref.delete();
    }

    await _ticketCollection.doc(id).delete();
  }

  @override
  Future<String> uploadFiles(PlatformFile file, String path) async {
    try {
      final ref = _storage.ref(path);
      final uploadTask = await ref.putData(file.bytes!);
      final url = await uploadTask.ref.getDownloadURL();
      return url;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateTicket(String? id, Map<String, dynamic> data) async {
    await _ticketCollection.doc(id).update(data);
  }

  @override
  Future<void> updateTicketStatus(String? id, Map<String, dynamic> data) async {
    await _ticketCollection.doc(id).update(data);
    var doc = await _ticketCollection.doc(id).collection('children').get();
    if (doc.docs.isEmpty) return;
    for (var item in doc.docs) {
      final child = ChildModel.fromJson(item);
      await _ticketCollection.doc(child.ticketRef?.id).update(data);
    }
  }

  @override
  Future<String> getTicketId(int? id) async {
    try {
      final query = _ticketCollection.where('client', isEqualTo: id);

      final client =
          trm.masterController.client.firstWhereOrNull((e) => e.masterId == id);
      final String code =
          (client?.value?.toUpperCase() ?? 'UNK').substring(0, 3);

      final document = await query.orderBy('createdAt').limitToLast(1).get();
      if (document.docs.isEmpty) return '${code}1';

      final data = document.docs.first;
      final ticket = TicketModel.fromJson(data);

      String oldId = (ticket.ticketId ?? '').split(code).last;
      int newId = (int.tryParse(oldId) ?? 0) + 1;

      return '$code$newId';
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> cloneTicket(String? id) async {
    final document = await _ticketCollection.doc(id).get();
    if (!document.exists) return '';

    final oldTicket = TicketModel.fromJson(document);
    final String newId = await getTicketId(oldTicket.client);

    final update = TicketModel(
            clonedFrom: oldTicket.ticketId,
            title: 'Copy of ${oldTicket.title}',
            ticketId: newId,
            createdAt: Utils.getTimeStamp())
        .toClone();

    final data = await _ticketCollection.add(document.data());
    final String newTicketId = data.id;

    await _ticketCollection.doc(newTicketId).update(update);

    final oldTicketDoc = _ticketCollection.doc(oldTicket.ticketId);
    final newTicketDoc = _ticketCollection.doc(newTicketId);

    final attachment = await oldTicketDoc.collection('attachments').get();
    final commets = await oldTicketDoc.collection('comments').get();

    if (attachment.docs.isEmpty) return newId;

    for (var item in attachment.docs) {
      var doc = await oldTicketDoc.collection('attachments').doc(item.id).get();
      if (!doc.exists) continue;
      await newTicketDoc.collection('attachments').add(doc.data()!);
    }

    if (commets.docs.isEmpty) return newId;

    for (var item in commets.docs) {
      var doc = await oldTicketDoc.collection('commets').doc(item.id).get();
      if (!doc.exists) continue;
      await newTicketDoc.collection('commets').add(doc.data()!);
    }

    return newId;
  }

  @override
  Future<void> addComment(String? id, Map<String, dynamic> data) async {
    final collection = _ticketCollection.doc(id).collection('comments');
    await collection.add(data);
  }

  @override
  Future<void> linkParentChild(String? id, Map<String, dynamic> data) async {
    final collection = _ticketCollection.doc(id).collection('children');
    await collection.add(data);
  }

  @override
  Future<void> addResolutionAttachments(
    String? id,
    Map<String, dynamic> data,
  ) async {
    final collection =
        _ticketCollection.doc(id).collection('resolutionAttachments');
    await collection.add(data);
  }

  @override
  Future<void> deleteFile(String? url) async {
    if (url == null) throw 'Invalid URL';
    final ref = _storage.refFromURL(url);
    await ref.delete();
  }
}
