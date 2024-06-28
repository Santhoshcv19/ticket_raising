// ignore_for_file: unused_result

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

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
import 'package:ticket_raising_management/core/widgets/date_picker.dart';
import 'package:ticket_raising_management/features/tickets/domain/usecase/params.dart';
import 'package:ticket_raising_management/features/tickets/presentation/logic/others/logic.dart';
import 'package:ticket_raising_management/features/tickets/presentation/logic/provider.dart';
import 'package:ticket_raising_management/features/tickets/presentation/widgets/create_ticket_dropdown.dart';

class HmsAddTicket extends ConsumerStatefulWidget {
  const HmsAddTicket({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HmsAddTicketState();
}

class _HmsAddTicketState extends ConsumerState<HmsAddTicket> {
  Future<void> _onCreate() async {
    final fileProvider = ref.read(fileNotifier);
    final provider = ref.read(ticketLogic);

    final notifier = ref.read(addTicketNotifier.notifier);

    if (provider.type == null) return Utils.toast('Type required');

    final validate = provider.key.currentState?.validate() ?? false;

    if (!validate) return;

    if (provider.priority == null) return Utils.toast('Priority required');
    if (provider.category == null) return Utils.toast('Category required');

    final files = fileProvider.whenOrNull(file: (data) => data);

    int sla = 0;

    if (provider.priority == 1) sla = 60;
    if (provider.priority == 2) sla = 30;
    if (provider.priority == 3) sla = 15;

    final user = appController.user;

    var params = TicketParams(
      type: provider.type,
      title: provider.title.text,
      ticketDescription: provider.description.text,
      priority: provider.priority,
      category: provider.category,
      technicalAssingned: null,
      client: user?.organizationId,
      sla: sla,
      // sla: int.parse(masterProvider.slaTime.text),
      ticketStatus: 1,
      reportedDate: provider.reportedDate.millisecondsSinceEpoch,
      createdAt: Utils.getTimeStamp(),
      channel: int.tryParse(appController.channel ?? ''),
      attachments: files,
      altflow: provider.altflow.text,
      createdBy: user?.iD,
    );

    await notifier.addTicket(params);
  }

  @override
  void initState() {
    final provider = ref.read(ticketLogic);
    ref.refresh(fileNotifier.notifier);
    provider.clearFields();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.read(ticketLogic);
    final logic = ref.watch(ticketLogic);

    ref.listen(addTicketNotifier, (previous, next) {
      next.whenOrNull(
        loading: () => Utils.showLoader(context),
        data: () {
          Utils.dismissLoader(context);
          navigator?.pop();
        },
        error: () {
          Utils.dismissLoader(context);
          Utils.toast('Error Creating Ticket');
        },
      );
    });

    return Card(
      shape: const RoundedRectangleBorder(),
      elevation: 0,
      margin: EdgeInsets.zero,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Form(
        key: provider.key,
        child: ListView(padding: Dimen.scaffoldMargin, children: [
          const Row(children: [
            AppSubBodyText(data: 'Create Ticket', fontWeight: FontWeight.bold),
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
                text: 'Create',
                borderRadius: radius8,
                onTap: _onCreate,
              ),
            )
          ]),
        ]),
      ),
    );
  }
}
