import 'package:get/get.dart';
import 'package:ticket_raising_management/core/common/domain/entity/master.entity.dart';

final DataMastersController masterController = Get.put(DataMastersController());

class DataMastersController extends GetxController {
  List<MasterEntity> _priority = [];
  List<MasterEntity> _ticketStatus = [];
  List<MasterEntity> _category = [];
  List<MasterEntity> _type = [];
  List<MasterEntity> _channel = [];
  List<MasterEntity> _complaintCategory = [];

  List<MasterEntity> _client = [];
  List<MasterEntity> _users = [];

  List<MasterEntity> _masters = [];
  List<MasterEntity> _masterStatus = [];

  List<MasterEntity> get priority => _priority;
  List<MasterEntity> get ticketStatus => _ticketStatus;
  List<MasterEntity> get category => _category;
  List<MasterEntity> get type => _type;
  List<MasterEntity> get channel => _channel;
  List<MasterEntity> get complaintCategory => _complaintCategory;

  List<MasterEntity> get client => _client;
  List<MasterEntity> get users => _users;

  List<MasterEntity> get masters => _masters;
  List<MasterEntity> get masterStatus => _masterStatus;

  List<MasterEntity> get foodType {
    return const [
      MasterEntity(value: 'Veg', masterId: 1),
      MasterEntity(value: 'Non - Veg', masterId: 2),
    ];
  }

  set setPriority(List<MasterEntity> data) => _priority = data;
  set setTicketStatus(List<MasterEntity> data) => _ticketStatus = data;
  set setCategory(List<MasterEntity> data) => _category = data;
  set setType(List<MasterEntity> data) => _type = data;
  set setChannel(List<MasterEntity> data) => _channel = data;
  set setCompCategory(List<MasterEntity> data) => _complaintCategory = data;

  set setClient(List<MasterEntity> data) => _client = data;
  set setUsers(List<MasterEntity> data) => _users = data;

  set setMasters(List<MasterEntity> data) => _masters = data;
  set setMasterStatus(List<MasterEntity> data) => _masterStatus = data;

  String parsePriority(int? id) {
    final data = _priority.firstWhereOrNull((e) => e.masterId == id);
    return data?.value ?? '';
  }

  String parseStatus(int? id) {
    final data = _ticketStatus.firstWhereOrNull((e) => e.masterId == id);
    return data?.value ?? '';
  }

  String parseCategory(int? id) {
    final data = _category.firstWhereOrNull((e) => e.masterId == id);
    return data?.value ?? '';
  }

  String parseType(int? id) {
    final data = _type.firstWhereOrNull((e) => e.masterId == id);
    return data?.value ?? '';
  }

  String parseChannel(int? id) {
    final data = _channel.firstWhereOrNull((e) => e.masterId == id);
    return data?.value ?? '';
  }

  String parseClient(int? id) {
    final data = _client.firstWhereOrNull((e) => e.masterId == id);
    return data?.value ?? '';
  }

  String parseUser(int? id) {
    if (id == null) return 'Not Yet Assigned';
    final data = _users.firstWhereOrNull((e) => e.masterId == id);
    return data?.value ?? '';
  }

  String parseFoodType(int? id) {
    final data = foodType.firstWhereOrNull((e) => e.masterId == id);
    return data?.value ?? '';
  }

  String parseComplaintCategory(int? id) {
    final data = _complaintCategory.firstWhereOrNull((e) => e.masterId == id);
    return data?.value ?? '';
  }
}
