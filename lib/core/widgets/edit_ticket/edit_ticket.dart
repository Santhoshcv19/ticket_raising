// ignore_for_file: unused_result

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:ticket_raising_management/core/common/domain/entity/ticket.entity.dart';
import 'package:ticket_raising_management/core/common/logic/provider.dart';
import 'package:ticket_raising_management/core/controller/app_data.controller.dart';
import 'package:ticket_raising_management/core/controller/master.controller.dart';
import 'package:ticket_raising_management/core/styles/border_radius.style.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';
import 'package:ticket_raising_management/core/styles/dimenstions.style.dart';
import 'package:ticket_raising_management/core/utils/buttons/primary_button.dart';
import 'package:ticket_raising_management/core/utils/textfields/form.dart';
import 'package:ticket_raising_management/core/utils/texts/sub_body.text.dart';
import 'package:ticket_raising_management/core/utils/texts/sub_caption.text.dart';
import 'package:ticket_raising_management/core/utils/utils.dart';
import 'package:ticket_raising_management/core/widgets/create_ticket/alt_flow.dart';
import 'package:ticket_raising_management/core/widgets/create_ticket/attach_evidence.dart';
import 'package:ticket_raising_management/core/widgets/create_ticket/dropdown.dart';
import 'package:ticket_raising_management/core/widgets/date_picker.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/provider.dart';
import 'package:ticket_raising_management/features/tickets/domain/usecase/params.dart';
import 'package:ticket_raising_management/features/tickets/presentation/logic/others/logic.dart';
import 'package:ticket_raising_management/features/tickets/presentation/logic/provider.dart';

class EditTicket extends ConsumerStatefulWidget {
  final TicketEntity data;

  const EditTicket({super.key, required this.data});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditTicketState();
}

class _EditTicketState extends ConsumerState<EditTicket> {
  @override
  void initState() {
    final provider = ref.read(ticketLogic);
    final notifier = ref.refresh(attachmentsNotifier.notifier);
    ref.refresh(fileNotifier.notifier);

    Future.microtask(() => notifier.fetchAttachmentFiles(widget.data.ticketId));

    provider.title.text = widget.data.title ?? '';
    provider.category = widget.data.category ?? 0;
    provider.altflow.text = widget.data.altFlow ?? '';
    provider.client = widget.data.client ?? 0;
    provider.type = widget.data.type;
    provider.description.text = widget.data.ticketDescription ?? '';
    provider.priority = widget.data.priority ?? 0;
    provider.techAssigned = widget.data.technicalAssingned ?? 0;
    provider.altflow.text = widget.data.altFlow ?? '';
    if ((widget.data.altFlow ?? '').isNotEmpty) provider.isClick = true;
    final reportedDate = Utils.convertDateTime(widget.data.reportedDate);
    if (reportedDate == null) return;
    provider.reportedDate = reportedDate;

    super.initState();
  }

