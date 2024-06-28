import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/common/domain/entity/ticket.entity.dart';
import 'package:ticket_raising_management/core/common/logic/provider.dart';
import 'package:ticket_raising_management/core/utils/utils.dart';
import 'package:ticket_raising_management/features/ticket_details/domain/usecase/params.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/provider.dart';
import 'package:ticket_raising_management/features/tickets/presentation/logic/provider.dart';

final ticketDetailsLogic = ChangeNotifierProvider(
  (ref) => TicketDetailsLogic(ref: ref),
);

class TicketDetailsLogic extends ChangeNotifier {
  final Ref _ref;

  TicketDetailsLogic({required Ref ref}) : _ref = ref;

  List<TicketEntity> get source =>
      _ref.read(fetchTicketNotifier).whenOrNull(data: (data) => data ?? []) ??
      [];

  TicketEntity? data;

  TicketEntity? parent;
  List<TicketEntity> child = [];
  late TabController controller;

  bool enableSave = false;

  final SearchController parentController = SearchController();
  final SearchController childController = SearchController();

  final TextEditingController resolution = TextEditingController();
  final TextEditingController comments = TextEditingController();

  final TextEditingController search = TextEditingController();
  final TextEditingController to = TextEditingController();
  final TextEditingController subject = TextEditingController();
  final TextEditingController mailDescription = TextEditingController();

  void onData(TicketEntity? ticket) {
    data = ticket;
    resolution.text = data?.resolution ?? '';
    notifyListeners();
  }

  void linkParent(TicketEntity? data) {
    parent = data;
    if (parentController.isOpen) parentController.closeView('');
    notifyListeners();
  }

  void linkChild(TicketEntity? data) {
    if (data == null) return;
    if (child.contains(data)) return;
    child.add(data);
    if (childController.isOpen) childController.closeView('');
    notifyListeners();
  }

  void removeChild(TicketEntity? data) {
    if (data == null) return;
    child.remove(data);
    notifyListeners();
  }

  void removeParent(TicketEntity? data) {
    if (data != null) parent = null;
    notifyListeners();
  }

  void onResolutionChange() {
    final String r1 = data?.resolution ?? '';
    final String r2 = resolution.text;

    if (r1 != r2) enableSave = true;
    if (r1 == r2) enableSave = false;

    final files = _ref.read(fileNotifier).whenOrNull(file: (data) => data);
    if ((files ?? []).isNotEmpty && !enableSave) enableSave = true;

    notifyListeners();
  }

  void onFilesPicked(List<PlatformFile>? files) {
    if ((files ?? []).isEmpty) {
      if (enableSave) enableSave = false;
      final String r1 = data?.resolution ?? '';
      final String r2 = resolution.text;
      if (r1 != r2) enableSave = true;
      return notifyListeners();
    }

    enableSave = true;
    notifyListeners();
  }

  void onCancel() {
    resolution.text = data?.resolution ?? '';
    final notifier = _ref.read(fileNotifier.notifier);
    final files = _ref.read(fileNotifier).whenOrNull(file: (data) => data);
    if ((files ?? []).isNotEmpty) notifier.removeAll();
    enableSave = false;
    notifyListeners();
  }

  Future<void> onSave() async {
    final notifier = _ref.read(ticketActionNotifier.notifier);

    final files = _ref.read(fileNotifier).whenOrNull(file: (data) => data);

    final params = TicketDetailsParams(
      ticketId: data?.ref?.id,
      resolution: resolution.text,
      attachments: files,
    );

    await notifier.updateResolution(params);
    Utils.toast('Saved Successfully!!!');
  }

  void clearFields() {
    to.clear();
    subject.clear();
    mailDescription.clear();
  }
}
