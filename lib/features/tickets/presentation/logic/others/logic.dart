import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/common/domain/entity/ticket.entity.dart';
import 'package:ticket_raising_management/core/controller/app_data.controller.dart';

final ticketLogic = ChangeNotifierProvider((ref) => TicketLogic());

class TicketLogic extends ChangeNotifier {
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  late TabController controller;

  TicketEntity? ticketEntity;

  final List<TicketEntity> _tickets = [];

  set setTickets(List<TicketEntity> tickets) {
    int? userId = appController.user?.iD;
    String? client = appController.organizationId;
    _tickets.clear();
    _tickets.addAll(tickets.where((e) {
      return '${e.client}' == client && e.createdBy == userId;
    }));
    notifyListeners();
  }

  int? type;
  final ScrollController scrollController = ScrollController();
  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController comments = TextEditingController();
  final TextEditingController resolutionText = TextEditingController();
  final TextEditingController altflow = TextEditingController();

  List<AttachmentEntity> attachemnts = [];

  int? priority;
  int? category;
  int? techAssigned;
  int? client;
  DateTime reportedDate = DateTime.now();
  bool isClick = false;

  void clearFields() {
    type = null;
    title.clear();
    description.clear();
    comments.clear();
    resolutionText.clear();
    altflow.clear();
    priority = null;
    category = null;
    techAssigned = null;
    client = null;
    reportedDate = DateTime.now();
  }

  void onDateSelected(DateTime picked) {
    reportedDate = picked;
    notifyListeners();
  }

  void onType(int? data) {
    if (data == null) return;
    type = data;
    notifyListeners();
  }

  void onPriority(int? data) {
    if (data == null) return;
    priority = data;
    notifyListeners();
  }

  void onCategory(int? data) {
    if (data == null) return;
    category = data;
    notifyListeners();
  }

  void onTechAssigned(int? data) {
    if (data == null) return;
    techAssigned = data;
    notifyListeners();
  }

  void onclient(int? data) {
    if (data == null) return;
    client = data;
    notifyListeners();
  }

  void onReportedDate(DateTime dateTime) {
    reportedDate = dateTime;
    notifyListeners();
  }

  void onClickHere() {
    isClick = true;
    notifyListeners();
  }

  List<TicketEntity> get all {
    return _tickets.where((e) => (e.status ?? false)).toList();
  }

  List<TicketEntity> get open {
    return _tickets.where((e) {
      return (e.ticketStatus == 1 || e.ticketStatus == 5);
    }).toList();
  }

  List<TicketEntity> get resolved {
    return _tickets.where((e) => (e.ticketStatus == 3)).toList();
  }

  List<TicketEntity> get closed {
    return _tickets.where((e) => (e.ticketStatus == 4)).toList();
  }
}