  void _onUpdate() async {
    final fileProvider = ref.read(fileNotifier);
    final provider = ref.read(ticketLogic);
    final notifier = ref.read(updateTicketNotifier.notifier);

    if (provider.type == null) return Utils.toast('Type required');

    final validate = provider.key.currentState?.validate() ?? false;

    if (!validate) return;

    if (provider.priority == null) return Utils.toast('Priority required');
    if (provider.category == null) return Utils.toast('Category required');
    if (provider.techAssigned == null) {
      return Utils.toast('Technical Assigned required');
    }
    if (provider.client == null) return Utils.toast('Client required');

    final files = fileProvider.whenOrNull(file: (data) => data);

    int sla = 0;
    // int sla = masterController.priority.firstWhere((provider.priority) => );

    for (int i = 0; i <= masterController.priority.length; i++) {
      if (provider.priority == masterController.priority[i].masterId) {
        sla = masterController.priority[i].slaTime ?? 0;
      }
    }

    // if (provider.priority == 1) sla = 60;
    // if (provider.priority == 2) sla = 30;
    // if (provider.priority == 3) sla = 15;

    final user = appController.user;

    var params = TicketParams(
      ticketId: widget.data.ticketId,
      documentId: widget.data.ref?.id,
      type: provider.type,
      title: provider.title.text,
      ticketDescription: provider.description.text,
      priority: provider.priority,
      category: provider.category,
      technicalAssingned: provider.techAssigned,
      client: provider.client,
      sla: sla,
      ticketStatus: 1,
      reportedDate: provider.reportedDate.millisecondsSinceEpoch,
      createdAt: Utils.getTimeStamp(),
      channel: 4,
      attachments: files,
      updateAttachments: provider.attachemnts,
      altflow: provider.altflow.text,
      createdBy: user?.iD,
    );

    await notifier.updateTicket(params);
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.read(ticketLogic);
    final logic = ref.watch(ticketLogic);

    ref.listen(attachmentsNotifier, (previous, next) {
      next.whenOrNull(
        loading: () => Utils.showLoader(context),
        files: (data, attachments) {
          Utils.dismissLoader(context);
          ref.read(fileNotifier.notifier).addFile(data);
          provider.attachemnts = attachments;
        },
        error: () => Utils.dismissLoader(context),
      );
    });

    ref.listen(updateTicketNotifier, (previous, next) {
      next.whenOrNull(
        loading: () => Utils.showLoader(context),
        data: () {
          Utils.dismissLoader(context);
          navigator?.pop();
        },
        error: () {
          Utils.dismissLoader(context);
          Utils.toast('Error Update Ticket');
        },
      );
    });

    return Card(
      shape: const RoundedRectangleBorder(),
      elevation: 0,
      margin: Dimen.verticalMargin,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Form(
        key: provider.key,
        child: ListView(padding: Dimen.scaffoldMargin, children: [
          const Row(children: [
            AppSubBodyText(data: 'Update Ticket', fontWeight: FontWeight.bold),
            Spacer(),
            CloseButton(),
          ]),
          const SizedBox(height: Dimen.space * 4),
          const AppSubCaptionText(data: 'TYPE'),
          const SizedBox(height: Dimen.space),
          CreateTicketDropdown(
            items: masterController.type,
            value: logic.type,
            flex: 2,
            onChanged: provider.onType,
          ),
          const SizedBox(height: Dimen.space * 2),
          const AppSubCaptionText(data: 'TICKET TITLE'),
          const SizedBox(height: Dimen.space),
          AppFormField(
            controller: provider.title,
            contentPadding: Dimen.textMargin,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.grey300),
            ),
            validator: (value) {
              if ((value ?? '').isEmpty) return 'Required';
              return null;
            },
          ),
          const SizedBox(height: Dimen.space * 2),
          const AppSubCaptionText(data: 'TICKET DESCRIPTION'),
          const SizedBox(height: Dimen.space),
          AppFormField(
            controller: provider.description,
            contentPadding: Dimen.textMargin,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.grey300),
            ),
            minLines: 8,
            maxLines: 16,
          ),
          const SizedBox(height: Dimen.space * 2),
          const AppSubCaptionText(data: 'ATTACH EVIDENCE'),
          const SizedBox(height: Dimen.space),
          const AttachEvidence(),
          const SizedBox(height: Dimen.space * 2),
          const AppSubCaptionText(data: 'PRIORITY'),
          CreateTicketDropdown(
            items: masterController.priority,
            value: logic.priority,
            onChanged: provider.onPriority,
          ),
          const SizedBox(height: Dimen.space * 2),
          const AppSubCaptionText(data: 'CATEGORY'),
          const SizedBox(height: Dimen.space),
          CreateTicketDropdown(
            items: masterController.category,
            value: logic.category,
            onChanged: provider.onCategory,
          ),
          const SizedBox(height: Dimen.space * 2),
          const AppSubCaptionText(data: 'TECHNICAL ASSIGNED'),
          const SizedBox(height: Dimen.space),
          CreateTicketDropdown(
            items: masterController.users,
            value: logic.techAssigned,
            flex: 2,
            onChanged: provider.onTechAssigned,
          ),
          const SizedBox(height: Dimen.space * 2),
          const AppSubCaptionText(data: 'CLIENT'),
          const SizedBox(height: Dimen.space),
          CreateTicketDropdown(
            items: masterController.client,
            value: logic.client,
            flex: 2,
            onChanged: provider.onclient,
          ),
          const SizedBox(height: Dimen.space * 2),
          const AppSubCaptionText(data: 'REPORT DATE'),
          const SizedBox(height: Dimen.space),
          Row(children: [
            Expanded(
              flex: 2,
              child: AppDatePicker(
                height: 50,
                dateTime: logic.reportedDate,
                firstDate: DateTime.now(),
                lastDate: DateTime(3000),
                onPicked: provider.onReportedDate,
                onDelete: () {},
              ),
            ),
            const Spacer(),
          ]),
          const SizedBox(height: Dimen.space * 2),
          const AltFlowField(),
          const SizedBox(height: Dimen.space * 2),
          Row(children: [
            const Spacer(flex: 3),
            Expanded(
              child: PrimaryButton(
                text: 'Cancel',
                borderRadius: radius8,
                color: AppColors.white,
                fontColor: AppColors.grey,
                onTap: () => navigator?.pop(),
              ),
            ),
            const SizedBox(width: Dimen.space * 2),
            Expanded(
              child: PrimaryButton(
                text: 'Update',
                borderRadius: radius8,
                onTap: _onUpdate,
              ),
            )
          ]),
        ]),
      ),
    );
  }
}
